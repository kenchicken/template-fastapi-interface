---
to: <%= rootDirectory %>/main.py
force: true
---
from __future__ import annotations
from typing import Optional
from fastapi import FastAPI
from handler import *

app = FastAPI(
  version="1.0.0",
  title="<%= projectName %>",
)

# define api operations
