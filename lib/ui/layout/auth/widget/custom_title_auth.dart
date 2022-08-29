import 'package:flutter/material.dart';
import 'package:flutter_login_ui/widgets/constants.dart';

class CustomTitleAuth {
  static Text loginTitleDecoration({
    required String label,
    required Color color,
  }) {
    return Text(
      label,
      style: TextStyle(
          color: color,
          fontSize: 40,
          fontWeight: FontWeight.bold,
          fontFamily: 'Poppins'),
    );
  }

  static Text ResetPasswordTitleDecoration({
    required String label,
  }) {
    return Text(
      label,
      style: TextStyle(
          color: strongColor,
          fontSize: 16,
          fontWeight: FontWeight.normal,
          fontFamily: 'Poppins'),
    );
  }
}
