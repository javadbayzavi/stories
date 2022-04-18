import 'package:flutter/material.dart';
import 'package:kidstories/pages/home_page.dart';
import 'package:kidstories/pages/splash_page.dart';
import 'package:flutter/services.dart';

void main()  => SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]).then((_) {
  runApp( 
      StoryApp(),
    );
});

class StoryApp extends StatelessWidget {
  @override
  //TODO: Acceptance Criteria #6: Add drawer feature to the right side of the page
  Widget build(BuildContext context) {
    return MaterialApp(
      //home: SplashPage(),
      home:HomePage(),
    );
  }
}
