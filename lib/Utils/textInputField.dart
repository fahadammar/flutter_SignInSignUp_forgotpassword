import 'package:flutter/material.dart';

class InputTextField extends StatelessWidget {
  // CONSTRUCTOR
  InputTextField({
    this.label,
    this.inputType,
    this.validate,
    this.onSave,
  });
  // VARIABLES
  final String label;
  final TextInputType inputType;
  final Function validate;
  final Function onSave;

  // MAIN FUNCTION
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: TextFormField(
        style: TextStyle(
          color: Colors.red,
        ),
        cursorColor: Colors.red,
        decoration: new InputDecoration(
          hoverColor: Colors.white,
          errorStyle: TextStyle(
            color: Colors.red,
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.red, width: 2.0),
            borderRadius: BorderRadius.circular(25.0),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.red[700],
              width: 3,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red, width: 1),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white,
              width: 3.0,
            ),
          ),
          labelText: label.toString(),
          labelStyle: TextStyle(
            color: Colors.red.withOpacity(0.6),
          ),
        ),
        keyboardType: inputType,
        validator: validate,
        onSaved: onSave,
      ),
    );
  }
}
