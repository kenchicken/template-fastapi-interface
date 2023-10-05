---
to: "<%= struct.generateEnable ? `${rootDirectory}/backend/app/models/${struct.name.lowerCamelName}.py` : null %>"
force: true
---
from sqlalchemy import Column, String, Integer, Text, DateTime, Boolean, ForeignKey
from sqlalchemy.types import TIMESTAMP
from sqlalchemy.orm import relationship
from database import Base
from models.mixins import TimestampMixin


class <%= struct.name.pascalName %>(Base, TimestampMixin):
    __tablename__ = '<%= struct.name.lowerCamelPluralName %>'

<%_ struct.fields.forEach(function (field, key) { -%>
  <%_ if (field.name.lowerCamelName === 'id') { -%>
    <%_ if (field.dataType === 'string') { -%>
    <%= field.name.lowerCamelName %> = Column(String, primary_key=True, index=True)
    <%_ } -%>
    <%_ if (field.dataType === 'number') { -%>
    <%= field.name.lowerCamelName %> = Column(Integer, primary_key=True, index=True, autoincrement=True)
    <%_ } -%>
  <%_ } -%>
  <%_ if (field.name.lowerCamelName !== 'id') { -%>
    <%_ if (field.dataType === 'string') { -%>
    <%= field.name.lowerCamelName %> = Column(String)
    <%_ } -%>
    <%_ if (field.dataType === 'number') { -%>
    <%= field.name.lowerCamelName %> = Column(Integer)
    <%_ } -%>
    <%_ if (field.dataType === 'time') { -%>
    <%= field.name.lowerCamelName %> = Column(type_=TIMESTAMP(timezone=True))
    <%_ } -%>
    <%_ if (field.dataType === 'bool') { -%>
    <%= field.name.lowerCamelName %> = Column(Boolean)
    <%_ } -%>
  <%_ } -%>
<%_ }) -%>
