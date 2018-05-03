import 'package:flutter_app/pages/about.page.dart';
import 'package:flutter_app/widgets/bottom_navigation.widget.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  AppRoutes(Router router) {
    router.define('home', handler: new Handler(
        handlerFunc: (BuildContext context, Map<String, dynamic> params) {
      return new BottomNavigationDemo();
    }));

    router.define('about', handler: new Handler(
        handlerFunc: (BuildContext context, Map<String, dynamic> params) {
      return new AboutPage();
    }));
  }
}
