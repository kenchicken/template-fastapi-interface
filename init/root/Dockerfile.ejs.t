---
to: <%= rootDirectory %>/backend/Dockerfile
force: true
---
FROM python:3.11.5-slim
ENV PYTHONUNBUFFERED=1

WORKDIR /backend

RUN pip install poetry

COPY pyproject.toml* poetry.lock* ./

RUN poetry config virtualenvs.create false
RUN if [ -f pyproject.toml ]; then poetry install --no-root; fi

WORKDIR /backend/app

ENTRYPOINT ["poetry", "run", "uvicorn", "main:app", "--host", "0.0.0.0", "--reload", "--log-config", "log_conf.yaml"]
