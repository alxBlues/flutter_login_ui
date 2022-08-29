import 'package:flutter/material.dart';
import 'package:flutter_login_ui/ui/layout/auth/widget/custom_title_auth.dart';
import 'package:flutter_login_ui/ui/layout/auth/widget/fade_animation.dart';
import 'package:flutter_login_ui/ui/layout/auth/widget/panel_left_auth.dart';
import 'package:flutter_login_ui/widgets/constants.dart';
import 'package:simple_animations/animation_builder/loop_animation_builder.dart';

class AuthLayout extends StatelessWidget {
  final Widget child;

  const AuthLayout({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        // isAlwaysShown: true,
        children: [
          (size.width > 900)
              ? _DesktopBody(child: child)
              : _MobileBody(child: child),

          // LinksBar
        ],
      ),
    );
  }
}

class _MobileBody extends StatelessWidget {
  final Widget child;

  const _MobileBody({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Container(
        width: double.infinity,
        height: 590,
        child: child,
      ),
    );
  }
}

class _DesktopBody extends StatelessWidget {
  final Widget child;

  const _DesktopBody({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      width: size.width,
      height: size.height,
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
        Color(0xFFF8FBFF),
        Color(0xFFFCFDFD),
      ])),
      child: Row(
        children: [
          // Twitter Background
          Expanded(child: PanelLeftAuth()),

          // View Container
          Container(
            height: size.height,
            width: size.width / 3.2,
            child: Container(
              width: double.infinity,
              height: 590,
              child: child,
            ),
          ),
        ],
      ),
    );
  }
}
