import 'package:flutter/material.dart';

class NavbarAvatar extends StatelessWidget {
  const NavbarAvatar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Container(
        child: Image.network(
            'https://64.media.tumblr.com/6313888523a31e34121e9a0b99e0581c/tumblr_pn36l9rHel1wr80c3o1_1280.jpg'),
        width: 30,
        height: 30,
      ),
    );
  }
}
