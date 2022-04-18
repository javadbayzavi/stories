
import 'package:flutter/material.dart';
import 'package:async/async.dart';
import 'home_page.dart';

Duration _timerDuration = new Duration(seconds: 5);

class SplashPage extends StatelessWidget {
// Creating a new timer element.

  @override
  Widget build(BuildContext context) {
    void _startNewPage() {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    }

    RestartableTimer _timer =
         RestartableTimer(_timerDuration, _startNewPage);

    return Scaffold(
      body: Center(
        child: Text('Welcome to Stories'),
      ),
    );
  }}