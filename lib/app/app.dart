import 'package:flutter/material.dart';
import 'package:redux/redux.dart'; // new
import 'package:flutter_redux/flutter_redux.dart'; // new
import 'package:flutter_app/app_state.dart';
import 'package:flutter_app/reducers/index.dart';
import 'package:flutter_app/app/app.widget.dart';
import 'package:flutter_app/routes/app.routes.dart';
import 'package:flutter_app/routes/auth.routes.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter_app/services/http.service.dart';




class MainApp extends StatelessWidget {
  // Application environment.
  static String environment;

  // Application router.
  static Router router;

  // Application providers.
  static HttpService http;

  MainApp({String environment, String baseUri}) {
    MainApp.environment = environment;

    // Create app http service.
    MainApp.http = new HttpService(baseUri: baseUri);

    // Create a router.
    final Router router = new Router();

    // Init and set app router.
    MainApp.router = this.initializeRoutes(router);
  }

  // Let's init our routes.
  Router initializeRoutes(Router router) {
    new AppRoutes(router);
    new AuthRoutes(router);
    return router;
  }

  String title = 'MeSuite';
  final store = new Store<AppState>(
    appReducer,
    initialState: new AppState(),
    middleware: [],
  );

  @override
  Widget build(BuildContext context) {
    // Wrap your MaterialApp in a StoreProvider
    return new StoreProvider( // new
      store: new Store<AppState>(
        appReducer,
        initialState: new AppState(),
        middleware: [],
      ), // new
      child: new MaterialApp(
        title: title,
        home: new AppWidget(),
      ),
    );
  }
}