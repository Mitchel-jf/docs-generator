String getRequestBodyName(String bodyLine) {
  int startOfBodyName = bodyLine.indexOf('Validate');
  String line = bodyLine.substring(startOfBodyName);
  int endOfBodyName = line.indexOf(',');
  if (endOfBodyName == -1) endOfBodyName = line.indexOf(')');
  String requestBodyName = line.substring(0, endOfBodyName);
  return requestBodyName;
}