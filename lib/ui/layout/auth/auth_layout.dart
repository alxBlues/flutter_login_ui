import 'package:flutter/material.dart';
import 'package:flutter_login_ui/ui/layout/auth/widget/custom_title_auth.dart';
import 'package:flutter_login_ui/ui/layout/auth/widget/panel_left_auth.dart';

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
          (size.width > 1000)
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
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/login.png'), fit: BoxFit.cover),
        ),
        height: size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CustomTitleAuth(),
            Container(
              width: double.infinity,
              height: 420,
              child: child,
            ),
          ],
        ),
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
      color: Colors.black,
      child: Row(
        children: [
          // Twitter Background
          Expanded(child: PanelLeftAuth()),

          // View Container
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/login.png'),
                  fit: BoxFit.cover),
            ),
            width: 600,
            height: double.infinity,
            child: Column(
              children: [
                SizedBox(height: 20),
                CustomTitleAuth(),
                Expanded(child: child),
              ],
            ),
          )
        ],
      ),
    );
  }
}
