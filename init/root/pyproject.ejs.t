---
to: <%= rootDirectory %>/backend/pyproject.toml
force: true
---
[tool.poetry]
name = "<%= projectName %>"
version = "1.0"
description = ""
authors = [""]
readme = "README.md"

[tool.poetry.dependencies]
python = "^3.11"
fastapi = "^0.103.0"
uvicorn = {extras = ["standard"], version = "^0.20.0"}
sqlalchemy = "^2.0.3"
pymysql = "^1.0.2"
aiomysql = "^0.1.1"
alembic = "^1.12.0"
psycopg2-binary = "^2.9.7"
requests = "^2.31.0"
python-dateutil = "^2.8.2"
python-multipart = "^0.0.6"
python-jose = "^3.3.0"
passlib = "^1.7.4"
pydantic-settings = "^2.0.3"
asyncpg = "^0.28.0"
stringcase = "^1.2.0"

[tool.poetry.group.dev.dependencies]
pytest-asyncio = "^0.20.3"
aiosqlite = "^0.18.0"
httpx = "^0.23.3"

[build-system]
requires = ["poetry-core"]
build-backend = "poetry.core.masonry.api"
