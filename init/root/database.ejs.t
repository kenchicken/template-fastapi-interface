---
to: <%= rootDirectory %>/backend/database.py
force: true
---
from config import get_env
from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker

Engine = create_engine(get_env().database_url)
SessionLocal = sessionmaker(autocommit=False, autoflush=False, bind=Engine)


# Dependency
def get_db():
    db = SessionLocal()
    try:
        yield db
    finally:
        db.close()
