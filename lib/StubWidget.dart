import 'package:flutter/material.dart';

class StubWidget extends StatefulWidget {
  StubWidget({Key key, this.cityName}) : super(key: key);

  final String cityName;

  @override
  _StubWidget createState() => _StubWidget();
}

class _StubWidget extends State<StubWidget> {
  String cityname = "London";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset("assets/images/not_found.png", height: 100, width: 100),
            Text(
              'We can\'t find city: $cityname',
            ),
          ],
        ),
      ),
    );
  }
}
