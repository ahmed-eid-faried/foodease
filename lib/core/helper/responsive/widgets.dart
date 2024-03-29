import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:foodease/core/helper/responsive/num.dart';

extension SizedBoxExtensions on SizedBox {
  // Method to create a SizedBox with a specific height.
  SizedBox h(double height, BuildContext context) =>
      SizedBox(height: height.h(context));

  // Method to create a SizedBox with a specific width.
  SizedBox w(double width, BuildContext context) =>
      SizedBox(width: width.w(context));
}
