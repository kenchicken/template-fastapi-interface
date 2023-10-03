---
to: <%= rootDirectory %>/backend/app/database.py
force: true
---
from config import get_env
from sqlalchemy.ext.asyncio import create_async_engine, AsyncSession
from sqlalchemy.orm import sessionmaker, scoped_session, declarative_base

Engine = create_async_engine(get_env().database_url, echo=True)
SessionLocal = scoped_session(
    sessionmaker(
        autocommit=False,
        autoflush=False,
        bind=Engine,
        class_=AsyncSession
    ))

Base = declarative_base()


# Dependency
def get_db():
    try:
        db = SessionLocal()
        yield db
    finally:
        db.close()
