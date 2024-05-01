import 'package:flutter/material.dart';

class CategoryGridItem extends StatelessWidget {
  const CategoryGridItem(
      {super.key, required this.snapshot, required this.onSelectCategory});

  final dynamic snapshot;
  final void Function() onSelectCategory;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: snapshot.length,
      itemBuilder: (ctx, index) => Card(
        color: const Color.fromARGB(123, 11, 30, 58),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        elevation: 4,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            onTap: onSelectCategory,
            title: Text(
              snapshot[index].title,
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            contentPadding: const EdgeInsets.only(bottom: 20.0),
          ),
        ),
      ),
    );
  }
}
