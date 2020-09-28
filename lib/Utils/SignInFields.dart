import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

@immutable
class SignInFields extends StatelessWidget {
  // VARIABLES
  final Function validateInputs;
  final Function addValuesInMap;
  final context;
  final signup;
  final forgot;

  // CONSTRUCTOR
  SignInFields(
      {this.validateInputs,
      this.addValuesInMap,
      this.context,
      this.signup,
      this.forgot});

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
                  "Sign In",
                  style: GoogleFonts.ubuntu(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                  ),
                ),
              ),
            ),
          ),

          // Navigating Buttons

          // SignUp
          RawMaterialButton(
            onPressed: () {
              Navigator.pushNamed(context, signup);
            },
            child: Text(
              "Sign Up",
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Colors.red,
              ),
            ),
          ),

          // Forgot Password
          RawMaterialButton(
            onPressed: () {
              Navigator.pushNamed(context, forgot);
            },
            child: Container(
              margin: EdgeInsets.fromLTRB(6, 0, 0, 19),
              child: Text(
                "Forgot Password?",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
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
