import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class HomeProvider extends ChangeNotifier {
  String? imagePath;

  XFile? imageFile;

  void setImagePath(String? path) {
    imagePath = path;
    notifyListeners();
  }

  void setImageFile(XFile? file) {
    imageFile = file;
    notifyListeners();
  }
}
