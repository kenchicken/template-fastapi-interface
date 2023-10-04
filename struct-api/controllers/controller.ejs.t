---
to: "<%= struct.generateEnable ? `${rootDirectory}/backend/app/controllers/${struct.name.lowerCamelName}_controller.py` : null %>"
force: true
---
import logging
from sqlalchemy.ext.asyncio import AsyncSession

from cruds import <%= struct.name.lowerCamelName %> as crud
from schemas import <%= struct.name.lowerCamelName %> as <%= struct.name.lowerCamelName %>_schema
from models import <%= struct.name.lowerCamelName %> as <%= struct.name.lowerCamelName %>_model

logger = logging.getLogger(__name__)


async def list_<%= struct.name.lowerCamelPluralName %>(
        db: AsyncSession,
) -> list[<%= struct.name.lowerCamelName %>_model.<%= struct.name.pascalName %>]:
    return await crud.list_<%= struct.name.lowerCamelPluralName %>(db)


async def get_<%= struct.name.lowerCamelName %>(
        db: AsyncSession,
        <%= struct.name.lowerCamelName %>_id: int
) -> <%= struct.name.lowerCamelName %>_model.<%= struct.name.pascalName %>:
    return await crud.get_<%= struct.name.lowerCamelName %>(db, <%= struct.name.lowerCamelName %>_id)


async def create_<%= struct.name.lowerCamelName %>(
        db: AsyncSession,
        <%= struct.name.lowerCamelName %>_request: <%= struct.name.lowerCamelName %>_schema.<%= struct.name.pascalName %>Request
) -> <%= struct.name.lowerCamelName %>_model.<%= struct.name.pascalName %>:
    return await crud.create_<%= struct.name.lowerCamelName %>(db, <%= struct.name.lowerCamelName %>_request)


async def update_<%= struct.name.lowerCamelName %>(
        db: AsyncSession,
        <%= struct.name.lowerCamelName %>_id: int,
        <%= struct.name.lowerCamelName %>_request: <%= struct.name.lowerCamelName %>_schema.<%= struct.name.pascalName %>Request
) -> <%= struct.name.lowerCamelName %>_model.<%= struct.name.pascalName %> | None:
    original = await crud.get_<%= struct.name.lowerCamelName %>(db, <%= struct.name.lowerCamelName %>_id)
    if original is None:
        return None
    return await crud.update_<%= struct.name.lowerCamelName %>(db, <%= struct.name.lowerCamelName %>_request, original)


async def delete_<%= struct.name.lowerCamelName %>(
        db: AsyncSession,
        <%= struct.name.lowerCamelName %>_id: int
):
    original = await crud.get_<%= struct.name.lowerCamelName %>(db, <%= struct.name.lowerCamelName %>_id)
    if original is None:
        return None
    return await crud.delete_<%= struct.name.lowerCamelName %>(db, original)
