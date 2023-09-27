---
to: <%= rootDirectory %>/backend/entrypoint.sh
force: true
---
#!/bin/bash

# DB migrationを実行する
poetry run python -m migrate_cloud_db

# uvicornのサーバーを立ち上げる
poetry run uvicorn main:app --host 0.0.0.0 --reload
