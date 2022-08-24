import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTitleAuth extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double widthSize = MediaQuery.of(context).size.width;
    final double heightSize = MediaQuery.of(context).size.height;
    return Container(
      padding: const EdgeInsets.only(left: 10, top: 0),
      child: Image(image: AssetImage('assets/images/maat-login-form.png')),
      height: heightSize * 0.25,
      width: widthSize * 0.55,
    );
  }
}
