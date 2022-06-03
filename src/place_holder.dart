String get startingDocs => ''' 
swagger: "2.0"
info:
  title: Notification Service API
  version: 0.0.1
  description: Notification service api config

schemes:
  - "https"
consumes:
  - application/json
produces:
  - application/json

paths:
''';

String endPointDocs(String endPoint, {String groupName = 'micro-service', String method = 'post' }) {
  String s = endPoint.replaceFirst('/', '');
  String hyphenString = s.replaceAll('/', '-');
  String titleCase = hyphenString.toUpperCase(); // todo: convert to Paschal case
  return '''
  /v1/$groupName$endPoint:
    $method:
      operationId: "$hyphenString"
      x-google-backend:
        address: baseURl/v1$endPoint
      consumes:
        - application/json
      parameters:
        - in: body
          name: $hyphenString-request-body
         # description: The request body for this endpoint.
          schema:
            \$ref: "#/definitions/$titleCase-RequestBody"
        - in: header
          name: authtoken
          type: string
          required: true
        - in: header
          name: from
          type: string
          required: true
      responses:
        200:
          description: OK
        400:
          description: Failed - Client side error
        404:
          description: Failed - URL not found
        500:
          description: Failed - Server side error
        default:
          description: Unknown error
''';
}
