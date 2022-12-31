import 'dart:typed_data';

class FileModel {
  FileModel({required this.webFile});
  final Uint8List webFile;

  Uint8List getWebFile() => webFile;
}
