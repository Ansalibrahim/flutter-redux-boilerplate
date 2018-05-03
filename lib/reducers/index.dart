import 'package:flutter_app/app_state.dart';
import 'package:flutter_app/reducers/counterReducer.dart';

AppState appReducer(AppState state, action) {
  return new AppState(
    isLoading: false,
    count: counterReducer(state.count, action),
  );
}