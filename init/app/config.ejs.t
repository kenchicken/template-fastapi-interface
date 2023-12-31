---
to: <%= rootDirectory %>/backend/app/config.py
force: true
---
import os
from functools import lru_cache
from pydantic_settings import BaseSettings

PROJECT_ROOT = os.path.dirname(os.path.join(os.path.dirname(__file__), '../..'))


class Environment(BaseSettings):
    """ 環境変数を読み込む
    """
    database_url: str
    migration_url: str

    class Config:
        env_file = os.path.join(PROJECT_ROOT, '.env')


@lru_cache
def get_env():
    """ @lru_cacheで.envの結果をキャッシュする
    """
    return Environment()
