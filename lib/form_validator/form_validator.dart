import 'package:flutter/material.dart';

class FormValidator extends ChangeNotifier {
  bool _isvisible = false;

  // Strong password requirement
  RegExp strongPassword =
      RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#$&*~]).{8,}$');

  //Validated Email format
  RegExp emailRequirement = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

  // General Validator
  validator(String value, String message) {
    if (value.isEmpty) {
      return message;
    } else {
      return null;
    }
  }

  // Pasword validator | Strong password
  passwordValidator(String value) {
    if (value.isEmpty) {
      return "Password is required";
    } else if (!strongPassword.hasMatch(value)) {
      return "Password is not strong enough";
    } else {}
  }

  //confirm password
  confirmPass(String value1, String value2) {
    if (value1.isEmpty) {
      return "Re-enter your password";
    } else if (value1 != value2) {
      return "Passwords  don't match";
    } else {
      return null;
    }
  }

  //Note | If you don't want any text field as required | remove the value.isEmpty condition
  //Email validator
  emailValidator(String value) {
    if (value.isEmpty) {
      return "Email is required";
    } else if (!emailRequirement.hasMatch(value)) {
      return "Email is not valid";
    } else {
      return null;
    }
  }

  showSnackBar(String message, context) {
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(behavior: SnackBarBehavior.floating, content: Text(message)));
  }
}
