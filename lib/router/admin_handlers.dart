import 'package:fluro/fluro.dart';
import 'package:flutter_login_ui/providers/auth_provider.dart';
import 'package:flutter_login_ui/ui/view/dashboard_view.dart';
import 'package:flutter_login_ui/ui/view/login_view.dart';
import 'package:flutter_login_ui/ui/view/register_view.dart';
import 'package:flutter_login_ui/ui/view/reset_password_view.dart';
import 'package:provider/provider.dart';

class AdminHandlers {
  static Handler login = Handler(handlerFunc: (context, params) {
    final authProvider = Provider.of<AuthProvider>(context!);

    if (authProvider.authStatus == AuthStatus.notAuthenticated)
      return LoginView();
    else
      return DashboardView();
  });

  static Handler register = Handler(handlerFunc: (context, params) {
    final authProvider = Provider.of<AuthProvider>(context!);

    if (authProvider.authStatus == AuthStatus.notAuthenticated)
      return RegisterView();
    else
      return DashboardView();
  });

  static Handler resetPassowrd = Handler(handlerFunc: (context, params) {
    final authProvider = Provider.of<AuthProvider>(context!);

    if (authProvider.authStatus == AuthStatus.notAuthenticated)
      return ResetPasswordView();
    else
      return DashboardView();
  });
}
