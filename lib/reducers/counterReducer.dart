import 'package:flutter_app/actions/actions.dart';

int counterReducer(int currentCount, action) {
  if (action is IncrementCountAction) {
    currentCount++;
    return currentCount;
  } else if (action is DecrementCountAction) {
    currentCount--;
    return currentCount;
  } else {
    return currentCount;
  }
}