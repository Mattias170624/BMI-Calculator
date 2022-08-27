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

  void changeScreen() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              child: Text(
                'BMI Calculator',
                style: TextStyle(
                    color: Colors.greenAccent,
                    fontSize: 28,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(left: 20, right: 20, top: 30, bottom: 30),
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.25),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Center(
                child: Column(
                  children: [
                    TextField(
                      controller: _weightController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(labelText: 'Weight in Kg:'),
                    ),
                    TextField(
                      controller: _heightController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(labelText: 'Height in Cm:'),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: GenderList(),
                    ),
                  ],
                ),
              ),
            ),
            ElevatedButton(
              onPressed: (() {
                if (handleUserInputs() == true) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ResultPage(bmiNum),
                      ));
                } else {
                  print('FALSE');
                }
              }),
              style: ElevatedButton.styleFrom(
                primary: Colors.greenAccent,
                onPrimary: Colors.black87,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Text(
                    'Calculate',
                    style: TextStyle(fontSize: 18),
                  ),
                  Icon(Icons.arrow_forward_ios_rounded),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
