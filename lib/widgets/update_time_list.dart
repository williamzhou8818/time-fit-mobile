import 'package:flutter/material.dart';
import 'package:time_fit_mobile/models/times_lists.dart';

enum SEX { M, F }

class UpdateTimeList extends StatefulWidget {
  const UpdateTimeList(
      {super.key, required this.timeList, required this.updateTimesListItem});
  final TimesList timeList;
  final void Function(TimesList timesList) updateTimesListItem;

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
            style: const TextStyle(color: Colors.white, fontSize: 20),
            underline: Container(), //remove underline
            isExpanded: true, //make true to make width 100%
          ),
          TextField(
            controller: _lockerIdController,
            keyboardType: TextInputType.number,
            maxLength: 50,
            style: const TextStyle(color: Colors.white, fontSize: 20),
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
                  final enteredNum = double.tryParse(_lockerIdController.text);
                  final lockerIDIsInvalid = enteredNum == null;

                  if (lockerIDIsInvalid) {
                    showDialog(
                      context: context,
                      builder: (ctx) => AlertDialog(
                        title: const Text('入力内容が間違い'),
                        content: const Text(''),
                        actions: [
                          TextButton(
                              onPressed: () {
                                Navigator.pop(ctx);
                              },
                              child: const Text('確認'))
                        ],
                      ),
                    );
                    return;
                  }
                  print(_lockerIdController.text);
                  print(dropdownValue);
                  widget.updateTimesListItem(
                    TimesList(
                        id: widget.timeList.id,
                        categoryId: widget.timeList.categoryId,
                        sex: dropdownValue,
                        lockerId: _lockerIdController.text,
                        timeRange: widget.timeList.timeRange,
                        isOccupied: 'false'),
                  );
                  Navigator.pop(context);
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
