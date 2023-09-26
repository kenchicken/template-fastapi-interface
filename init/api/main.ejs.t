---
to: <%= rootDirectory %>/api/main.py
force: true
---
from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware
from api.routers import (
  # import api routers
)


app = FastAPI()
# define api routers
app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"]
)
