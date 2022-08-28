// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'resultPage.dart';
import 'globals.dart' as globals;

class SavedResultList extends StatefulWidget {
  final double bmi;
  const SavedResultList(this.bmi);

  @override
  State<SavedResultList> createState() => _SavedResultListState();
}

class _SavedResultListState extends State<SavedResultList> {
  @override
  Widget build(BuildContext context) {
    final children = [];

    for (var i = 0; i < globals.results.length; i++) {
      children.add(globals.results[i]);
    }

    return Column(
      children: [
        Container(
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.only(top: 5, left: 20, bottom: 5),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.greenAccent,
            ),
            onPressed: addNewResult,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Text('Add Result'),
                Icon(Icons.add),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 185,
          child: ListView(
            padding: EdgeInsets.only(left: 15, right: 15),
            shrinkWrap: true,
            children: [
              for (var i = 0; i < globals.results.length; i++)
                Card(
                  child: ListTile(
                    leading: Text(
                      globals.results[i],
                    ),
                    trailing: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.redAccent,
                      ),
                      onPressed: () => removeSelectedResult(i),
                      child: Text('Delete'),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }

  void removeSelectedResult(index) {
    setState(() {
      globals.results.removeAt(index);
    });
  }

  void addNewResult() {
    setState(() {
      globals.results.insert(0, (widget.bmi.toStringAsFixed(1)));
    });
  }
}
