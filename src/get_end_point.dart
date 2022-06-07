String getEndPoint(String line) {
  int start = line.indexOf("'") + 1;
  int end = line.lastIndexOf("'");
  return line.substring(start, end);
}