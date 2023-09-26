---
to: <%= rootDirectory %>/pyproject.toml
force: true
---
[tool.poetry]
name = "<%= projectName %>"
version = "1.0"
description = ""
authors = ""
readme = "README.md"
packages = [{include = "<%= projectName %>"}]

[tool.poetry.dependencies]
python = "^3.11"
fastapi = "^0.91.0"
uvicorn = {extras = ["standard"], version = "^0.20.0"}
sqlalchemy = "^2.0.3"
pymysql = "^1.0.2"
aiomysql = "^0.1.1"


[tool.poetry.group.dev.dependencies]
pytest-asyncio = "^0.20.3"
aiosqlite = "^0.18.0"
httpx = "^0.23.3"

[build-system]
requires = ["poetry-core"]
build-backend = "poetry.core.masonry.api"
