import 'package:deafcycle_app/Widget/CycleMap.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

@immutable
class JoinRaceField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15.0),
      margin: EdgeInsets.all(8.0),
      child: Column(
        children: [
          // Race ID Input
          TextFormField(
            decoration: InputDecoration(labelText: "Please Enter The Race-ID"),
            keyboardType: TextInputType.number,
            validator: (String val) {
              if (val.length < 5) return "Enter Valid ID";
              return null;
            },
          ),

          // Submit Button
          Container(
            margin: EdgeInsets.all(22.0),
            child: OutlineButton(
              onPressed: () {
                Navigator.pushNamed(context, CycleMap.id);
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
        ],
      ),
    );
  }
}
