import 'package:flutter/material.dart';
import 'package:flutter_weather_test_app/WeatherDataItem.dart';
import 'package:flutter_weather_test_app/WeatherItem.dart';

class ListWidget extends StatefulWidget {
  ListWidget({Key key, this.items}) : super(key: key);


  final List<WeatherDataItem> items;

  @override
  _ListWidget createState() =>
      _ListWidget(itemsIn: items.map((it) => WeatherItem(it.title, it.latt_long)).toList());
}

class _ListWidget extends State<ListWidget> {

  _ListWidget({this.itemsIn});

  final List<ListItem> itemsIn;// = //[items.map((it) => WeatherItem(it.))];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: itemsIn.length,
        itemBuilder: (context, index) {
          final item = itemsIn[index];

          return ListTile(
            title: item.buildTitle(context),
            subtitle: item.buildSubtitle(context),
          );
        },
      )
    );
  }
}
