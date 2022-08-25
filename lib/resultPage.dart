import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  final bmi;

  ResultPage(this.bmi);

  String bmiTextResult() {
    late String resultText;

    if (bmi < 18.5) {
      resultText = 'Underweight';
    } else if (bmi > 18.5 && bmi < 24.9) {
      resultText = 'Normalweight';
    } else if (bmi > 25 && bmi < 29.9) {
      resultText = 'Overweight';
    } else if (bmi > 30 && bmi < 34.9) {
      resultText = 'Overweight+';
    } else if (bmi > 35) {
      resultText = 'Overweight++';
    }

    return resultText;
  }

  String bmiNumberResult() {
    return 'BMI: $bmi';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                color: Colors.red,
                padding: EdgeInsets.all(20),
                child: Text(
                  bmiTextResult(),
                ),
              ),
              Container(
                color: Colors.blue,
                padding: EdgeInsets.all(20),
                child: Text(
                  bmiNumberResult(),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.greenAccent,
                  onPrimary: Colors.black87,
                  padding: EdgeInsets.all(20),
                ),
                child: const Text(
                  'Calculate Again',
                  style: TextStyle(fontSize: 24),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
