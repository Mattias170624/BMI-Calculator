// ignore_for_file: prefer_const_constructors

import 'dart:ffi';
import 'dart:math';
import 'package:bmi_app/genderList.dart';
import 'package:flutter/material.dart';
import 'genderList.dart';
import 'resultPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BMI-App',
      home: StartScreen(),
      theme: ThemeData(
        colorScheme: ColorScheme(
          brightness: Brightness.dark,
          primary: Colors.orangeAccent,
          onPrimary: Colors.black,
          secondary: Colors.black,
          onSecondary: Colors.black,
          error: Colors.red,
          onError: Colors.red,
          background: Colors.red,
          onBackground: Colors.red,
          surface: Colors.black,
          onSurface: Colors.black,
        ),
      ),
    );
  }
}

class StartScreen extends StatelessWidget {
  final _weightController = TextEditingController();
  final _heightController = TextEditingController();
  late double bmiNum;

  bool handleUserInputs() {
    String weight = _weightController.text.trim();
    String height = _heightController.text.trim();

    if (weight.isEmpty || height.isEmpty) {
      return false;
    }

    if (!weight.contains(RegExp(r'[0-9]')) ||
        !height.contains(RegExp(r'[0-9]'))) {
      return false;
    }

    final int weightNum = int.parse(_weightController.text);
    final int heightNum = int.parse(_heightController.text);

    final double bmi = weightNum / pow(heightNum / 100, 2);
    bmiNum = bmi;

    return true;
  }

  void clearUserInputs() {
    _weightController.clear();
    _heightController.clear();
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
                'BMI Calculator',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                  fontSize: 34,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(left: 20, right: 20, top: 30, bottom: 30),
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Center(
                child: Column(
                  children: [
                    TextField(
                      controller: _weightController,
                      keyboardType: TextInputType.number,
                      style: TextStyle(color: Colors.black),
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        labelText: 'Weight in Kg:',
                        labelStyle: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                    ),
                    TextField(
                      controller: _heightController,
                      keyboardType: TextInputType.number,
                      style: TextStyle(color: Colors.black),
                      textInputAction: TextInputAction.done,
                      decoration: InputDecoration(
                        labelText: 'Height in Cm:',
                        labelStyle: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: GenderList(),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(left: 20, right: 20),
              child: ElevatedButton(
                onPressed: (() {
                  if (handleUserInputs() == true) {
                    clearUserInputs();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ResultPage(bmiNum),
                      ),
                    );
                  } else {
                    print('FALSE');
                  }
                }),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.all(20),
                  primary: Theme.of(context).colorScheme.primary,
                  onPrimary: Colors.black87,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Text(
                      'Calculate',
                      style: TextStyle(
                        fontSize: 24,
                      ),
                    ),
                    Icon(
                      Icons.arrow_forward_ios_rounded,
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
