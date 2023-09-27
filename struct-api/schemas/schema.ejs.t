---
to: "<%= struct.generateEnable ? `${rootDirectory}/backend/schemas/${struct.name.lowerCamelName}.py` : null %>"
force: true
---
import datetime
from pydantic import BaseModel, Field


class <%= struct.name.pascalName %>Base(BaseModel):
<%_ struct.fields.forEach(function (field, key) { -%>
  <%_ if (field.name !== 'id') { -%>
  <%_ if (field.dataType === 'string') { -%>
    <%= field.name.lowerCamelName %>: str | None = Field(None, example="")
  <%_ } -%>
  <%_ if (field.dataType === 'number') { -%>
    <%= field.name.lowerCamelName %>: int | None = Field(None, example=0)
  <%_ } -%>
  <%_ if (field.dataType === 'time') { -%>
    <%= field.name.lowerCamelName %>: datetime.time | None = Field(None, example="")
  <%_ } -%>
  <%_ if (field.dataType === 'bool') { -%>
    <%= field.name.lowerCamelName %>: bool | None = Field(None, example=True)
  <%_ } -%>
  <%_ } -%>
<%_ }) -%>


class <%= struct.name.pascalName %>Create(<%= struct.name.pascalName %>Base):
    pass


class <%= struct.name.pascalName %>CreateResponse(<%= struct.name.pascalName %>Create):
<%_ struct.fields.forEach(function (field, key) { -%>
  <%_ if (field.name === 'id') { -%>
  <%_ if (field.dataType === 'string') { -%>
    <%= field.name.lowerCamelName %>: str
  <%_ } -%>
  <%_ if (field.dataType === 'number') { -%>
    <%= field.name.lowerCamelName %>: int
  <%_ } -%>
  <%_ } -%>
<%_ }) -%>

    class Config:
        orm_mode = True


class <%= struct.name.pascalName %>(<%= struct.name.pascalName %>Base):
<%_ struct.fields.forEach(function (field, key) { -%>
  <%_ if (field.name === 'id') { -%>
  <%_ if (field.dataType === 'string') { -%>
    <%= field.name.lowerCamelName %>: str | None = Field(None, example="")
  <%_ } -%>
  <%_ if (field.dataType === 'number') { -%>
    <%= field.name.lowerCamelName %>: int | None = Field(None, example=0)
  <%_ } -%>
  <%_ } -%>
<%_ }) -%>

    class Config:
        orm_mode = True

