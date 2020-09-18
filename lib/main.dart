import 'package:flutter/material.dart';

import 'brain.dart';
import 'screens/input_page.dart';


void main() {
  runApp(BMICalculator());
}

Brain brain = Brain();

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        
        // brightness: Brightness.dark,
        scaffoldBackgroundColor: Color(0xFF0C1134),
        primaryColor: Color(0xFF0C1134),
        //primaryColorDark: Colors.orange,
        //accentColor: Colors.black,
        //appBarTheme: AppBarTheme(textTheme: Typography.whiteHelsinki,),
        //textTheme: Typography.whiteHelsinki,
      ),
      home: InputPage(),
      /* routes: {
        '/': (context) => InputPage(),
        '/o': (context) => Output(
              bmiResult: brain.calculateBMI(),
              resultText: brain.getResult(),
              interpretaion: brain.getInterpertation(),
            ),
      }, */
    );
  }
}
