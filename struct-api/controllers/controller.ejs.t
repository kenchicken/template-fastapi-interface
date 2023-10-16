---
to: "<%= struct.generateEnable ? `${rootDirectory}/backend/app/controllers/${struct.name.lowerSnakeName}_controller.py` : null %>"
force: true
---
import logging
from sqlalchemy.ext.asyncio import AsyncSession

from cruds import <%= struct.name.lowerSnakeName %> as crud
from schemas import <%= struct.name.lowerSnakeName %> as <%= struct.name.lowerSnakeName %>_schema
from models import <%= struct.name.lowerSnakeName %> as <%= struct.name.lowerSnakeName %>_model

logger = logging.getLogger(__name__)


async def list_<%= struct.name.lowerSnakePluralName %>(
        db: AsyncSession,
        condition: <%= struct.name.lowerSnakeName %>_schema.<%= struct.name.pascalName %>Condition,
) -> list[<%= struct.name.lowerSnakeName %>_model.<%= struct.name.pascalName %>]:
    return await crud.list_<%= struct.name.lowerSnakePluralName %>(db, condition)


async def get_<%= struct.name.lowerSnakeName %>(
        db: AsyncSession,
        <%= struct.name.lowerSnakeName %>_id: int
) -> <%= struct.name.lowerSnakeName %>_model.<%= struct.name.pascalName %>:
    return await crud.get_<%= struct.name.lowerSnakeName %>(db, <%= struct.name.lowerSnakeName %>_id)


async def create_<%= struct.name.lowerSnakeName %>(
        db: AsyncSession,
        <%= struct.name.lowerSnakeName %>_request: <%= struct.name.lowerSnakeName %>_schema.<%= struct.name.pascalName %>Request
) -> <%= struct.name.lowerSnakeName %>_model.<%= struct.name.pascalName %>:
    return await crud.create_<%= struct.name.lowerSnakeName %>(db, <%= struct.name.lowerSnakeName %>_request)


async def update_<%= struct.name.lowerSnakeName %>(
        db: AsyncSession,
        <%= struct.name.lowerSnakeName %>_id: int,
        <%= struct.name.lowerSnakeName %>_request: <%= struct.name.lowerSnakeName %>_schema.<%= struct.name.pascalName %>Request
) -> <%= struct.name.lowerSnakeName %>_model.<%= struct.name.pascalName %> | None:
    original = await crud.get_<%= struct.name.lowerSnakeName %>(db, <%= struct.name.lowerSnakeName %>_id)
    if original is None:
        return None
    return await crud.update_<%= struct.name.lowerSnakeName %>(db, <%= struct.name.lowerSnakeName %>_request, original)


async def delete_<%= struct.name.lowerSnakeName %>(
        db: AsyncSession,
        <%= struct.name.lowerSnakeName %>_id: int
) -> int | None:
    original = await crud.get_<%= struct.name.lowerSnakeName %>(db, <%= struct.name.lowerSnakeName %>_id)
    if original is None:
        return None
    return await crud.delete_<%= struct.name.lowerSnakeName %>(db, original)
