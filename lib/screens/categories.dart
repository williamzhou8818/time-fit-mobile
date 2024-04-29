import 'package:flutter/material.dart';
import 'package:time_fit_mobile/data/dummy_data.dart';
import 'package:time_fit_mobile/models/categroy.dart';
import 'package:time_fit_mobile/screens/time_register.dart';
import 'package:time_fit_mobile/widgets/category_grid_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  void _selectCategory(BuildContext context, Category category) {
    final filteredTimeLists = dummyTimeList
        .where((timelist) => timelist.categoryId.contains(category.id))
        .toList();

    // Navigator.push(context, route);
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => TimeRegisterScreen(
            title: category.title, timeLists: filteredTimeLists),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('トレーニング機材を選んでください'),
        ),
        body: GridView(
          padding: const EdgeInsets.all(24),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1,
            childAspectRatio: 3 / 1,
            crossAxisSpacing: 5,
            mainAxisSpacing: 5,
          ),
          children: [
            // availableCategories.map((category) => CategoryGridItem(category: ))
            for (final category in availableCategories)
              CategoryGridItem(
                category: category,
                onSelectCategory: () {
                  _selectCategory(context, category);
                },
              ),
          ],
        ));
  }
}
