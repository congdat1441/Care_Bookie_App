import 'package:flutter/material.dart';

class ShareHistory extends StatefulWidget {
  const ShareHistory({Key? key}) : super(key: key);

  @override
  State<ShareHistory> createState() => _ShareHistoryState();
}

class _ShareHistoryState extends State<ShareHistory> {
  final List<String> _list = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
  ];
  final List<bool> _isChecked = [false, false, false, false, false];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: _list.length,
        itemBuilder: (BuildContext context, int index) {
          return CheckboxListTile(
            title: Text(_list[index]),
            value: _isChecked[index],
            onChanged: (bool? value) {
              setState(() {
                _isChecked[index] = value!;
              });
            },
          );
        },
      ),
    );
  }
}
