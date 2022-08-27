import 'package:flutter/material.dart';

class GenderList extends StatefulWidget {
  @override
  State<GenderList> createState() => _GenderListState();
}

class _GenderListState extends State<GenderList> {
  String dropdownvalue = 'Male';
  // var genderList = ['Male', 'Female'];
  List<String> genderList = ['Male', 'Female'];

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      value: dropdownvalue,
      icon: const Icon(Icons.keyboard_arrow_down),
      items: [
        DropdownMenuItem(
          child: Text('Male'),
          value: 'Male',
        ),
        DropdownMenuItem(
          child: Text('Female'),
          value: 'Female',
        ),
      ],
      onChanged: (String? newValue) {
        setState(() {
          dropdownvalue = newValue!;
        });
      },
    );
  }
}
