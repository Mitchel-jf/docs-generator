import 'dart:io';

import 'src.dart';

Future<void> writeEndPoints({
  required int start,
  required int end,
  required List<String> lines,
  required IOSink sink,
}) async {
  for (int i = start; i < end; i++) {
    var linesForward = lines.sublist(i + 1);
    bool isLastLine = linesForward.every((line) => !line.contains(")"));

    if (lines[i].isEmpty || !lines[i].contains("(")) continue;
    String endPoint = getEndPoint(lines[i]);
    if (i == start) sink.writeln(startingDocs);
    sink.writeln(endPointDocs(endPoint,
        groupName: "giftcard-admin",
        lastComma: isLastLine ? "" : ",",
        parameters: (await getParamsDocs(lines, i)).toString()));
  }
  sink.writeln(endingDocs);
}

Future<String> getParamsDocs(List<String> lines, int start) async {
  List<String> params = await getAllParameters(lines, start);
  List<String> paramList = [];
  for (String param in params) {
    paramList.add(parameterBody(param));
  }
  String paramsString = paramList.toString();
  return paramsString.substring(1, paramsString.length - 1);
}
