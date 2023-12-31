---
to: "<%= struct.generateEnable ? `${rootDirectory}/backend/app/routers/${struct.name.lowerSnakeName}.py` : null %>"
force: true
---
import logging
import datetime
from fastapi import APIRouter, Depends, HTTPException
from sqlalchemy.ext.asyncio import AsyncSession
from typing import Annotated
from schemas import auth as schema_auth

import schemas.<%= struct.name.lowerSnakeName %> as <%= struct.name.lowerSnakeName %>_schema
from controllers import <%= struct.name.lowerSnakeName %>_controller as <%= struct.name.lowerSnakeName %>_controller
from database import get_db

router = APIRouter()
logger = logging.getLogger(__name__)


@router.get('/<%= struct.name.lowerCamelPluralName %>', tags=['<%= struct.name.lowerSnakeName %>'], response_model=<%= struct.name.lowerSnakeName %>_schema.<%= struct.name.pascalPluralName %>Response)
async def list_<%= struct.name.lowerSnakePluralName %>(
        token: Annotated[str, Depends(schema_auth.oauth2_scheme)],
<%_ struct.fields.forEach(function (field, key) { -%>
  <%_ if (field.dataType === 'string') { -%>
        <%= field.name.lowerCamelName %>: str = None,
  <%_ } -%>
  <%_ if (field.dataType === 'number') { -%>
        <%= field.name.lowerCamelName %>: int = None,
  <%_ } -%>
  <%_ if (field.dataType === 'time') { -%>
        <%= field.name.lowerCamelName %>: datetime.datetime = None,
  <%_ } -%>
  <%_ if (field.dataType === 'bool') { -%>
        <%= field.name.lowerCamelName %>: bool = None,
  <%_ } -%>
<%_ }) -%>
        db: AsyncSession = Depends(get_db)
):
    """
    List all <%= struct.name.lowerSnakePluralName %>
    """
    condition = <%= struct.name.lowerSnakeName %>_schema.<%= struct.name.pascalName %>Condition(
<%_ struct.fields.forEach(function (field, key) { -%>
        <%= field.name.lowerCamelName %>=<%= field.name.lowerCamelName %>,
<%_ }) -%>
    )
    <%= struct.name.lowerSnakePluralName %> = await <%= struct.name.lowerSnakeName %>_controller.list_<%= struct.name.lowerSnakePluralName %>(db, condition)
    schema_<%= struct.name.lowerSnakePluralName %> = []
    for <%= struct.name.lowerSnakeName %> in <%= struct.name.lowerSnakePluralName %>:
        schema_<%= struct.name.lowerSnakeName %> = {
<%_ struct.fields.forEach(function (field, key) { -%>
            '<%= field.name.lowerCamelName %>': <%= struct.name.lowerSnakeName %>.<%= field.name.lowerSnakeName %>,
<%_ }) -%>
        }
        schema_<%= struct.name.lowerSnakePluralName %>.append(schema_<%= struct.name.lowerSnakeName %>)
    return <%= struct.name.lowerSnakeName %>_schema.<%= struct.name.pascalPluralName %>Response(**{
        "<%= struct.name.lowerCamelPluralName %>": schema_<%= struct.name.lowerSnakePluralName %>,
        "count": len(<%= struct.name.lowerSnakePluralName %>)
    })


@router.get('/<%= struct.name.lowerCamelName %>/{<%= struct.name.lowerSnakeName %>_id}', tags=['<%= struct.name.lowerSnakeName %>'], response_model=<%= struct.name.lowerSnakeName %>_schema.<%= struct.name.pascalName %>)
async def get_<%= struct.name.lowerSnakeName %>(
        token: Annotated[str, Depends(schema_auth.oauth2_scheme)],
        <%= struct.name.lowerSnakeName %>_id: int,
        db: AsyncSession = Depends(get_db)
):
    """
    Get <%= struct.name.lowerSnakeName %> by id
    """
    <%= struct.name.lowerSnakeName %> = await <%= struct.name.lowerSnakeName %>_controller.get_<%= struct.name.lowerSnakeName %>(db, <%= struct.name.lowerSnakeName %>_id)
    if <%= struct.name.lowerSnakeName %> is None:
        raise HTTPException(status_code=404, detail='<%= struct.name.lowerSnakeName %> not found')
    return {
<%_ struct.fields.forEach(function (field, key) { -%>
        '<%= field.name.lowerCamelName %>': <%= struct.name.lowerSnakeName %>.<%= field.name.lowerSnakeName %>,
<%_ }) -%>
    }


@router.post('/<%= struct.name.lowerCamelName %>', tags=['<%= struct.name.lowerSnakeName %>'], response_model=<%= struct.name.lowerSnakeName %>_schema.<%= struct.name.pascalName %>)
async def create_<%= struct.name.lowerSnakeName %>(
        token: Annotated[str, Depends(schema_auth.oauth2_scheme)],
        <%= struct.name.lowerSnakeName %>: <%= struct.name.lowerSnakeName %>_schema.<%= struct.name.pascalName %>Request,
        db: AsyncSession = Depends(get_db)
):
    """
    Create <%= struct.name.lowerSnakeName %>
    """
    return await <%= struct.name.lowerSnakeName %>_controller.create_<%= struct.name.lowerSnakeName %>(db, <%= struct.name.lowerSnakeName %>)


@router.put('/<%= struct.name.lowerCamelName %>/{<%= struct.name.lowerSnakeName %>_id}', tags=['<%= struct.name.lowerSnakeName %>'], response_model=<%= struct.name.lowerSnakeName %>_schema.<%= struct.name.pascalName %>)
async def update_<%= struct.name.lowerSnakeName %>(
        token: Annotated[str, Depends(schema_auth.oauth2_scheme)],
        <%= struct.name.lowerSnakeName %>_id: int,
        <%= struct.name.lowerSnakeName %>: <%= struct.name.lowerSnakeName %>_schema.<%= struct.name.pascalName %>Request,
        db: AsyncSession = Depends(get_db)
):
    """
    Update <%= struct.name.lowerSnakeName %>
    """
    <%= struct.name.lowerSnakeName %> = await <%= struct.name.lowerSnakeName %>_controller.update_<%= struct.name.lowerSnakeName %>(db, <%= struct.name.lowerSnakeName %>_id, <%= struct.name.lowerSnakeName %>)
    if <%= struct.name.lowerSnakeName %> is None:
        raise HTTPException(status_code=404, detail='<%= struct.name.lowerSnakeName %> not found')
    return <%= struct.name.lowerSnakeName %>


@router.delete('/<%= struct.name.lowerCamelName %>/{<%= struct.name.lowerSnakeName %>_id}', tags=['<%= struct.name.lowerSnakeName %>'])
async def delete_<%= struct.name.lowerSnakeName %>(
        token: Annotated[str, Depends(schema_auth.oauth2_scheme)],
        <%= struct.name.lowerSnakeName %>_id: int,
        db: AsyncSession = Depends(get_db)
) -> int | None:
    """
    Delete <%= struct.name.lowerSnakeName %> by id
    """
    delete_id = await <%= struct.name.lowerSnakeName %>_controller.delete_<%= struct.name.lowerSnakeName %>(db, <%= struct.name.lowerSnakeName %>_id)
    if delete_id is None:
        raise HTTPException(status_code=404, detail='<%= struct.name.lowerSnakeName %> not found')
    return delete_id
