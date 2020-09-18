import 'dart:math';

class Brain {
  Brain({this.height, this.weight});
  final int height;
  final int weight;

  double _bmi;
  String calculateBMI() {
    _bmi = 703 * (weight * (2.20462) / pow(height, 2));
    return _bmi.toStringAsFixed(1);
  }
  
  String getResult() {
    if (_bmi >= 30)
      return 'Obesity';
    else if (_bmi >= 25)
      return 'Overweight';
    else if (_bmi >= 18.5)
      return 'Normal';
    else
      return 'Underweight';
  }

  String getInterpertation(){
        if (_bmi >= 30)
      return 'You will become an adult bear in coming months! Control your diet :)';
    else if (_bmi >= 25)
      return 'You have a higher than normal body weight. Try to exercise more!';
    else if (_bmi >= 18.5)
      return 'You have a normal body weight. Good Job!';
    else
      return 'You have a lowe than normal body weight. You can eat a bite more :)';
  }

}
