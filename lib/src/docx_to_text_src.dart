import 'dart:typed_data';
import 'package:archive/archive.dart';
import 'package:xml/xml.dart' as xml;

String docxToText(Uint8List bytes) {
  final archive = ZipDecoder().decodeBytes(bytes);

  String text = '';
  final List<String> list = [];

  for (final file in archive) {
    if (file.isFile && file.name == 'word/document.xml') {
      final fileContent = String.fromCharCodes(file.content);
      final document = xml.XmlDocument.parse(fileContent);

      final paragraphNodes = document.findAllElements('w:p');

      for (final paragraph in paragraphNodes) {
        final textNodes = paragraph.findAllElements('w:t');
        final text = textNodes.map((node) => node.text).join();

        if (text.isNotEmpty) {
          list.add(text);
        }
      }
    }
  }

  return list.join('\n');
}
