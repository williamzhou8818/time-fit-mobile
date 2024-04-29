import 'package:flutter/material.dart';

enum SEX { M, F }

class UpdateTimeList extends StatefulWidget {
  const UpdateTimeList({super.key});
  @override
  State<UpdateTimeList> createState() {
    return _UpdateTimeListState();
  }
}

class _UpdateTimeListState extends State<UpdateTimeList> {
  final _lockerIdController = TextEditingController();

  //
  String dropdownValue = 'M';

  @override
  void dispose() {
    _lockerIdController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          DropdownButton(
            items: const [
              DropdownMenuItem(
                value: 'M',
                child: Text('M'),
              ),
              DropdownMenuItem(
                value: 'F',
                child: Text('F'),
              ),
            ],
            value: dropdownValue,
            onChanged: (String? value) {
              setState(() {
                dropdownValue = value!;
              });
            },
          ),
          TextField(
            controller: _lockerIdController,
            keyboardType: TextInputType.number,
            maxLength: 50,
            decoration: const InputDecoration(
              label: Text('ロッカー番号'),
            ),
          ),
          Row(
            children: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('キャンセル'),
              ),
              ElevatedButton(
                onPressed: () {
                  print(_lockerIdController.text);
                  print(dropdownValue);
                },
                child: const Text('確認'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
