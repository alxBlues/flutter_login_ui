import 'package:flutter/material.dart';
import 'package:flutter_login_ui/providers/auth_provider.dart';
import 'package:flutter_login_ui/providers/sidemenu_provider.dart';
import 'package:flutter_login_ui/router/router.dart';
import 'package:flutter_login_ui/services/navigation_service.dart';
import 'package:flutter_login_ui/ui/shared/widgets/logo.dart';
import 'package:flutter_login_ui/ui/shared/widgets/menu_items.dart';
import 'package:flutter_login_ui/ui/shared/widgets/text_separator.dart';
import 'package:provider/provider.dart';

class Sidebar extends StatelessWidget {
  void navigateTo(String routeName) {
    NavigationService.replaceTo(routeName);
    SideMenuProvider.closeMenu();
  }

  const Sidebar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final sideMenuProvider = Provider.of<SideMenuProvider>(context);
    final authProvider = Provider.of<AuthProvider>(context);
    return Container(
      width: 200,
      height: double.infinity,
      decoration: buildBoxDecoration(),
      child: ListView(
        physics: ClampingScrollPhysics(),
        children: [
          Logo(),
          SizedBox(
            height: 50,
          ),
          TextSeparator(text: 'Principal'),
          MenuItems(
              isActive: sideMenuProvider.currentPage == Routes.dashboardRoute,
              text: 'Dashboard',
              icon: Icons.compass_calibration_outlined,
              onPressed: () => navigateTo(Routes.dashboardRoute)),
          SizedBox(
            height: 20,
          ),
          Divider(
            color: Colors.white,
          ),
          SizedBox(
            height: 20,
          ),
          Divider(
            color: Colors.white,
          ),
          MenuItems(
              text: 'Salir',
              icon: Icons.exit_to_app_outlined,
              onPressed: () {
                SideMenuProvider.isOpen = false;
                SideMenuProvider.menuController.reset();
                Provider.of<AuthProvider>(context, listen: false).logout();
              }),
        ],
      ),
    );
  }

  BoxDecoration buildBoxDecoration() => BoxDecoration(
      gradient: LinearGradient(
        colors: [Color(0xff092044), Color(0xff092043)],
      ),
      boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 10)]);
}
