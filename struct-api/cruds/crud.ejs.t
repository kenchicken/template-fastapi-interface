---
to: "<%= struct.generateEnable ? `${rootDirectory}/backend/app/cruds/${struct.name.lowerCamelName}.py` : null %>"
force: true
---
import logging

from sqlalchemy import select
from sqlalchemy.engine import Result
from sqlalchemy.ext.asyncio import AsyncSession

import models.<%= struct.name.lowerCamelName %> as <%= struct.name.lowerCamelName %>_model
import schemas.<%= struct.name.lowerCamelName %> as <%= struct.name.lowerCamelName %>_schema

logger = logging.getLogger(__name__)


async def list_<%= struct.name.lowerCamelPluralName %>(db: AsyncSession, condition: <%= struct.name.lowerCamelName %>_schema.<%= struct.name.pascalName %>Condition) -> list[<%= struct.name.lowerCamelName %>_model.<%= struct.name.pascalName %>]:
    filters = []
    conditions = condition.model_dump(exclude_none=True)
    for key, value in conditions.items():
        filters.append(getattr(<%= struct.name.lowerCamelName %>_model.<%= struct.name.pascalName %>, key) == value)
    result: Result = await db.execute(
        select(<%= struct.name.lowerCamelName %>_model.<%= struct.name.pascalName %>)
        .filter(*filters)
    )
    <%= struct.name.lowerCamelPluralName %> = result.scalars().all()
    return <%= struct.name.lowerCamelPluralName %>


async def get_<%= struct.name.lowerCamelName %>(db: AsyncSession, <%= struct.name.lowerCamelName %>_id: int) -> <%= struct.name.lowerCamelName %>_model.<%= struct.name.pascalName %> | None:
    result: Result = await db.execute(
        select(<%= struct.name.lowerCamelName %>_model.<%= struct.name.pascalName %>).filter(<%= struct.name.lowerCamelName %>_model.<%= struct.name.pascalName %>.id == <%= struct.name.lowerCamelName %>_id)
    )
    return result.scalars().first()


async def create_<%= struct.name.lowerCamelName %>(
    db: AsyncSession, <%= struct.name.lowerCamelName %>_create: <%= struct.name.lowerCamelName %>_schema.<%= struct.name.pascalName %>Request
) -> <%= struct.name.lowerCamelName %>_model.<%= struct.name.pascalName %>:
    <%= struct.name.lowerCamelName %> = <%= struct.name.lowerCamelName %>_model.<%= struct.name.pascalName %>(**<%= struct.name.lowerCamelName %>_create.model_dump())
    db.add(<%= struct.name.lowerCamelName %>)
    await db.commit()
    await db.refresh(<%= struct.name.lowerCamelName %>)
    return <%= struct.name.lowerCamelName %>


async def update_<%= struct.name.lowerCamelName %>(
    db: AsyncSession, <%= struct.name.lowerCamelName %>_create: <%= struct.name.lowerCamelName %>_schema.<%= struct.name.pascalName %>Request, original: <%= struct.name.lowerCamelName %>_model.<%= struct.name.pascalName %>
) -> <%= struct.name.lowerCamelName %>_model.<%= struct.name.pascalName %>:
<%_ struct.fields.forEach(function (field, key) { -%>
  <%_ if (field.name.lowerCamelName !== 'id') { -%>
    original.<%= field.name.lowerCamelName %> = <%= struct.name.lowerCamelName %>_create.<%= field.name.lowerCamelName %>
  <%_ } -%>
<%_ }) -%>
    db.add(original)
    await db.commit()
    await db.refresh(original)
    return original


async def delete_<%= struct.name.lowerCamelName %>(db: AsyncSession, original: <%= struct.name.lowerCamelName %>_model.<%= struct.name.pascalName %>) -> int | None:
    await db.delete(original)
    await db.commit()
    return original.id

