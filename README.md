# Learning CICD

This is a repository to document my CICD learning journey.

## Overview

The Dont Give Up quote app is a  beautiful Flask web application that displays random inspirational quotes to a learner motivated! Built with Python, Docker, and love 💜 — this project showcases containerization, frontend/backend integration, and a modern web design with dark mode support.

---

## Preview

![screenshot](./screenshots/app_preview.png)

---

## Features

- Flask backend serving random friendly quotes from a python list
- Responsive frontend with modern styling & dark mode
- Click to fetch new quotes via JavaScript (no page reload)
- Dockerized for portability and reproducibility
- Deployed via Docker Compose and extended with GitHub Actions CI/CD)

---

## 🛠️ Tech Stack

- **Frontend:** HTML5, CSS3, JavaScript
- **Backend:** Python 3.11 + Flask
- **Containerization:** Docker, Docker Compose
- **Version Control:** Git + GitHub
- **CI/CD:** GitHub Actions, Docker Hub, AWS ECS

---

## Getting Started

### 1. Clone the repository

```bash
git clone https://github.com/yourusername/devops-inspiration.git
cd devops-inspiration

### 2. Build and Run with Docker Compose

```bash
docker-compose up --build -d

Visit the app at: http://localhost:5000

