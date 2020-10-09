import 'package:flutter/material.dart';

abstract class ListItem {
  /// The title line to show in a list item.
  Widget buildTitle(BuildContext context);

  /// The subtitle line, if any, to show in a list item.
  Widget buildSubtitle(BuildContext context);
}

/// A ListItem that contains data to display a heading.
class WeatherItem implements ListItem {
  final String cityName;
  final String tempValue;

  WeatherItem(this.cityName, this.tempValue);

  Widget buildTitle(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: Text(cityName),
        ),
        Expanded(
          child: Text(tempValue),
        ),
      ],
    );
  }

  Widget buildSubtitle(BuildContext context) => null;
}