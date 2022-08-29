import 'package:flutter/material.dart';

class NavBar extends StatelessWidget {
  final navLinks = ["Inicio", "Productos", "Videos", "Contactenos"];

  List<Widget> navItem() {
    return navLinks.map((text) {
      return Padding(
        padding: EdgeInsets.only(left: 18),
        child: Text(text, style: TextStyle(fontFamily: "Montserrat-Bold")),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 45, vertical: 38),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                width: 100,
                height: 100,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('images/chaiyblox-2.png'),
                      fit: BoxFit.cover),
                ),
              ),
              SizedBox(
                width: 16,
              ),
              Text("CryptoCerty",
                  style: TextStyle(
                      fontSize: 40,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold))
            ],
          ),
        ],
      ),
    );
  }
}
