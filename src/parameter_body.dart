String parameterBody(String parameter) {
  return '''
{
    "in": "body",
    "name": "$parameter",
    "description": "body value description",
    "required": true,
    "schema": {
      "type": "string"
    }
  }
''';
}
