---
to: "<%= struct.generateEnable ? `${rootDirectory}/api/schemas/${struct.name.lowerCamelName}.py` : null %>"
force: true
---
import datetime
from pydantic import BaseModel, Field


class <%= struct.name.pascalName %>(BaseModel):
<%_ struct.fields.forEach(function (field, key) { -%>
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
    <%= field.name.lowerCamelName %>: bool | None = Field(None, example=true)
  <%_ } -%>
<%_ }) -%>

