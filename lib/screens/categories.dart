import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:time_fit_mobile/screens/time_register.dart';
import 'package:time_fit_mobile/widgets/category_grid_item.dart';

import '../data/dummy_data.dart';
import '../models/categroy.dart';
import '../models/times_lists.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
//Applying get request.
  List<TimesList> timsLists = [];

  void _selectCategory(BuildContext context, dynamic category) async {
    timsLists = await getAllTimesListsReq();
    print('...******');
    print(timsLists[0].categoryId);
    final filteredTimeLists =
        timsLists.where((timelist) => timelist.categoryId == 1).toList();

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

  Future<List<TimesList>> getAllTimesListsReq() async {
    String url = "http://192.168.56.1:5300/timslists";
    final response = await http.get(Uri.parse(url));
    var responseData = json.decode(response.body);

//Creating a list to store input data;
    for (var item in responseData) {
      TimesList timsList = TimesList(
          id: item["id"],
          categoryId: item["category_id"],
          sex: item["sex"],
          lockerId: item["locker_id"],
          timeRange: item["time_range"],
          isOccupied: item["is_occupied"]);
      timsLists.add(timsList);
    }
    return timsLists;
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
