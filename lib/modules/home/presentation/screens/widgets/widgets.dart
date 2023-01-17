import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';

SnackBar snackBarCustom() {
  return SnackBar(
    elevation: 0,
    behavior: SnackBarBehavior.floating,
    backgroundColor: Colors.transparent,
    content: AwesomeSnackbarContent(
      title: 'Hubo un error !!',
      message:
          'Usuario o contraseña incorrectamente.',
      contentType: ContentType.failure,
    ),
  );
}
