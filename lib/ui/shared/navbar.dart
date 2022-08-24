import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_login_ui/providers/sidemenu_provider.dart';
import 'package:flutter_login_ui/ui/shared/widgets/navbar_avatar.dart';
import 'package:flutter_login_ui/ui/shared/widgets/notifications_indicator.dart';

class Navbar extends StatelessWidget {
  const Navbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: 50,
      decoration: buildBoxDecoration(),
      child: Row(
        children: [
          //TODO Icono Menú
          if (size.width <= 700) ...[
            IconButton(
                onPressed: () => SideMenuProvider.openMenu(),
                icon: Icon(Icons.menu_outlined)),
            SizedBox(
              width: 5,
            )
          ],
          Spacer(),
          NotificationsIndicator(),
          SizedBox(
            width: 10,
          ),
          NavbarAvatar(),
          SizedBox(
            width: 10,
          )
        ],
      ),
    );
  }

  BoxDecoration buildBoxDecoration() => BoxDecoration(
      color: Colors.white,
      boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 5)]);
}
