---
to: <%= rootDirectory %>/backend/script/entrypoint.sh
force: true
---
#!/bin/bash

# DB migrationを実行する
poetry run alembic upgrade head

# uvicornのサーバーを立ち上げる
poetry run uvicorn main:app --reload --port=8000 --host=0.0.0.0 --log-config log_conf.yaml
