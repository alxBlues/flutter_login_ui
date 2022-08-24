import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login_ui/router/admin_handlers.dart';
import 'package:flutter_login_ui/router/dashboard_handlers.dart';
import 'package:flutter_login_ui/router/no_page_found_handlers.dart';

//Configure route name
class Routes {
  static final FluroRouter router = FluroRouter();
  static String root = '/'; //root path
  static String loginRoute = '/auth/login';
  static String dashboardRoute = '/dashboard';
  static String blankRoute = '/dashboard/blankview';

  static void configureRoutes() {
    router.notFoundHandler = NoPageFoundHandlers.noPageFound;

    router.define(root,
        handler: AdminHandlers.login, transitionType: TransitionType.none);
    router.define(loginRoute,
        handler: AdminHandlers.login, transitionType: TransitionType.none);

    // Dashboard
    router.define(dashboardRoute,
        handler: DashboardHandlers.dashboard,
        transitionType: TransitionType.fadeIn);
  }
}
