---
to: <%= rootDirectory %>/backend/app/main.py
inject: true
skip_if: "# import api routers for <%= struct.name.lowerCamelName %>"
after: "# import api routers"
---
  # import api routers for <%= struct.name.lowerCamelName %>
  <%= struct.name.lowerCamelName %>,