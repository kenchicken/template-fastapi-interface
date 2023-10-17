---
to: "<%= struct.generateEnable ? `${rootDirectory}/backend/app/cruds/${struct.name.lowerSnakeName}.py` : null %>"
force: true
---
import logging

from sqlalchemy import select
from sqlalchemy.engine import Result
from sqlalchemy.ext.asyncio import AsyncSession

import models.<%= struct.name.lowerSnakeName %> as <%= struct.name.lowerSnakeName %>_model
import schemas.<%= struct.name.lowerSnakeName %> as <%= struct.name.lowerSnakeName %>_schema

logger = logging.getLogger(__name__)


async def list_<%= struct.name.lowerSnakePluralName %>(db: AsyncSession, condition: <%= struct.name.lowerSnakeName %>_schema.<%= struct.name.pascalName %>Condition) -> list[<%= struct.name.lowerSnakeName %>_model.<%= struct.name.pascalName %>]:
    filters = []
    conditions = condition.model_dump(exclude_none=True)
    for key, value in conditions.items():
        filters.append(getattr(<%= struct.name.lowerSnakeName %>_model.<%= struct.name.pascalName %>, key) == value)
    result: Result = await db.execute(
        select(<%= struct.name.lowerSnakeName %>_model.<%= struct.name.pascalName %>)
        .filter(*filters)
    )
    <%= struct.name.lowerSnakePluralName %> = result.scalars().all()
    return <%= struct.name.lowerSnakePluralName %>


async def get_<%= struct.name.lowerSnakeName %>(db: AsyncSession, <%= struct.name.lowerSnakeName %>_id: int) -> <%= struct.name.lowerSnakeName %>_model.<%= struct.name.pascalName %> | None:
    result: Result = await db.execute(
        select(<%= struct.name.lowerSnakeName %>_model.<%= struct.name.pascalName %>).filter(<%= struct.name.lowerSnakeName %>_model.<%= struct.name.pascalName %>.id == <%= struct.name.lowerSnakeName %>_id)
    )
    return result.scalars().first()


async def create_<%= struct.name.lowerSnakeName %>(
    db: AsyncSession, <%= struct.name.lowerSnakeName %>_create: <%= struct.name.lowerSnakeName %>_schema.<%= struct.name.pascalName %>Request
) -> <%= struct.name.lowerSnakeName %>_model.<%= struct.name.pascalName %>:
    <%= struct.name.lowerSnakeName %> = <%= struct.name.lowerSnakeName %>_model.<%= struct.name.pascalName %>(**<%= struct.name.lowerSnakeName %>_create.model_dump())
    db.add(<%= struct.name.lowerSnakeName %>)
    await db.commit()
    await db.refresh(<%= struct.name.lowerSnakeName %>)
    return <%= struct.name.lowerSnakeName %>


async def update_<%= struct.name.lowerSnakeName %>(
    db: AsyncSession, <%= struct.name.lowerSnakeName %>_create: <%= struct.name.lowerSnakeName %>_schema.<%= struct.name.pascalName %>Request, original: <%= struct.name.lowerSnakeName %>_model.<%= struct.name.pascalName %>
) -> <%= struct.name.lowerSnakeName %>_model.<%= struct.name.pascalName %>:
<%_ struct.fields.forEach(function (field, key) { -%>
  <%_ if (field.name.lowerSnakeName !== 'id') { -%>
    original.<%= field.name.lowerSnakeName %> = <%= struct.name.lowerSnakeName %>_create.<%= field.name.lowerSnakeName %>
  <%_ } -%>
<%_ }) -%>
    db.add(original)
    await db.commit()
    await db.refresh(original)
    return original


async def delete_<%= struct.name.lowerSnakeName %>(db: AsyncSession, original: <%= struct.name.lowerSnakeName %>_model.<%= struct.name.pascalName %>) -> int | None:
    await db.delete(original)
    await db.commit()
    return original.id

