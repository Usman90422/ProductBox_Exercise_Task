import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';


class ImagesProvider extends ChangeNotifier{

  int flag1 = 0;
  int flag2 = 0;
  int flag3 = 0;
  int flag4 = 0;

  PlatformFile? file1;
  PlatformFile? file2;
  PlatformFile? file3;

  File? image1;
  File? image2;
  File? image3;
  File? image4;

  File? doc;
  File? doc1;
  File? doc2;
  File? doc3;

  final picker = ImagePicker();

  Future getImageFromCamera(int position) async {
    final pickedImage = await picker.pickImage(source: ImageSource.camera);
      if (pickedImage != null && position == 1) {
        image1 = File(pickedImage.path);
        flag1 = 1;
      } else if (pickedImage != null && position == 2) {
        image2 = File(pickedImage.path);
        flag2 = 1;
      } else if (pickedImage != null && position == 3) {
        image3 = File(pickedImage.path);
        flag3 = 1;
      } else if (pickedImage != null && position == 4) {
        image4 = File(pickedImage.path);
        flag4 = 1;
      } else {
        print("no image Selected");
      }
      notifyListeners();

  }

  Future getImageFromGallery() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpeg', 'png', 'jpg', 'JPEG', 'JPG', 'PNG'],
    );
    if (result != null) {

        doc = File(result.files.single.path);
        flag1 = 1;
    }
    notifyListeners();

  }

  Future OpenExplorer(int pos) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['docx', 'pdf', 'jpeg', 'png', 'jpg'],
    );
    if (result != null) {

        if (pos == 1) {
          doc1 = File(result.files.single.path);
          file1 = result.files.first;
          flag2 = 1;
        } else if (pos == 2) {
          doc2 = File(result.files.single.path);
          file2 = result.files.first;
          flag3 = 1;
        } else if (pos == 3) {
          doc3 = File(result.files.single.path);
          file3 = result.files.first;
          flag4 = 1;
        } else {
          print("No file selected");
        }
        notifyListeners();
    }

  }

  void clear() {
    image1 = null;
    image2 = null;
    image3 = null;
    image4 = null;

    flag1 = 0;
    flag2 = 0;
    flag3 = 0;
    flag4 = 0;

    doc = null;
    doc1 = null;
    doc2 = null;
    doc3 = null;

    notifyListeners();

  }
}

