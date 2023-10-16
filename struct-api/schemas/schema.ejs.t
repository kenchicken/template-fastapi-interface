---
to: "<%= struct.generateEnable ? `${rootDirectory}/backend/app/schemas/${struct.name.lowerSnakeName}.py` : null %>"
force: true
---
import datetime
from pydantic import BaseModel, Field


class <%= struct.name.pascalName %>Base(BaseModel):
<%_ struct.fields.forEach(function (field, key) { -%>
  <%_ if (field.name.lowerSnakeName !== 'id') { -%>
    <%_ if (field.dataType === 'string') { -%>
    <%= field.name.lowerSnakeName %>: str | None = Field(None, example="")
    <%_ } -%>
    <%_ if (field.dataType === 'number') { -%>
    <%= field.name.lowerSnakeName %>: int | None = Field(None, example=0)
    <%_ } -%>
    <%_ if (field.dataType === 'time') { -%>
    <%= field.name.lowerSnakeName %>: datetime.datetime | None = Field(None, example="")
    <%_ } -%>
    <%_ if (field.dataType === 'bool') { -%>
    <%= field.name.lowerSnakeName %>: bool | None = Field(None, example=True)
    <%_ } -%>
  <%_ } -%>
<%_ }) -%>


class <%= struct.name.pascalName %>Request(<%= struct.name.pascalName %>Base):
    pass


class <%= struct.name.pascalName %>Response(<%= struct.name.pascalName %>Request):
<%_ struct.fields.forEach(function (field, key) { -%>
  <%_ if (field.name.lowerSnakeName === 'id') { -%>
    <%_ if (field.dataType === 'string') { -%>
    <%= field.name.lowerSnakeName %>: str
    <%_ } -%>
    <%_ if (field.dataType === 'number') { -%>
    <%= field.name.lowerSnakeName %>: int
    <%_ } -%>
  <%_ } -%>
<%_ }) -%>

    class Config:
        from_attributes = True


class <%= struct.name.pascalName %>(<%= struct.name.pascalName %>Base):
<%_ struct.fields.forEach(function (field, key) { -%>
  <%_ if (field.name.lowerSnakeName === 'id') { -%>
  <%_ if (field.dataType === 'string') { -%>
    <%= field.name.lowerSnakeName %>: str
  <%_ } -%>
  <%_ if (field.dataType === 'number') { -%>
    <%= field.name.lowerSnakeName %>: int
  <%_ } -%>
  <%_ } -%>
<%_ }) -%>

    class Config:
        from_attributes = True


class <%= struct.name.pascalName %>Condition(<%= struct.name.pascalName %>Base):
    id: int | None = Field(None, example=0)


class <%= struct.name.pascalPluralName %>Response(BaseModel):
    <%= struct.name.lowerSnakePluralName %>: list[<%= struct.name.pascalName %>]
    count: int
