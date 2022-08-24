import 'package:flutter/material.dart';
import 'package:flutter_login_ui/providers/sidemenu_provider.dart';
import 'package:flutter_login_ui/ui/shared/navbar.dart';
import 'package:flutter_login_ui/ui/shared/sidebar.dart';

class DashboardLayout extends StatefulWidget {
  final Widget child;
  const DashboardLayout({Key? key, required this.child}) : super(key: key);

  @override
  State<DashboardLayout> createState() => _DashboardLayoutState();
}

class _DashboardLayoutState extends State<DashboardLayout>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    SideMenuProvider.menuController = new AnimationController(
        vsync: this, duration: Duration(milliseconds: 300));

    SideMenuProvider.movement = Tween<double>(begin: -200, end: 0).animate(
        CurvedAnimation(
            parent: SideMenuProvider.menuController, curve: Curves.easeInOut));

    SideMenuProvider.opacity = Tween<double>(begin: 0, end: 1).animate(
        CurvedAnimation(
            parent: SideMenuProvider.menuController, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    SideMenuProvider.menuController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Color(0xffEDF1F2),
        body: Stack(
          children: [
            Row(
              children: [
                if (size.width >= 700) Sidebar(),
                Expanded(
                  child: Column(
                    children: [
                      Navbar(),
                      Expanded(
                          child: Container(
                        child: widget.child,
                      ))
                    ],
                  ),
                )
              ],
            ),
            if (size.width < 700)
              AnimatedBuilder(
                animation: SideMenuProvider.menuController,
                builder: (context, _) => Stack(
                  children: [
                    if (SideMenuProvider.isOpen)
                      Opacity(
                        opacity: SideMenuProvider.opacity.value,
                        child: GestureDetector(
                          onTap: () => SideMenuProvider.closeMenu(),
                          child: Container(
                            width: size.width,
                            height: size.height,
                            color: Colors.black26,
                          ),
                        ),
                      ),
                    Transform.translate(
                      offset: Offset(SideMenuProvider.movement.value, 0),
                      child: Sidebar(),
                    )
                  ],
                ),
              )
          ],
        ));
  }
}
