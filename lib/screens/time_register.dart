import 'package:flutter/material.dart';
import 'package:time_fit_mobile/models/times_lists.dart';
import 'package:time_fit_mobile/widgets/times_list_item.dart';

class TimeRegisterScreen extends StatelessWidget {
  const TimeRegisterScreen(
      {super.key, required this.title, required this.timeLists});

  final String title;
  final List<TimesList> timeLists;

  // 这个页面显示 所有 可以 预约的时间项目

  @override
  Widget build(BuildContext context) {
    Widget content = ListView.builder(
      itemCount: timeLists.length,
      itemBuilder: (ctx, index) => TimesListItem(timeList: timeLists[index]),
    );
    if (timeLists.isEmpty) {
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
        title: Text(title),
      ),
      body: content,
    );
  }
}
