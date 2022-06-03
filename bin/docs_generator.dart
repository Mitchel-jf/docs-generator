// ignore_for_file: curly_braces_in_flow_control_structures

import 'dart:convert';
import 'dart:io';
import '../src/place_holder.dart';

void main(List<String> args) async {
  File doc = File(args[0]);
  Stream<String> linesStream =
      doc.openRead().transform(utf8.decoder).transform(LineSplitter());
  List<String> lines = [];
  await for (var line in linesStream) lines.add(line);

  int start = lines.indexWhere((String line) => line.contains('routes.'));
  int end = lines.length;

  File yamlFile = File('openapi-config.yaml');
  var sink = yamlFile.openWrite();
  writeEndpoints(start: start, end: end, lines: lines, sink: sink);

  // int startOfBodyName = lines[start].indexOf('Validate');
  // int endOfBodyName =
  //     lines[start].indexOf('pattern'); // end of the request body name
  // String bodyName = lines[start].substring(start);

  sink.close();
}

String getEndPoint(String line) {
  int start = line.indexOf("'") + 1;
  int end = line.lastIndexOf("'");
  return line.substring(start, end);
}

void writeEndpoints({
  required int start,
  required int end,
  required List<String> lines,
  required IOSink sink,
}) {
  for (int i = start; i < end; i++) {
    if (lines[i].isEmpty || !lines[i].contains("(")) continue;
    String endPoint = getEndPoint(lines[i]);
    if (i == start) sink.writeln(startingDocs);
    sink.writeln(endPointDocs(endPoint, groupName: "giftcard-admin"));
  }
}

void writeSchemas() {}
