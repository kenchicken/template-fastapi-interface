---
to: <%= rootDirectory %>/backend/app/main.py
inject: true
skip_if: "# api routers for <%= struct.name.lowerSnakeName %>"
after: "# define api routers"
---
# api routers for <%= struct.name.lowerSnakeName %>
app.include_router(<%= struct.name.lowerSnakeName %>.router, prefix="/api/v1")