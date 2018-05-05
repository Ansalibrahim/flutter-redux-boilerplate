import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_app/actions/actions.dart';
import 'package:flutter_app/app_state.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_app/helpers.dart';


class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  var i = 0;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text('Home'),
            leading: new FlatButton(
//              icon: new Icon(Icons.playlist_play),
              child: new Text('logout', style:new TextStyle(color: Colors.white)),
              onPressed: () {
                redirect(context, 'auth/login');
              },
            ) ,
          actions: <Widget>[
            new FlatButton(
//              icon: new Icon(Icons.playlist_play),
              child: new Text('about', style:new TextStyle(color: Colors.white)),
              onPressed: () {
                navigate(context, 'about');
              },
            )
          ],
        ),
        body: new Container(
//          alignment: Alignment.center,
          padding: new EdgeInsets.all(32.0),
//          color: Colors.teal.shade700,
          child: new Center(
            child: new Column(
              children: <Widget>[
                new Flexible(
                  child: new Center(
                      child: new StoreConnector<AppState, _ViewModel>(
                        // Rather than build a method here, we'll defer this
                        // responsibilty to the _viewModel.
                          converter: _ViewModel.fromStore,
                          // Our builder now takes in a _viewModel as a second arg
                          builder: (BuildContext context, _ViewModel vm) {
                            return new Text(
                              // Our _viewModel is 'watching' the count slice of state
                              // So this will be rerendered when that slice of
                              // state changes
                              vm.count.toString(),
                              style: Theme
                                  .of(context)
                                  .textTheme
                                  .display1,
                            );
                          }
                      )),
                ),
                new Flexible(
                    child: new Row(
                      children: <Widget>[
                        new Expanded(
                          child: new StoreConnector<AppState, VoidCallback>(
                            converter: (Store<AppState> store) {
                              return () {
                                store.dispatch(new IncrementCountAction());
                              };
                            },
                            builder: (BuildContext context,
                                VoidCallback increase) {
                              return new RaisedButton(
                                onPressed: increase,
                                child: new Icon(Icons.add),
                              );
                            },
                          ),),
                        new Expanded(
                          child: new StoreConnector<AppState, VoidCallback>(
                            converter: (Store<AppState> store) {
                              return () {
                                store.dispatch(new DecrementCountAction());
                              };
                            },
                            builder: (BuildContext context,
                                VoidCallback decrease) {
                              return new RaisedButton(
                                onPressed: decrease,
                                child: new Text('substract'),
                              );
                            },
                          ),)
                      ],
                    )
                )
              ],
            ),
          ),

        ));
  }
}


// This is just a class -- nothing fancy
class _ViewModel {
  // It should take in whatever it is you want to 'watch'
  final int count;

  _ViewModel({
    @required this.count,
  });

  // This is simply a constructor method.
  // This creates a new instance of this _viewModel
  // with the proper data from the Store.
  //
  // This is a very simple example, but it lets our
  // actual counter widget do things like call 'vm.count'
  static _ViewModel fromStore(Store<AppState> store) {
    return new _ViewModel(count: store.state.count);
  }
}