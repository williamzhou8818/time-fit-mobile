import 'package:flutter/material.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('トレーニング機材を選んでください'),
        ),
        body: GridView(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1,
            childAspectRatio: 3 / 1,
            crossAxisSpacing: 5,
            mainAxisSpacing: 5,
          ),
          children: const [
            Text('1', style: TextStyle(color: Colors.white)),
            Text('2', style: TextStyle(color: Colors.white)),
            Text('3', style: TextStyle(color: Colors.white)),
            Text('4', style: TextStyle(color: Colors.white)),
          ],
        ));
  }
}
