import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:time_fit_mobile/screens/time_register.dart';
import 'package:time_fit_mobile/widgets/category_grid_item.dart';

import '../data/dummy_data.dart';
import '../models/categroy.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
//Applying get request.

  void _selectCategory(BuildContext context, dynamic category) {
    final filteredTimeLists = dummyTimeList
        .where((timelist) => timelist.categoryId.contains('c1'))
        .toList();

    // Navigator.push(context, route);
    print(category[0].title);
    print(filteredTimeLists);
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => TimeRegisterScreen(
            title: category[0].title, timeLists: filteredTimeLists),
      ),
    );
  }

  Future<List<Category>> getRequest() async {
    //replace your restFull API here.
    String url = "http://192.168.56.1:5300/categorys";
    final response = await http.get(Uri.parse(url));

    var responseData = json.decode(response.body);

    //Creating a list to store input data;
    List<Category> users = [];
    for (var singleUser in responseData) {
      Category user = Category(
          id: singleUser["id"],
          title: singleUser["title"],
          color: singleUser["color"]);

      //Adding user to the list.
      users.add(user);
    }
    return users;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Http Get Request."),
          leading: const Icon(
            Icons.get_app,
          ),
        ),
        body: Container(
          padding: const EdgeInsets.all(16.0),
          child: FutureBuilder(
            future: getRequest(),
            builder: (BuildContext ctx, AsyncSnapshot snapshot) {
              if (snapshot.data == null) {
                return Container(
                  child: const Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              } else {
                return CategoryGridItem(
                  snapshot: snapshot.data,
                  onSelectCategory: () {
                    _selectCategory(context, snapshot.data);
                  },
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
