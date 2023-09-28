---
to: <%= rootDirectory %>/backend/Dockerfile
force: true
---
FROM python:3.11.5-slim
ENV PYTHONUNBUFFERED=1

WORKDIR /backend

RUN pip install poetry

COPY pyproject.toml* poetry.lock* ./

RUN poetry config virtualenvs.in-project true
RUN if [ -f pyproject.toml ]; then poetry install --no-root; fi

ENTRYPOINT ["poetry", "run", "uvicorn", "backend.main:app", "--host", "0.0.0.0", "--reload"]