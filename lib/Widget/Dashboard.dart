import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// External Widgets
import 'package:deafcycle_app/Utils/CreateRace.dart';
import 'package:deafcycle_app/Utils/joinRaceField.dart';

class Dashboard extends StatefulWidget {
  static final id = '/dashboard';

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Dashboard",
          style: GoogleFonts.notoSans(
            fontSize: 26,
          ),
        ),
        backgroundColor: Colors.red,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                SizedBox(
                  height: 90,
                ),

                SizedBox(
                  height: 50,
                ),

                // Join Race Container - Expansion Tile
                Center(
                  child: Container(
                    margin: EdgeInsets.all(12.0),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.red[800],
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                    ),
                    child: ExpansionTile(
                      title: Text(
                        "Join Race",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.arimo(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      children: [
                        JoinRaceField(),
                      ],
                    ),
                  ),
                ),

                SizedBox(
                  height: 90,
                ),

                // Create Race
                Center(
                  child: Container(
                    margin: EdgeInsets.all(12.0),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.red[800],
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                    ),
                    child: ExpansionTile(
                      title: Text(
                        "Create Race",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.arimo(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      children: [
                        CreateRaceField(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
