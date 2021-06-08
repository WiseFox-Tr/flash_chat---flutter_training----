import 'package:flutter/material.dart';

double getPercentOfScreenHeight(BuildContext context, double percent) => MediaQuery.of(context).size.height * percent / 100;
double getPercentOfScreenWidth(BuildContext context, double percent) => MediaQuery.of(context).size.width * percent / 100;