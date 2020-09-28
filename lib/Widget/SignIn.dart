import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// EXTERNAL WIDGET
import 'package:deafcycle_app/Widget/Dashboard.dart';
import 'package:deafcycle_app/Utils/SignInFields.dart';
import 'package:deafcycle_app/Utils/CircularLogo.dart';
import 'package:deafcycle_app/Widget/Forgot.dart';
import 'package:deafcycle_app/Widget/SignUp.dart';

class SignIn extends StatefulWidget {
  // STATIC ID
  static final id = '/';

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  // Global Form Key
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // AutoValidate To False
  bool _autoValidate = false;

  // Map -> contains the Input Validated Values, values shown in print after submit
  Map<dynamic, dynamic> keyValues = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Sign In",
          style: GoogleFonts.notoSans(
            fontSize: 26,
          ),
        ),
        backgroundColor: Colors.red,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Circular Logo
              CircularLogo(),
              // Form
              Form(
                key: _formKey,
                autovalidate: _autoValidate,
                child: SignInFields(
                  validateInputs: this._validateInputs,
                  addValuesInMap: this._addValuesInMap,
                  context: context,
                  signup: SignUp.id,
                  forgot: ForgotPassword.id,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Validate Inputs
  void _validateInputs() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      print(keyValues);
      Navigator.pushNamed(context, Dashboard.id);
    } else {
      setState(() {
        _autoValidate = true;
      });
    }
  }

  // Add Values In Map
  void _addValuesInMap(String val) {
    keyValues[val] = val;
  }
} // End Of Class
