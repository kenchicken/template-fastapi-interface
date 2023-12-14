---
to: "<%= struct.generateEnable ? `${rootDirectory}/backend/app/models/${struct.name.lowerSnakeName}.py` : null %>"
force: true
---
from sqlalchemy import Column, String, Integer, Text, DateTime, Boolean, ForeignKey
from sqlalchemy.types import TIMESTAMP
from sqlalchemy.orm import relationship
from database import Base
from models.mixins import TimestampMixin


class <%= struct.name.pascalName %>(Base, TimestampMixin):
    __tablename__ = '<%= struct.name.lowerSnakePluralName %>'

<%_ struct.fields.forEach(function (field, key) { -%>
  <%_ if (field.name.lowerSnakeName === 'id') { -%>
    <%_ if (field.dataType === 'string') { -%>
    <%= field.name.lowerSnakeName %> = Column(String, primary_key=True, index=True)
    <%_ } -%>
    <%_ if (field.dataType === 'number') { -%>
    <%= field.name.lowerSnakeName %> = Column(Integer, primary_key=True, index=True, autoincrement=True)
    <%_ } -%>
  <%_ } -%>
  <%_ if (field.name.lowerSnakeName !== 'id') { -%>
    <%_ if (field.dataType === 'string') { -%>
    <%= field.name.lowerSnakeName %> = Column(String)
    <%_ } -%>
    <%_ if (field.dataType === 'number') { -%>
    <%= field.name.lowerSnakeName %> = Column(Integer)
    <%_ } -%>
    <%_ if (field.dataType === 'time') { -%>
    <%= field.name.lowerSnakeName %> = Column(type_=TIMESTAMP(timezone=True))
    <%_ } -%>
    <%_ if (field.dataType === 'bool') { -%>
    <%= field.name.lowerSnakeName %> = Column(Boolean)
    <%_ } -%>
  <%_ } -%>
<%_ }) -%>

  def to_dict(self):
    return {
<%_ struct.fields.forEach(function (field, key) { -%>
      "<%= field.name.lowerCamelName %>": self.<%= field.name.lowerSnakeName %>,
<%_ }) -%>
    }
