---
to: "<%= struct.generateEnable ? `${rootDirectory}/backend/app/routers/${struct.name.lowerCamelName}.py` : null %>"
force: true
---
import logging
from fastapi import APIRouter, Depends, HTTPException
from sqlalchemy.ext.asyncio import AsyncSession

import schemas.<%= struct.name.lowerCamelName %> as <%= struct.name.lowerCamelName %>_schema
from controllers import <%= struct.name.lowerCamelName %>_controller as <%= struct.name.lowerCamelName %>_controller
from database import get_db

router = APIRouter()
logger = logging.getLogger(__name__)


@router.get('/<%= struct.name.lowerCamelPluralName %>', tags=['<%= struct.name.lowerCamelName %>'], response_model=<%= struct.name.lowerCamelName %>_schema.<%= struct.name.pascalPluralName %>Response)
async def list_<%= struct.name.lowerCamelPluralName %>(
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
    List all <%= struct.name.lowerCamelPluralName %>
    """
    condition = <%= struct.name.lowerCamelName %>_schema.<%= struct.name.pascalName %>Condition(
<%_ struct.fields.forEach(function (field, key) { -%>
        <%= field.name.lowerCamelName %>=<%= field.name.lowerCamelName %>,
<%_ }) -%>
    )
    <%= struct.name.lowerCamelPluralName %> = await <%= struct.name.lowerCamelName %>_controller.list_<%= struct.name.lowerCamelPluralName %>(db, condition)
    return <%= struct.name.lowerCamelName %>_schema.<%= struct.name.pascalPluralName %>Response(**{
        "<%= struct.name.lowerCamelPluralName %>": <%= struct.name.lowerCamelPluralName %>,
        "count": len(<%= struct.name.lowerCamelPluralName %>)
    })


@router.get('/<%= struct.name.lowerCamelName %>/{<%= struct.name.lowerCamelName %>_id}', tags=['<%= struct.name.lowerCamelName %>'], response_model=<%= struct.name.lowerCamelName %>_schema.<%= struct.name.pascalName %>)
async def get_<%= struct.name.lowerCamelName %>(
        <%= struct.name.lowerCamelName %>_id: int,
        db: AsyncSession = Depends(get_db)
):
    """
    Get <%= struct.name.lowerCamelName %> by id
    """
    <%= struct.name.lowerCamelName %> = await <%= struct.name.lowerCamelName %>_controller.get_<%= struct.name.lowerCamelName %>(db, <%= struct.name.lowerCamelName %>_id)
    if <%= struct.name.lowerCamelName %> is None:
        raise HTTPException(status_code=404, detail='<%= struct.name.lowerCamelName %> not found')
    return <%= struct.name.lowerCamelName %>


@router.post('/<%= struct.name.lowerCamelName %>', tags=['<%= struct.name.lowerCamelName %>'], response_model=<%= struct.name.lowerCamelName %>_schema.<%= struct.name.pascalName %>)
async def create_<%= struct.name.lowerCamelName %>(
        <%= struct.name.lowerCamelName %>: <%= struct.name.lowerCamelName %>_schema.<%= struct.name.pascalName %>Request,
        db: AsyncSession = Depends(get_db)
):
    """
    Create <%= struct.name.lowerCamelName %>
    """
    return await <%= struct.name.lowerCamelName %>_controller.create_<%= struct.name.lowerCamelName %>(db, <%= struct.name.lowerCamelName %>)


@router.put('/<%= struct.name.lowerCamelName %>/{<%= struct.name.lowerCamelName %>_id}', tags=['<%= struct.name.lowerCamelName %>'], response_model=<%= struct.name.lowerCamelName %>_schema.<%= struct.name.pascalName %>)
async def update_<%= struct.name.lowerCamelName %>(
        <%= struct.name.lowerCamelName %>_id: int,
        <%= struct.name.lowerCamelName %>: <%= struct.name.lowerCamelName %>_schema.<%= struct.name.pascalName %>Request,
        db: AsyncSession = Depends(get_db)
):
    """
    Update <%= struct.name.lowerCamelName %>
    """
    <%= struct.name.lowerCamelName %> = await <%= struct.name.lowerCamelName %>_controller.update_<%= struct.name.lowerCamelName %>(db, <%= struct.name.lowerCamelName %>_id, <%= struct.name.lowerCamelName %>)
    if <%= struct.name.lowerCamelName %> is None:
        raise HTTPException(status_code=404, detail='<%= struct.name.lowerCamelName %> not found')
    return <%= struct.name.lowerCamelName %>


@router.delete('/<%= struct.name.lowerCamelName %>/{<%= struct.name.lowerCamelName %>_id}', tags=['<%= struct.name.lowerCamelName %>'])
async def delete_<%= struct.name.lowerCamelName %>(
        <%= struct.name.lowerCamelName %>_id: int,
        db: AsyncSession = Depends(get_db)
) -> int | None:
    """
    Delete <%= struct.name.lowerCamelName %> by id
    """
    delete_id = await <%= struct.name.lowerCamelName %>_controller.delete_<%= struct.name.lowerCamelName %>(db, <%= struct.name.lowerCamelName %>_id)
    if delete_id is None:
        raise HTTPException(status_code=404, detail='<%= struct.name.lowerCamelName %> not found')
    return delete_id
