import 'dart:convert';

String jsonPretty(dynamic object) {
  String indent = ' ' * 4;
  var encoder = JsonEncoder.withIndent(indent);
  return encoder.convert(object);
}
