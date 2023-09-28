---
to: "<%= struct.generateEnable ? `${rootDirectory}/backend/models/${struct.name.lowerCamelName}.py` : null %>"
force: true
---
import datetime
from sqlalchemy import create_engine, Column, String, Integer, Text, DateTime, Boolean, ForeignKey
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy.orm import relationship

BaseModel = declarative_base()


class <%= struct.name.pascalName %>(BaseModel):
    __tablename__ = '<%= struct.name.lowerCamelPluralName %>'

<%_ struct.fields.forEach(function (field, key) { -%>
  <%_ if (field.name === 'id') { -%>
    <%_ if (field.dataType === 'string') { -%>
    <%= field.name.lowerCamelName %> = Column(String, primary_key=True, index=True)
    <%_ } -%>
    <%_ if (field.dataType === 'number') { -%>
    <%= field.name.lowerCamelName %> = Column(Integer, primary_key=True, index=True)
    <%_ } -%>
  <%_ } -%>
  <%_ if (field.name !== 'id') { -%>
  <%_ if (field.dataType === 'string') { -%>
    <%= field.name.lowerCamelName %> = Column(String)
  <%_ } -%>
  <%_ if (field.dataType === 'number') { -%>
    <%= field.name.lowerCamelName %> = Column(Integer)
  <%_ } -%>
  <%_ if (field.dataType === 'time') { -%>
    <%= field.name.lowerCamelName %> = Column(DateTime)
  <%_ } -%>
  <%_ if (field.dataType === 'bool') { -%>
    <%= field.name.lowerCamelName %> = Column(Boolean)
  <%_ } -%>
  <%_ } -%>
<%_ }) -%>
