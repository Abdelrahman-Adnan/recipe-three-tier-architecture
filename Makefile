SHELL := /bin/bash
PYTHON := python3
VENV := .venv
NPM := npm

.PHONY: install install-backend install-frontend run-backend dev-frontend build-frontend up down help

install: install-backend install-frontend

install-backend:
	$(PYTHON) -m venv $(VENV) && . $(VENV)/bin/activate && $(PYTHON) -m pip install --upgrade pip && $(PYTHON) -m pip install -r backend/requirements.txt

run-backend:
	. $(VENV)/bin/activate && $(PYTHON) backend/main.py

install-frontend:
	cd frontend && $(NPM) install

dev-frontend:
	cd frontend && $(NPM) run dev

build-frontend:
	cd frontend && $(NPM) run build

up:
	docker-compose up --build

down:
	docker-compose down

help:
	@echo "Available make targets:"
	@echo "  install            - Install backend and frontend dependencies"
	@echo "  install-backend    - Create venv and install backend requirements"
	@echo "  run-backend        - Run the backend (uses virtualenv)"
	@echo "  install-frontend   - Install frontend npm packages"
	@echo "  dev-frontend       - Start frontend dev server (Vite)"
	@echo "  build-frontend     - Build frontend for production"
	@echo "  up                 - Start services with docker-compose"
	@echo "  down               - Stop docker-compose services"
