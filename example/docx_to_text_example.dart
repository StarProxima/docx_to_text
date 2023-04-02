import 'dart:io';

import 'package:docx_to_text/docx_to_text.dart';

void main() async {
  final file = File('example/test_sample.docx');

  final bytes = await file.readAsBytes();

  final text = docxToText(bytes, handleNumbering: true);

  print(text);
}
