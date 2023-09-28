---
to: <%= rootDirectory %>/backend/main.py
inject: true
skip_if: "# api routers for <%= struct.name.lowerCamelName %>"
after: "# define api routers"
---
# api routers for <%= struct.name.lowerCamelName %>
app.include_router(<%= struct.name.lowerCamelName %>.router, prefix="/api/v1")