import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CycleMap extends StatefulWidget {
  static final id = "/map";

  @override
  _CycleMapState createState() => _CycleMapState();
}

class _CycleMapState extends State<CycleMap> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Map",
          style: GoogleFonts.notoSans(
            fontSize: 26,
          ),
        ),
        backgroundColor: Colors.red,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Container(
              margin: EdgeInsets.fromLTRB(15, 30, 15, 10),
              width: 500,
              height: 600,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/map.png'),
                  fit: BoxFit.fill,
                ),
                
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 10,
                    blurRadius: 5,
                    offset: Offset(5, 15), // changes position of shadow
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
