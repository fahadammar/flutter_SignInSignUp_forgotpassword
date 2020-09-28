import 'package:flutter/material.dart';

// EXTERNAL MODULES
import 'package:deafcycle_app/Widget/SignUp.dart';
import 'package:deafcycle_app/Widget/SignIn.dart';
import 'package:deafcycle_app/Widget/Forgot.dart';
import 'package:deafcycle_app/Widget/CycleMap.dart';
import 'package:deafcycle_app/Widget/Dashboard.dart';

void main() {
  runApp(DeafCycle());
}

class DeafCycle extends StatefulWidget {
  @override
  _DeafCycleState createState() => _DeafCycleState();
}

class _DeafCycleState extends State<DeafCycle> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: SignIn.id,
      routes: {
        SignIn.id: (context) => SignIn(),
        SignUp.id: (context) => SignUp(),
        ForgotPassword.id: (context) => ForgotPassword(),
        Dashboard.id: (context) => Dashboard(),
        CycleMap.id: (context) => CycleMap(),
      },
    );
  }
}
