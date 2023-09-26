---
to: <%= rootDirectory %>/api/main.py
inject: true
skip_if: "# api routers for <%= struct.name.lowerCamelName %>"
after: "# define api routers"
---
 # api routers for <%= struct.name.lowerCamelName %>
 <%= struct.name.lowerCamelName %>,
