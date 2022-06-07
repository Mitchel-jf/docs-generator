// ignore_for_file: curly_braces_in_flow_control_structures

import 'dart:convert';
import 'dart:io';
import '../src/src.dart';

void main(List<String> args) async {
  if (args.isEmpty) throw "The path must not be empty";
  File doc = File(args[0]);
  Stream<String> linesStream =
      doc.openRead().transform(utf8.decoder).transform(LineSplitter());
  List<String> lines = [];
  await for (var line in linesStream) lines.add(line);

  int start = lines.indexWhere((String line) => line.contains('routes.'));
  int end = lines.length;

  File yamlFile = File('${args[1]}.json');
  var sink = yamlFile.openWrite();
  await writeEndPoints(start: start, end: end, lines: lines, sink: sink);

  sink.close();

  // getAllParameters(lines, start);
}
