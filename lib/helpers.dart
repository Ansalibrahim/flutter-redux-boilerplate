import 'package:flutter_app/app/app.dart';
import 'package:flutter_app/support/validators/base.validator.dart';
import 'package:flutter/material.dart';

// Let's validate!
String validate(
    Object value, String attribute, List<BaseValidator> validators) {
  String result;

  // Continue test while if result is null.
  validators.takeWhile((BaseValidator validator) {
    return result == null;
  }).forEach((BaseValidator validator) {
    result = validator.validate(value, attribute);
  });

  return result;
}

// Navigate
void navigate(BuildContext context, String routePath,
    {Map<String, dynamic> params}) {
  MainApp.router.navigateTo(context, routePath);
}

// Redirect
void redirect(BuildContext context, String routePath) {
  Navigator.pushReplacementNamed(context, routePath);
}
