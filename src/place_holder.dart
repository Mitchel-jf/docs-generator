String get startingDocs => "{";
String get endingDocs => "}";
String endPointDocs(
  String endPoint, {
  String groupName = 'micro-service',
  String method = 'post',
  String lastComma = ",",
  String parameters = ""
}) {
  String s = endPoint.replaceFirst('/', '');
  String hyphenString = s.replaceAll('/', '-');

  return '''
  "/v1/$groupName$endPoint": {
    "$method": {
      "operationId": "$groupName-$hyphenString",
      "description": "description of the endpoint",
      "x-google-backend": {
        "address": "baseURl/v1$endPoint"
      },
      "parameters": [
        $parameters,
        {
          "in": "header",
          "name": "authtoken",
          "type": "string",
          "required": true
        },
        {
          "in": "header",
          "name": "from",
          "type": "string",
          "required": true
        }
      ],
      "responses": {
        "200": {
          "description": "OK"
        },
        "400": {
          "description": "Failed - Client side error"
        },
        "404": {
          "description": "Failed - URL not found"
        },
        "500": {
          "description": "Failed - Server side error"
        },
        "default": {
          "description": "Unknown error"
        }
      }
    }
  }$lastComma
''';
}
