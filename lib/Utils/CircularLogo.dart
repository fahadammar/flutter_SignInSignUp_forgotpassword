import 'package:flutter/material.dart';

class CircularLogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: EdgeInsets.all(12.0),
        width: 250,
        height: 250,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
            image: AssetImage('assets/images/logo.jpeg'),
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}
