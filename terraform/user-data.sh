#!/bin/bash
# ===========================================================================
# User Data Script - Sets up Manara Recipes on EC2 instances
# ===========================================================================
# This script runs when an EC2 instance starts and provisions a simple demo
# API used for local testing and health checks during infrastructure validation.

# Update the system
yum update -y

# Install required packages
yum install -y python3 python3-pip git docker

# Start and enable Docker
systemctl start docker
systemctl enable docker

# Add ec2-user to docker group (allows running docker without sudo)
usermod -a -G docker ec2-user

# Install Python dependencies
pip3 install fastapi uvicorn

# Create application directory
mkdir -p /opt/recipe-app
cd /opt/recipe-app

# Create the backend application file (simple demo API)
cat > backend.py << 'EOF'
from fastapi import FastAPI, HTTPException, Query
from fastapi.middleware.cors import CORSMiddleware
from pydantic import BaseModel
from typing import List, Optional
import uvicorn

app = FastAPI(title="Manara Recipes API", version="1.0.0")

# Enable CORS for frontend
app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

# Data models
class RecipeSummary(BaseModel):
    id: int
    title: str
    image: str
    imageType: str

class Recipe(BaseModel):
    id: int
    title: str
    summary: str

class SearchResponse(BaseModel):
    results: List[RecipeSummary]
    totalResults: int

# Mock data - For demo only
RECIPES = [
    {"id": 1, "title": "Classic Pasta Carbonara", "image": "https://picsum.photos/seed/pasta/400/300", "imageType": "jpg", "summary": "A traditional Italian pasta dish."},
    {"id": 2, "title": "Chicken Tikka Masala", "image": "https://picsum.photos/seed/chicken/400/300", "imageType": "jpg", "summary": "A popular spiced curry dish."}
]

favorites = []

@app.get("/")
async def root():
    return {"message": "Manara Recipes API is running!", "version": "1.0.0"}

@app.get("/health")
async def health_check():
    return {"status": "healthy", "environment": "${environment}"}

@app.get("/api/recipes/search", response_model=SearchResponse)
async def search_recipes(searchTerm: Optional[str] = Query(None), page: int = Query(1)):
    results = RECIPES
    if searchTerm:
        results = [r for r in RECIPES if searchTerm.lower() in r["title"].lower()]
    return SearchResponse(results=[RecipeSummary(**r) for r in results[:4]], totalResults=len(results))

@app.get("/api/recipes/{recipe_id}/summary", response_model=Recipe)
async def get_recipe_summary(recipe_id: int):
    recipe = next((r for r in RECIPES if r["id"] == recipe_id), None)
    if not recipe:
        raise HTTPException(status_code=404, detail="Recipe not found")
    return Recipe(id=recipe["id"], title=recipe["title"], summary=recipe["summary"])

@app.post("/api/recipes/favourite")
async def add_favorite(recipe: RecipeSummary):
    if not any(f["id"] == recipe.id for f in favorites):
        favorites.append(recipe.dict())
    return {"message": "Recipe added to favorites", "recipe": recipe}

@app.delete("/api/recipes/favourite")
async def remove_favorite(recipe: RecipeSummary):
    global favorites
    favorites = [f for f in favorites if f["id"] != recipe.id]
    return {"message": "Recipe removed from favorites"}

@app.get("/api/recipes/favourite", response_model=SearchResponse)
async def get_favorites():
    return SearchResponse(results=[RecipeSummary(**f) for f in favorites], totalResults=len(favorites))

if __name__ == "__main__":
    uvicorn.run(app, host="0.0.0.0", port=8000)
EOF

# Create a simple index.html for health check
cat > index.html << 'EOF'
<!DOCTYPE html>
<html>
<head>
    <title>Manara Recipes</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width,initial-scale=1" />
    <style>body{font-family: Arial, Helvetica, sans-serif; margin:40px;}</style>
</head>
<body>
    <h1>Manara Recipes is Running!</h1>
    <p>Environment: ${environment}</p>
    <p>API is available at /api/recipes/search</p>
    <p>Provisioned for Manara SAA submission.</p>
</body>
</html>
EOF

# Create systemd service for the application
cat > /etc/systemd/system/recipe-app.service << 'EOF'
[Unit]
Description=Manara Recipes Application
After=network.target

[Service]
Type=simple
User=ec2-user
WorkingDirectory=/opt/recipe-app
ExecStart=/usr/bin/python3 backend.py
Restart=always
RestartSec=10

[Install]
WantedBy=multi-user.target
EOF

# Set proper permissions
chown -R ec2-user:ec2-user /opt/recipe-app
chmod +x /opt/recipe-app/backend.py

# Enable and start the application service
systemctl daemon-reload
systemctl enable recipe-app
systemctl start recipe-app

# Install and configure CloudWatch agent (optional)
yum install -y amazon-cloudwatch-agent

# Log installation completion
echo "Manara Recipes installation completed at $(date)" >> /var/log/user-data.log
