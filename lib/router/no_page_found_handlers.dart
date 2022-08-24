import 'package:fluro/fluro.dart';
import 'package:flutter_login_ui/providers/sidemenu_provider.dart';
import 'package:flutter_login_ui/ui/view/no_page_found_view.dart';
import 'package:provider/provider.dart';

class NoPageFoundHandlers {
  static Handler noPageFound = Handler(handlerFunc: (context, params) {
    Provider.of<SideMenuProvider>(context!, listen: false)
        .setCurrentPageUrl('/404');
    return NoPageFoundView();
  });
}
