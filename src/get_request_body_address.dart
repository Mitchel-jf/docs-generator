String getRequestBodyAddress(List<String> lines, String requestBodyName) {
  int addressIndex =
      lines.indexWhere((String line) => line.contains(requestBodyName));
  int addressStart = lines[addressIndex].indexOf("'") + 1;
  int addressEnd = lines[addressIndex].lastIndexOf("'");
  String requestBodyAddress =
      lines[addressIndex].substring(addressStart, addressEnd);
  requestBodyAddress = requestBodyAddress.replaceFirst(".", "middleware");
  requestBodyAddress = requestBodyAddress + ".js";
  return requestBodyAddress;
}