import 'package:flutter/material.dart';
import 'package:flutter_login_ui/ui/cards/white_card.dart';
import 'package:flutter_login_ui/ui/labels/custom_label.dart';

class BlankView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: ListView(
        physics: ClampingScrollPhysics(),
        children: [
          Text(
            'Dashboard View',
            style: CustomLabels.h1,
          ),
          SizedBox(
            height: 10,
          ),
          WhiteCard(title: 'Sales Statistics', child: Text('Hola Mundo')),
        ],
      ),
    );
  }
}
