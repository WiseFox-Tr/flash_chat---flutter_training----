import 'package:flutter/material.dart';

SnackBar getSnackBar(String message) {
  return SnackBar(
    backgroundColor: Colors.blueAccent,
    duration: Duration(seconds: 3),
    content: Text(
      message,
      textAlign: TextAlign.center,
      style: TextStyle(
        color: Colors.white,
        fontSize: 14.0,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}
