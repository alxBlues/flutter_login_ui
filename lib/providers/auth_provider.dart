import 'package:flutter/cupertino.dart';
import 'package:flutter_login_ui/api/BoscoApi.dart';
import 'package:flutter_login_ui/models/http/auth_response.dart';
import 'package:flutter_login_ui/models/usuario.dart';
import 'package:flutter_login_ui/router/router.dart';
import 'package:flutter_login_ui/services/local_storage.dart';
import 'package:flutter_login_ui/services/navigation_service.dart';
import 'package:flutter_login_ui/services/notification_service.dart';

enum AuthStatus { checking, authenticated, notAuthenticated }

class AuthProvider extends ChangeNotifier {
  String? _token;
  AuthStatus authStatus = AuthStatus.checking;
  Usuario? user;

  AuthProvider() {
    this.isAuthenticated();
  }

  login(String email, String password) {
    final data = {'email': email, 'password': password};

    BoscoApi.httpPost('/login', data).then((json) {
      final authResponse = ResponseApi.fromMap(json);
      user = authResponse.usuario;

      authStatus = AuthStatus.authenticated;
      LocalStorage.prefs.setString('token', authResponse.token);
      NavigationService.replaceTo(Routes.dashboardRoute);
      BoscoApi.configureDio();
      notifyListeners();
    }).catchError((e) {
      print('error en $e');
      NotificationsService.showSnackbarError('Usuario / Password No Válidos');
    });
  }

  register(String email, String password, String name, String cpassword) {
    final data = {
      'name': name,
      'email': email,
      'password': password,
      'password_confirmation': cpassword
    };

    BoscoApi.httpPost('/register', data).then((json) {
      final authResponse = ResponseApi.fromMap(json);
      user = authResponse.usuario;

      authStatus = AuthStatus.authenticated;
      LocalStorage.prefs.setString('token', authResponse.token);
      NavigationService.replaceTo(Routes.dashboardRoute);

      BoscoApi.configureDio();
      notifyListeners();
    }).catchError((e) {
      print('error en: $e');
      NotificationsService.showSnackbarError('Usuario / Password no válidos');
    });
  }

  Future<bool> isAuthenticated() async {
    final token = LocalStorage.prefs.getString('token');
    if (token == null) {
      authStatus = AuthStatus.notAuthenticated;
      notifyListeners();
      return false;
    }
    try {
      final resp = await BoscoApi.httpGet('/auth');
      final authResponse = ResponseApi.fromMap(resp);
      LocalStorage.prefs.setString('token', authResponse.token);
      user = authResponse.usuario;
      if (user!.estado == 0) {
        authStatus = AuthStatus.notAuthenticated;
      } else {
        authStatus = AuthStatus.authenticated;
      }

      notifyListeners();
      return true;
    } catch (e) {
      print(e);
      authStatus = AuthStatus.notAuthenticated;
      notifyListeners();
      return false;
    }
  }

  logout() {
    LocalStorage.prefs.remove('token');
    authStatus = AuthStatus.notAuthenticated;
    NavigationService.replaceTo(Routes.loginRoute);
    notifyListeners();
  }
}
