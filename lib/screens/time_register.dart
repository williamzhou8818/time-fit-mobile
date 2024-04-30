import 'package:flutter/material.dart';
import 'package:time_fit_mobile/models/times_lists.dart';
import 'package:time_fit_mobile/widgets/times_list_item.dart';

class TimeRegisterScreen extends StatefulWidget {
  const TimeRegisterScreen(
      {super.key, required this.title, required this.timeLists});

  final String title;
  final List<TimesList> timeLists;
  @override
  State<TimeRegisterScreen> createState() {
    return _TimeRegisterScreenState();
  }
}

class _TimeRegisterScreenState extends State<TimeRegisterScreen> {
  // 这个页面显示 所有 可以 预约的时间项目
  late List<TimesList> _timeListsState;
  @override
  void initState() {
    _timeListsState = widget.timeLists;
    super.initState();
  }

  void updateTimesLists(TimesList timesList) {
    print('timss');
    print(timesList.id);
    print(_timeListsState.indexWhere((ele) => ele.id == timesList.id));
    setState(() {
      _timeListsState[
              _timeListsState.indexWhere((ele) => ele.id == timesList.id)]
          .sex = timesList.sex;

      _timeListsState[
              _timeListsState.indexWhere((ele) => ele.id == timesList.id)]
          .lockerId = timesList.lockerId;

      _timeListsState[
              _timeListsState.indexWhere((ele) => ele.id == timesList.id)]
          .isOccupied = timesList.isOccupied;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget content = ListView.builder(
      itemCount: widget.timeLists.length,
      itemBuilder: (ctx, index) => TimesListItem(
        timeList: widget.timeLists[index],
        updateTimesListItem: updateTimesLists,
      ),
    );
    if (widget.timeLists.isEmpty) {
      content = Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Uh oh ... nothing here!',
              style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            const SizedBox(height: 16),
            Text(
              '別の器材を選んでください',
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
          ],
        ),
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: content,
    );
  }
}
