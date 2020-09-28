import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

@immutable
class ForgotFields extends StatelessWidget {
  // VARIABLES
  final Function validateInputs;
  final Function addValuesInMap;

  // CONSTRUCTOR
  ForgotFields({
    this.validateInputs,
    this.addValuesInMap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15.0),
      margin: EdgeInsets.all(8.0),
      child: Column(
        children: [
          // Email Input
          TextFormField(
            decoration: InputDecoration(labelText: "E-mail"),
            keyboardType: TextInputType.emailAddress,
            validator: this._validateEmail,
            onSaved: addValuesInMap,
          ),

          // Submit Button
          Container(
            margin: EdgeInsets.all(22.0),
            child: OutlineButton(
              onPressed: this.validateInputs,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
              borderSide: BorderSide(color: Colors.redAccent),
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

  // E-mail validator check
  String _validateEmail(String value) {
    if (value.isEmpty) {
      // The form is empty
      return "Enter email address";
    }
    // This is just a regular expression for email addresses
    String p = "[a-zA-Z0-9\+\.\_\%\-\+]{1,256}" +
        "\\@" +
        "[a-zA-Z0-9][a-zA-Z0-9\\-]{0,64}" +
        "(" +
        "\\." +
        "[a-zA-Z0-9][a-zA-Z0-9\\-]{0,25}" +
        ")+";
    RegExp regExp = new RegExp(p);

    if (regExp.hasMatch(value)) {
      // So, the email is valid
      return null;
    }

    // The pattern of the email didn't match the regex above.
    return 'Email is not valid';
  }
}
