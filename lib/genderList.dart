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
      underline: Container(
        color: Colors.grey,
        height: 1,
      ),
      value: dropdownvalue,
      focusColor: Colors.red,
      style: TextStyle(
        color: Theme.of(context).colorScheme.primary,
      ),
      icon: const Icon(Icons.keyboard_arrow_down),
      items: [
        DropdownMenuItem(
          child: Text('Male'),
          value: 'Male',
          enabled: true,
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
