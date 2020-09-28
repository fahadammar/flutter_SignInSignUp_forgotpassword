import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

@immutable
class InputFields extends StatelessWidget {
  // VARIABLES
  final Function validateInputs;
  final Function addValuesInMap;
  final signinID;
  final context;

  // CONSTRUCTOR
  InputFields({this.validateInputs, this.addValuesInMap, this.signinID, this.context});

  // Password Variable
  String password;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15.0),
      margin: EdgeInsets.all(8.0),
      child: Column(
        children: [
          // First Name Input
          TextFormField(
            decoration: InputDecoration(labelText: "First Name"),
            validator: (String val) {
              if (val.length < 5) return "First Name";
              return null;
            },
            onSaved: addValuesInMap,
          ),
          // Last Name Input
          TextFormField(
            decoration: InputDecoration(labelText: "Last Name"),
            validator: (String val) {
              if (val.length < 5) return "Enter Last Name";
              return null;
            },
            onSaved: addValuesInMap,
          ),
          // Email Input
          TextFormField(
            decoration: InputDecoration(labelText: "E-mail"),
            keyboardType: TextInputType.emailAddress,
            validator: this._validateEmail,
            onSaved: addValuesInMap,
          ),
          // Password Input
          TextFormField(
            decoration: InputDecoration(labelText: "Password"),
            obscureText: true,
            validator: (String val) {
              if (val.length < 5)
                return "Password must be more than 5 characters";
              else {
                password = val;
                return null;
              }
            },
            onSaved: addValuesInMap,
          ),
          // Confirm Password Input
          TextFormField(
            decoration: InputDecoration(labelText: "Confrim Password"),
            obscureText: true,
            validator: (String val) {
              if (val.length < 5)
                return "Password must be more than 5 characters";
              if (val != password) return "Password Is Not Same";
              return null;
            },
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
