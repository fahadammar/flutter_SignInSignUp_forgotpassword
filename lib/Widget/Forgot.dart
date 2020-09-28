import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// EXTERNAL WIDGET
import 'package:deafcycle_app/Utils/CircularLogo.dart';
import 'package:deafcycle_app/Utils/forgotFields.dart';
import 'package:deafcycle_app/Widget/SignIn.dart';

class ForgotPassword extends StatefulWidget {
  // STATIC ID
  static final id = '/forgotpassword';

  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
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
          "Forgot Password",
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
                child: ForgotFields(
                  validateInputs: this._validateInputs,
                  addValuesInMap: this._addValuesInMap,
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
      Navigator.pushNamed(context, SignIn.id);
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
