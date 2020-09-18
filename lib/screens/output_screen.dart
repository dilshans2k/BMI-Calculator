import 'package:flutter/material.dart';

import '../components/bottom_button.dart';
import '../constants/constants.dart';

class Output extends StatelessWidget {
  const Output(
      {@required this.bmiResult,
      @required this.resultText,
      @required this.interpretaion});
  final String bmiResult;
  final String resultText;
  final String interpretaion;

  final double bmivalue = 28.4;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Result'),
      ),
      body: Column(
        //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            flex: 7,
            child: Container(
              color: kactiveCardColor,
              margin: EdgeInsets.all(30),
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    resultText.toUpperCase(),
                    style: kBMITypeTextStyle,
                  ),
                  Text(
                    bmiResult,
                    style: kBMIValueTextStyle,
                  ),
                  Text(
                    interpretaion,
                    style: TextStyle(fontSize: 20),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              child: BottomButton(
                onTap: () {
                  Navigator.pop(context);
                },
                buttonText: 'Re-Calculate',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
