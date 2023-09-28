---
to: <%= rootDirectory %>/docker-compose.yaml
force: true
---
version: '3'
services:
  backend:
    container_name: akd_backend
    build:
      context: "./backend"
      dockerfile: "Dockerfile"
    ports:
      - 8000:8000
      - 5678:5678
    volumes:
      - ./backend:/backend
    environment:
      - ENVIRON
    depends_on:
      - db
  db:
    image: postgres:15.4
    # host: postgres-db
    container_name: postgres_db
    environment:
      TZ: Asia/Tokyo
      POSTGRES_DB: postgres
      POSTGRES_USER: postgres
      POSTGRES_PASSWORD: password
    volumes:
      - postgres_data:/var/lib/postgresql/data/
    ports:
      - 5432:5432
volumes:
  postgres_data:
