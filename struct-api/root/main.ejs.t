---
to: "<%= struct.generateEnable ? `${rootDirectory}/main.py` : null %>"
inject: true
skip_if: # api for <%= struct.name.pascalName %>
after: # define api operations
---
# api for <%= struct.name.pascalName %>
@app.get('/<%= struct.name.lowerCamelPluralName %>', response_model=<%= struct.name.PascalPluralName %>)
def list_<%= struct.name.lowerCamelPluralName %>() -> <%= struct.name.PascalPluralName %>:
    """
    List all <%= struct.name.lowerCamelPluralName %>
    """
    pass

@app.post('/<%= struct.name.lowerCamelPluralName %>', response_model=<%= struct.name.PascalName %>)
def create_<%= struct.name.lowerCamelPluralName %>() -> <%= struct.name.PascalName %>:
    """
    Create <%= struct.name.lowerCamelName %>
    """
    pass
