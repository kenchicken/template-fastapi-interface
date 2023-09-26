---
to: "<%= struct.generateEnable ? `${rootDirectory}/api/routers/${struct.name.lowerCamelName}.py` : null %>"
force: true
---
from fastapi import APIRouter, Depends, HTTPException

import api.schemas.<%= struct.name.lowerCamelName %> as <%= struct.name.lowerCamelName %>_schema

router = APIRouter()


@router.get('/<%= struct.name.lowerCamelPluralName %>', response_model=list[<%= struct.name.lowerCamelName %>_schema.<%= struct.name.pascalName %>])
def list_<%= struct.name.lowerCamelPluralName %>():
    """
    List all <%= struct.name.lowerCamelPluralName %>
    """
    return []


@router.get('/<%= struct.name.lowerCamelPluralName %>/{<%= struct.name.lowerCamelName %>_id}', response_model=<%= struct.name.lowerCamelName %>_schema.<%= struct.name.pascalName %>)
def get_<%= struct.name.lowerCamelName %>(<%= struct.name.lowerCamelName %>_id: int):
    """
    Get <%= struct.name.lowerCamelName %> by id
    """
    return {}


@router.post('/<%= struct.name.lowerCamelPluralName %>', response_model=<%= struct.name.lowerCamelName %>_schema.<%= struct.name.pascalName %>)
def create_<%= struct.name.lowerCamelName %>(<%= struct.name.lowerCamelName %>: <%= struct.name.lowerCamelName %>_schema.<%= struct.name.pascalName %>):
    """
    Create <%= struct.name.lowerCamelName %>
    """
    return {}


@router.put('/<%= struct.name.lowerCamelPluralName %>/{<%= struct.name.lowerCamelName %>_id}', response_model=<%= struct.name.lowerCamelName %>_schema.<%= struct.name.pascalName %>)
def update_<%= struct.name.lowerCamelName %>(<%= struct.name.lowerName %>_id: int, <%= struct.name.lowerCamelName %>: <%= struct.name.lowerCamelName %>_schema.<%= struct.name.pascalName %>):
    """
    Update <%= struct.name.lowerCamelName %>
    """
    return {}


@router.delete('/<%= struct.name.lowerCamelPluralName %>/{<%= struct.name.lowerCamelName %>_id}')
def delete_<%= struct.name.lowerCamelName %>(<%= struct.name.lowerCamelName %>_id: int):
    """
    Delete <%= struct.name.lowerCamelName %> by id
    """
    return

