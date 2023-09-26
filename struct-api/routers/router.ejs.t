---
to: "<%= struct.generateEnable ? `${rootDirectory}/api/routers/<%= struct.name.lowerCamelName %>.py` : null %>"
force: true
---
from fastapi import APIRouter, Depends, HTTPException
from sqlalchemy.ext.asyncio import AsyncSession

import api.schemas.task as task_schema
import api.cruds.task as task_crud
from api.db import get_db

router = APIRouter()


@app.get('/<%= struct.name.lowerCamelPluralName %>', response_model=list[<%= struct.name.pascalPluralName %>])
def list_<%= struct.name.lowerCamelPluralName %>():
    """
    List all <%= struct.name.lowerCamelPluralName %>
    """
    return{"message":"list_<%= struct.name.lowerCamelPluralName %>"}


@app.get('/<%= struct.name.lowerCamelPluralName %>/{<%= struct.name.lowerCamelName %>_id}', response_model=<%= struct.name.pascalPluralName %>)
def get_<%= struct.name.lowerCamelName %>(<%= struct.name.lowerCamelName %>_id: int):
    """
    Get <%= struct.name.lowerCamelPluralName %> by id
    """
    return{"message":"get_<%= struct.name.lowerCamelPluralName %>"}


@app.post('/<%= struct.name.lowerCamelPluralName %>', response_model=<%= struct.name.pascalName %>)
def create_<%= struct.name.lowerCamelPluralName %>(<%= struct.name.lowerCamelPluralName %>: <%= struct.name.pascalName %>):
    """
    Create <%= struct.name.lowerCamelName %>
    """
    return{"message":"create_<%= struct.name.lowerCamelPluralName %>"}


@app.put('/<%= struct.name.lowerCamelPluralName %>/{<%= struct.name.lowerCamelName %>_id}', response_model=<%= struct.name.pascalName %>)
def update_<%= struct.name.lowerCamelPluralName %>(<%= struct.name.lowerCamelName %>_id: int):
    """
    Update <%= struct.name.lowerCamelName %>
    """
    return{"message":"update_<%= struct.name.lowerCamelPluralName %>"}


@app.delete('/<%= struct.name.lowerCamelPluralName %>/{<%= struct.name.lowerCamelName %>_id}')
def delete_<%= struct.name.lowerCamelName %>(<%= struct.name.lowerCamelName %>_id: int):
    """
    Delete <%= struct.name.lowerCamelPluralName %> by id
    """
    return{"message":"delete_<%= struct.name.lowerCamelPluralName %>"}

