import 'package:flutter/material.dart';
import 'package:time_fit_mobile/models/times_lists.dart';
import 'package:time_fit_mobile/widgets/update_time_list.dart';

class TimesListItem extends StatefulWidget {
  const TimesListItem({super.key, required this.timeList});
  final TimesList timeList;

  @override
  State<TimesListItem> createState() {
    return _TimesListItemState();
  }
}

class _TimesListItemState extends State<TimesListItem> {
  void _openSelectTimeOverlay() {
    // ...
    showModalBottomSheet(
        context: context,
        builder: (ctx) {
          return const UpdateTimeList();
        });
  }

  // void _updateSelectedTime(TimesList timesList) {
  //   setState(() {

  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        onTap: _openSelectTimeOverlay,
        child: Stack(
          children: [
            Container(
              padding: const EdgeInsets.all(18),
              child: Text(
                widget.timeList.timeRange,
                maxLines: 2,
                textAlign: TextAlign.center,
                softWrap: true,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                const SizedBox(width: 16),
                Text(
                  widget.timeList.sex + widget.timeList.lockerId,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                      color: Colors.white),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
