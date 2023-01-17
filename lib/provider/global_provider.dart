import 'package:desafio/modules/file_manager/domain/dtos/image_dto.dart';
import 'package:flutter/material.dart';

class GlobalProvider extends ChangeNotifier {
  // validacion login
  bool verificationLogin(String username, String password) {
    bool statusResponseLogin = false;
    if (username == 'usuario' && password == '123456') {
      statusResponseLogin = true;
    }
    return statusResponseLogin;
  }

  final List<ImageDto> _listImages = [];

  List<ImageDto> get listImages => _listImages;

  void addedImage(String image) {
    _listImages.add(ImageDto(url: image, selected: false));
    notifyListeners();
  }

  void removedImage(int index) {
    _listImages.removeAt(index);
    notifyListeners();
  }
}
