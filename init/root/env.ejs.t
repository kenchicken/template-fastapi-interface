---
to: <%= rootDirectory %>/backend/.env
force: true
---
DATABASE_URL=postgresql+asyncpg://postgres:password@postgres_db:5432/postgres
MIGRATION_URL=postgresql://postgres:password@postgres_db:5432/postgres
