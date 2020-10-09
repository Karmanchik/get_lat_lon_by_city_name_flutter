import 'package:flutter/material.dart';
import 'package:flutter_weather_test_app/WeatherArray.dart';
import 'package:flutter_weather_test_app/WeatherDataItem.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_weather_test_app/StubWidget.dart';
import 'package:flutter_weather_test_app/ListWidget.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: "",),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  String enteredCity = "";

  void fetchLocations() async {
    final response = await http.get('https://www.metaweather.com/api/location/search/?query=$enteredCity');

    if (response.statusCode == 200) {

      Iterable answerJson = json.decode(response.body);
      List<WeatherDataItem> answer = answerJson.map((model) => WeatherDataItem.fromJson(model)).toList();
      if (answer.length == 0)
        Navigator.push(context, MaterialPageRoute(builder: (context) => StubWidget()));
      else
        Navigator.push(context, MaterialPageRoute(builder: (context) => ListWidget(items: answer,)));
    } else {
      Navigator.push(context, MaterialPageRoute(builder: (context) => StubWidget()));
    }
  }

  void getWeather() {
    setState(() {
      fetchLocations();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(50),
              child:

                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Enter city name',
                    ),
                    TextField(
                      textAlign: TextAlign.center,
                      onChanged: (newText) { enteredCity = newText; },
                      decoration: new InputDecoration.collapsed(hintText: "London"),
                    ),
                    Divider(),
                    FlatButton(
                      color: Colors.blue,
                      textColor: Colors.white,
                      disabledColor: Colors.grey,
                      disabledTextColor: Colors.black,
                      padding: EdgeInsets.all(8.0),
                      splashColor: Colors.blueAccent,
                      onPressed: () {
                        getWeather();
                      },
                      child: Text(
                        "Ok",
                        style: TextStyle(fontSize: 20.0),
                      ),
                    )
                  ],
                )

            )
          ],
        ),
      ),
    );
  }
}
