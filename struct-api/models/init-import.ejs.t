---
to: <%= rootDirectory %>/backend/models/__init__.py
inject: true
skip_if: "# import model for <%= struct.name.lowerCamelName %>"
after: "# import models"
---
# import model for <%= struct.name.lowerCamelName %>
from models.<%= struct.name.lowerCamelName %> import <%= struct.name.pascalName %>