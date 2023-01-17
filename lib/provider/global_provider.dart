import 'package:desafio/modules/file_manager/domain/dtos/image_dto.dart';
import 'package:flutter/material.dart';

class GlobalProvider extends ChangeNotifier {
  // validacion login
  bool verificationLogin(String username, String password) {
    bool statusResponseLogin = false;
    //if (username == 'usuario' && password == '123456') {
    if (username == '' && password == '') {
      statusResponseLogin = true;
    }
    return statusResponseLogin;
  }

  final List<ImageDto> _listImages = [];

  List<ImageDto> get listImages => _listImages;

  void addedImage(String image) {
    if (_listImages.isEmpty) {
      _listImages.add(ImageDto(url: image, selected: true));
    } else {
      _listImages.add(ImageDto(url: image, selected: false));
    }
    notifyListeners();
  }

  void removedImage(int index) {
    _listImages.removeAt(index);
    notifyListeners();
  }

  void selectedImage(int index) {
    _listImages.map((e) => e.selected = false).toList();
    _listImages[index].selected = true;
    notifyListeners();
  }

  bool _statusGrid = true;

  bool get statusGrid => _statusGrid;

  void updateGrid(bool status) {
    _statusGrid = status;
    notifyListeners();
  }
}
