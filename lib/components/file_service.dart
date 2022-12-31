import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_upload_web/components/file_model.dart';

abstract class FileService {
  Future getFileForWeb();
}

var fileServiceProvider = Provider((ref) => FileServiceImpl());

class FileServiceImpl extends FileService {
  @override
  Future<FileModel?> getFileForWeb() async {
    if (kIsWeb) {
      ImagePicker picker = ImagePicker();
      XFile? image = await picker.pickImage(source: ImageSource.gallery);
      Uint8List uint8list = Uint8List(8);
      if (image != null) {
        var f = await image.readAsBytes();
        uint8list = f;
        var fileModel = FileModel(webFile: uint8list);
        return fileModel;
      }
    }
    return null;
  }
}
