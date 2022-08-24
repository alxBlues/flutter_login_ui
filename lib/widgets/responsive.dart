import 'package:flutter/material.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget mobileBody;
  final Widget desktopApp;
  const ResponsiveLayout(
      {Key? key, required this.desktopApp, required this.mobileBody})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
