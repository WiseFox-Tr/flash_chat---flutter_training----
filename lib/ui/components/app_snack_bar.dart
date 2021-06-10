import 'package:flutter/material.dart';

SnackBar getSnackBar(String message) {
  return SnackBar(
    backgroundColor: Colors.red,
    duration: Duration(seconds: 3),
    content: Text(
      message,
      textAlign: TextAlign.center,
      style: TextStyle(
        color: Colors.white,
        fontSize: 18.0,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}
