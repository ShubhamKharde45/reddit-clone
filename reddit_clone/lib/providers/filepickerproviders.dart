import 'dart:io';
import 'package:image_picker/image_picker.dart';

class FileClass {
  File? file;

  final ImagePicker imagePicker = ImagePicker();

  Future<void> SelectImageFromGallery() async {
    final picked_file = await imagePicker.pickImage(
      source: ImageSource.gallery,
    );

    if (picked_file != null) {
      file = File(picked_file.path);
    }
  }

  Future<void> SelectImageFromCamera() async {
    final picked_file = await imagePicker.pickImage(source: ImageSource.camera);

    if (picked_file != null) {
      file = File(picked_file.path);
    }
  }
}
