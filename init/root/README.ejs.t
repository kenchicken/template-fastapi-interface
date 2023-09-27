---
to: <%= rootDirectory %>/backend/README.md
force: true
---
README
## ローカルでの起動方法

pyenv install --list
pyenv install 3.11.x
pyenv global 3.11.x

- 既に違うバージョンの仮想環境にいる場合には一度削除する

```shell
conda deactivate
rm -rf .env
```

- 新しいバージョンのPythonで仮想環境を作り直す

```shell
python -m venv .venv
source .venv/bin/activate
```

- poetry管理しているライブラリーをインストールする

```shell
(.venv)% pip install --upgrade pip
(.venv)% pip install poetry
(.venv)% cd backend
(.venv)% poetry install --no-root
(.venv)% poetry run uvicorn main:app --host 0.0.0.0 --reload
```