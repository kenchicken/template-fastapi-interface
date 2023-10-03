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


@router.get('/<%= struct.name.lowerCamelName %>', tags=['<%= struct.name.lowerCamelName %>'], response_model=list[<%= struct.name.lowerCamelName %>_schema.<%= struct.name.pascalName %>])
async def list_<%= struct.name.lowerCamelPluralName %>(
        db: AsyncSession = Depends(get_db)
):
    """
    List all <%= struct.name.lowerCamelPluralName %>
    """
    return await <%= struct.name.lowerCamelName %>_controller.list_<%= struct.name.lowerCamelPluralName %>(db)


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
        <%= struct.name.lowerCamelName %>: <%= struct.name.lowerCamelName %>_schema.<%= struct.name.pascalName %>,
        db: AsyncSession = Depends(get_db)
):
    """
    Create <%= struct.name.lowerCamelName %>
    """
    return await <%= struct.name.lowerCamelName %>_controller.create_<%= struct.name.lowerCamelName %>(db, <%= struct.name.lowerCamelName %>)


@router.put('/<%= struct.name.lowerCamelName %>/{<%= struct.name.lowerCamelName %>_id}', tags=['<%= struct.name.lowerCamelName %>'], response_model=<%= struct.name.lowerCamelName %>_schema.<%= struct.name.pascalName %>)
async def update_<%= struct.name.lowerCamelName %>(
        <%= struct.name.lowerName %>_id: int, <%= struct.name.lowerCamelName %>: <%= struct.name.lowerCamelName %>_schema.<%= struct.name.pascalName %>,
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
):
    """
    Delete <%= struct.name.lowerCamelName %> by id
    """
    delete_id = await <%= struct.name.lowerCamelName %>_controller.delete_<%= struct.name.lowerCamelName %>(db, <%= struct.name.lowerCamelName %>_id)
    if delete_id is None:
        raise HTTPException(status_code=404, detail='<%= struct.name.lowerCamelName %> not found')
    return delete_id
