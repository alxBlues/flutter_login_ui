import 'package:flutter/material.dart';
import 'package:flutter_login_ui/ui/layout/auth/widget/navbar_auth.dart';

class PanelLeftAuth extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
        Color(0xFFF8FBFF),
        Color(0xFFFCFDFD),
      ])),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Column(
            children: [
              NavBar(),
              SizedBox(
                height: size.height / 1.6,
                child: Stack(
                  fit: StackFit.expand,
                  children: <Widget>[
                    FractionallySizedBox(
                      alignment: Alignment.centerRight,
                      widthFactor: .7,
                      child:
                          Image.asset("assets/images/image_01.png", scale: .65),
                    ),
                    FractionallySizedBox(
                      alignment: Alignment.centerLeft,
                      widthFactor: .8,
                      child: Padding(
                        padding: EdgeInsets.only(left: 48),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text("Hola!",
                                style: TextStyle(
                                    fontSize: 60,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: "Montserrat-Regular",
                                    color: Color(0xFF8591B0))),
                            RichText(
                              text: TextSpan(
                                  text: "Bienvenido a ",
                                  style: TextStyle(
                                      fontSize: 60, color: Color(0xFF8591B0)),
                                  children: [
                                    TextSpan(
                                        text: "CryptoCerty",
                                        style: TextStyle(
                                            fontSize: 60,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black87))
                                  ]),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 12.0, top: 20),
                              child: Text("Seguridad Implicita"),
                            ),
                            SizedBox(
                              height: 40,
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  BoxDecoration buildBoxDecoration() {
    return BoxDecoration(color: Colors.white);
  }
}
