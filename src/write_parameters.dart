// ignore_for_file: curly_braces_in_flow_control_structures

import 'dart:convert';
import 'dart:io';

import 'get_request_body_address.dart';
import 'get_request_body_name.dart';

Future<List<String>> getAllParameters(List<String> list, int start) async {
  String requestBodyName = getRequestBodyName(list[start]);
  String requestBodyAddress = getRequestBodyAddress(list, requestBodyName);
  File requestBodyFile = File(requestBodyAddress);
  Stream<String> lineStream = requestBodyFile
      .openRead()
      .transform(utf8.decoder)
      .transform(LineSplitter());
  List<String> lines = [];
  await for (String line in lineStream) lines.add(line);

  int startIndex =
      lines.indexWhere((element) => element.contains("setRules")) + 1;
  List<String> halfList = lines.sublist(startIndex);
  int stopIndex = halfList.indexWhere((element) => element.contains(");"));

  List<String> rawParamList = halfList.sublist(0, stopIndex);

  List<String> paramList = [];
  for (var element in rawParamList) {
    int end = element.trim().indexOf(":");
    paramList.add(element.trim().substring(0, end));
  }
  return paramList;
}
