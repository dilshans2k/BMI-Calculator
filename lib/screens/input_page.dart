import 'package:bmi_calculator/screens/output_screen.dart';

import '../components/bottom_button.dart';
import '../constants/constants.dart';
import '../components/custom_round_button.dart';
import '../components/reusable_card.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../components/icon_content.dart';
import 'package:bmi_calculator/brain.dart';
//Color(0xFF1D1E33)

enum Gender { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

int func1(int height) {
  return (height ~/ 12);
}

int func2(int height) {
  return (height % 12);
}

void ftinLogic(int newValue) {}

class _InputPageState extends State<InputPage> {
  Gender selectedGender;
  int height = 60;
  int heightft = 4;
  int heightin = 11;
  int weight = 70;
  int age = 20;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'BMI CALCULATOR',
          style: TextStyle(fontSize: 18),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            // flex: 2,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                buildMale(),
                buildFemale(),
              ],
            ),
          ),
          buildHeight(context),
          Expanded(
            //flex: 2,
            child: Row(
              children: <Widget>[
                buildWeight(),
                buildAge(),
              ],
            ),
          ),
          BottomButton(
            onTap: () {
              Brain brain = Brain(height: height, weight: weight);

              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Output(
                      bmiResult: brain.calculateBMI(),
                      resultText: brain.getResult(),
                      interpretaion: brain.getInterpertation(),
                    ),
                  ));
            },
            buttonText: 'Calculate BMI',
          ),
        ],
      ),
    );
  }

  Expanded buildAge() {
    return Expanded(
      child: ReusableCard(
        color: kactiveCardColor,
        cardChild: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'AGE',
              style: klabelTextStyle,
            ),
            Row(
              textBaseline: TextBaseline.alphabetic,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.baseline,
              children: [
                Text(
                  age.toString(),
                  style: kmaintextstyle,
                ),
                Text(
                  'yr',
                  style: klabelTextStyle,
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RoundIconButton(
                  iconType: FontAwesomeIcons.minus,
                  onPress: () {
                    setState(() {
                      age -= 1;
                    });
                  },
                ),
                SizedBox(
                  width: 30,
                ),
                RoundIconButton(
                  iconType: FontAwesomeIcons.plus,
                  onPress: () {
                    setState(() {
                      age += 1;
                    });
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Expanded buildWeight() {
    return Expanded(
      child: ReusableCard(
        color: kactiveCardColor,
        cardChild: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'WEIGHT',
              style: klabelTextStyle,
            ),
            Row(
              textBaseline: TextBaseline.alphabetic,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.baseline,
              children: [
                Text(
                  weight.toString(),
                  style: kmaintextstyle,
                ),
                Text(
                  'kg',
                  style: klabelTextStyle,
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RoundIconButton(
                  iconType: FontAwesomeIcons.minus,
                  onPress: () {
                    setState(() {
                      weight -= 1;
                    });
                  },
                ),
                SizedBox(
                  width: 30,
                ),
                RoundIconButton(
                  iconType: FontAwesomeIcons.plus,
                  onPress: () {
                    setState(() {
                      weight += 1;
                    });
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Expanded buildHeight(BuildContext context) {
    return Expanded(
      child: ReusableCard(
        color: kactiveCardColor,
        cardChild: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Height',
              style: klabelTextStyle,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                Text(
                  heightft.toString(),
                  style: kmaintextstyle,
                ),
                Text('ft', style: klabelTextStyle),
                SizedBox(
                  width: 20,
                ),
                Text(
                  heightin.toString(),
                  style: kmaintextstyle,
                ),
                Text(
                  'in',
                  style: klabelTextStyle,
                ),
              ],
            ),
            SliderTheme(
              data: SliderTheme.of(context).copyWith(
                activeTrackColor: Colors.white,
                thumbColor: Color(0xFFEB1555),
                overlayColor: Color(0x30EB1555),
                inactiveTrackColor: Color(0xFF8D8E98),
                trackHeight: 2,
                trackShape: RoundedRectSliderTrackShape(),
                thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15),
                overlayShape: RoundSliderOverlayShape(overlayRadius: 30),
              ),
              //we wrapped slider with SliderTheme to add themeing functionality
              child: Slider(
                value: height.toDouble(),
                min: 24.0,
                max: 96.0,
                divisions: 96 - 24,
                //activeColor: Color(0xFFEB1555),
                onChanged: (double newValue) {
                  setState(() {
                    height = newValue.toInt();
                    heightft = (newValue ~/ 12);
                    heightin = (newValue % 12).toInt();
                  });
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  Expanded buildFemale() {
    return Expanded(
      child: ReusableCard(
        onPress: () {
          setState(() {
            selectedGender = Gender.female;
          });
        },
        color: selectedGender == Gender.female
            ? kactiveCardColor
            : kinactiveCardColor,
        cardChild: IconContent(
          icon: FontAwesomeIcons.venus,
          text: 'Female',
        ),
      ),
    );
  }

  Expanded buildMale() {
    return Expanded(
      child: ReusableCard(
        onPress: () {
          setState(() {
            selectedGender = Gender.male;
          });
        },
        color: selectedGender == Gender.male
            ? kactiveCardColor
            : kinactiveCardColor,
        cardChild: IconContent(
          icon: FontAwesomeIcons.mars,
          text: 'Male',
        ),
      ),
    );
  }
}
