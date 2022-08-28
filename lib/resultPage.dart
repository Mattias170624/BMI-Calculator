// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  final bmi;
  late String bmiTextSuggestion;

  ResultPage(this.bmi);

  String bmiTextResult() {
    late String resultText;

    if (bmi < 18.5) {
      resultText = 'Underweight';
      bmiTextSuggestion =
          'Your BMI result is quite low, you should try to eat more!';
    } else if (bmi > 18.5 && bmi < 24.9) {
      resultText = 'Normalweight';
      bmiTextSuggestion =
          'Your BMI result is quite low, you should try to eat more!';
    } else if (bmi > 25 && bmi < 29.9) {
      resultText = 'Slightly Overweight';
      bmiTextSuggestion = 'Your BMI result is above normal, try to eat less!';
    } else if (bmi > 30 && bmi < 34.9) {
      resultText = 'Overweight';
      bmiTextSuggestion = 'Your BMI result is above normal, try to eat less!';
    } else if (bmi > 35) {
      resultText = 'Very Overweight';
      bmiTextSuggestion = 'Your BMI result is above normal, try to eat less!';
    }

    return resultText;
  }

  String bmiNumberResult() {
    String parsedBmi = bmi.toStringAsFixed(1);
    return 'BMI: $parsedBmi';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.topLeft,
              padding: EdgeInsets.only(left: 20),
              child: Text(
                'Your Result',
                style: TextStyle(
                  fontSize: 34,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(left: 20, right: 20, top: 30, bottom: 30),
              padding: EdgeInsets.all(40),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.black54,
              ),
              child: Column(
                children: [
                  Text(
                    bmiTextResult(),
                    style: TextStyle(
                      color: Colors.greenAccent,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(40),
                    child: Text(
                      bmiNumberResult(),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 42,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Text(bmiTextSuggestion),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(left: 20, right: 20),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.all(20),
                  primary: Theme.of(context).colorScheme.primary,
                  onPrimary: Colors.black87,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Text(
                      'Recalculate',
                      style: TextStyle(
                        fontSize: 24,
                      ),
                    ),
                    Icon(
                      Icons.replay,
                      size: 30,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
