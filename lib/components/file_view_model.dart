import 'dart:typed_data';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_upload_web/components/file_model.dart';
import 'package:image_upload_web/components/file_service.dart';

final fileModelProvider = StateProvider((ref) => FileViewModel());
final webImageProvider = StateProvider((ref) => Uint8List(8));

class FileViewModel {
  Future<void> pickFile(WidgetRef ref) async {
    FileModel? fileModel = await ref.read(fileServiceProvider).getFileForWeb();
    if (fileModel != null) {
      ref.read(webImageProvider.notifier).state = fileModel.getWebFile();
    }
  }
}
