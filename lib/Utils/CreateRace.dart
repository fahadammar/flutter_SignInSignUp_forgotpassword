import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

@immutable
class CreateRaceField extends StatefulWidget {
  String raceID = '';

  @override
  _CreateRaceFieldState createState() => _CreateRaceFieldState();
}

class _CreateRaceFieldState extends State<CreateRaceField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15.0),
      margin: EdgeInsets.all(8.0),
      child: Column(
        children: [
          // Race ID Input
          TextFormField(
            decoration:
                InputDecoration(labelText: "Enter Number Of Participants"),
            keyboardType: TextInputType.number,
            validator: (String val) {
              if (val.length > 0) return "Should Be More Than 0";
              return null;
            },
          ),

          // Submit Button
          Container(
            margin: EdgeInsets.all(22.0),
            child: OutlineButton(
              onPressed: () {
                setState(() {
                  widget.raceID = '123456';
                });
              },
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
              borderSide: BorderSide(color: Colors.red[800]),
              child: Container(
                padding: EdgeInsets.all(12.0),
                child: Text(
                  "Submit",
                  style: GoogleFonts.ubuntu(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                  ),
                ),
              ),
            ),
          ),

          // Race-ID
          Text(
            'Your Race-ID: ${widget.raceID}',
            style: GoogleFonts.ramabhadra(
              fontSize: 22
            ),
          ),
        ],
      ),
    );
  }
}
