import 'package:fluro/fluro.dart';
import 'package:flutter_login_ui/providers/auth_provider.dart';
import 'package:flutter_login_ui/providers/sidemenu_provider.dart';
import 'package:flutter_login_ui/router/router.dart';
import 'package:flutter_login_ui/ui/view/blank_view.dart';
import 'package:flutter_login_ui/ui/view/dashboard_view.dart';
import 'package:flutter_login_ui/ui/view/login_view.dart';
import 'package:provider/provider.dart';

class DashboardHandlers {
  static Handler dashboard = Handler(handlerFunc: (context, params) {
    final authProvider = Provider.of<AuthProvider>(context!);
    Provider.of<SideMenuProvider>(context, listen: false)
        .setCurrentPageUrl(Routes.dashboardRoute);

    if (authProvider.authStatus == AuthStatus.authenticated) {
      return DashboardView();
    } else {
      return LoginView();
    }
  });

  static Handler blank = Handler(handlerFunc: (context, params) {
    final authProvider = Provider.of<AuthProvider>(context!);
    Provider.of<SideMenuProvider>(context, listen: false)
        .setCurrentPageUrl(Routes.blankRoute);

    if (authProvider.authStatus == AuthStatus.authenticated) {
      return BlankView();
    } else {
      return LoginView();
    }
  });
}
