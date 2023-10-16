---
to: <%= rootDirectory %>/backend/app/main.py
inject: true
skip_if: "# import api routers for <%= struct.name.lowerSnakeName %>"
after: "# import api routers"
---
  # import api routers for <%= struct.name.lowerSnakeName %>
  <%= struct.name.lowerSnakeName %>,