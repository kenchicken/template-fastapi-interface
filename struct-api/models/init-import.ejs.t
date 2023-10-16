---
to: <%= rootDirectory %>/backend/app/models/__init__.py
inject: true
skip_if: "# import model for <%= struct.name.lowerSnakeName %>"
after: "# import models"
---
# import model for <%= struct.name.lowerSnakeName %>
from models.<%= struct.name.lowerSnakeName %> import <%= struct.name.pascalName %>