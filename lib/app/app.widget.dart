import 'package:flutter_app/app/app.dart';
import 'package:flutter_app/pages/home.page.dart';
import 'package:flutter/material.dart';

class AppWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _AppWidgetState();
  }
}

class _AppWidgetState extends State<AppWidget> {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'App',
      home: new HomePage(),
      onGenerateRoute: MainApp.router.generator,
    );
  }
}