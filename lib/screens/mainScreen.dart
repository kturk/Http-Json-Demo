import 'package:flutter/material.dart';
import 'package:http_json_demo/data/api/categoryApi.dart';
import 'package:http_json_demo/models/category.dart';
import 'dart:convert';

class MainScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MainScreenState();
  }
}

class _MainScreenState extends State<MainScreen> {
  var categories = List<Category>();
  var categoriesAsWidgets = List<Widget>();

  @override
  void initState() {
    getCategoriesFromApi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: buildBody(),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      title: Text(
        "Products",
        style: TextStyle(color: Colors.black),
      ),
      backgroundColor: Colors.redAccent,
      centerTitle: true,
    );
  }

  Padding buildBody() {
    return Padding(
      padding: EdgeInsets.all(20.0),
      child: Column(
        children: <Widget>[
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: categoriesAsWidgets,
            ),
          ),
        ],
      ),
    );
  }

  void getCategoriesFromApi() {
    CategoryApi.getCategories().then((respond) {
      setState(() {
        Iterable decodedList = json.decode(respond.body);
        this.categories =
            decodedList.map((category) => Category.fromJson(category)).toList();
        getCategoriesAsWidgets();
      });
    });
  }

  void getCategoriesAsWidgets() {
    var length = categories.length;

    for (int i = 0; i < length; i++) {
      var widgetCategory = getCategoryWidget(categories[i]);
      categoriesAsWidgets.add(widgetCategory);
    }
  }

  Widget getCategoryWidget(Category category) {
    return FlatButton(
      onPressed: () {
        // TODO
      },
      child: Text(
        category.categoryName,
        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
        side: BorderSide(color: Colors.black),
      ),
    );
  }
}
