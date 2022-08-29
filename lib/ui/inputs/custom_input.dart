import 'package:flutter/material.dart';
import 'package:flutter_login_ui/widgets/constants.dart';

class CustomInputs {
  static InputDecoration loginInputDecoration({
    required String hint,
    required String label,
    required IconData icon,
  }) {
    return InputDecoration(
      border: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
      enabledBorder:
          OutlineInputBorder(borderSide: BorderSide(color: strongColor)),
      focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: strongColor, width: 2)),
      hintText: hint,
      labelText: label,
      prefixIcon: Icon(icon, color: strongColor),
      labelStyle: TextStyle(color: strongColor),
      hintStyle: TextStyle(color: hintColor),
      fillColor: Colors.grey.shade100,
    );
  }

  static InputDecoration whiteInputDecoration({
    required String hint,
    required String label,
    required IconData icon,
  }) {
    return InputDecoration(
      border: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
      enabledBorder:
          OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
      focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white, width: 2)),
      hintText: hint,
      labelText: label,
      prefixIcon: Icon(icon, color: Colors.white),
      labelStyle: TextStyle(color: Colors.white),
      hintStyle: TextStyle(color: hintColor),
      fillColor: Colors.grey.shade100,
    );
  }
}
