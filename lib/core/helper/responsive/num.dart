// This package provides extension methods on the num type to make it easier to work with MediaQuery and create responsive UI in Flutter applications.
import 'dart:io'; // Importing dart:io for Platform information.
import 'dart:math'; // Importing dart:math for mathematical operations.
import 'package:flutter/material.dart'; // Importing material package for Flutter UI components.
import 'package:foodease/core/helper/responsive/class.dart'; // Importing custom Responsive class.
import 'package:foodease/core/helper/responsive/enum.dart'; // Importing custom enum for DeviceType.

// Extension on num type to provide MediaQuery related operations.
extension MediaQueryValues on num {
  // Method to get height of the screen using MediaQuery.
  double height(BuildContext context) => MediaQuery.of(context).size.height;

  // Method to get width of the screen using MediaQuery.
  double width(BuildContext context) => MediaQuery.of(context).size.width;

  // Method to get aspect ratio of the screen using MediaQuery.
  double aspectRatio(BuildContext context) =>
      MediaQuery.of(context).size.aspectRatio;

  // Method to get top padding using MediaQuery.
  double toPadding(BuildContext context) =>
      MediaQuery.of(context).viewPadding.top;

  // Method to get bottom padding using MediaQuery.
  double bottom(BuildContext context) =>
      MediaQuery.of(context).viewInsets.bottom;

  // Method to calculate responsive height.
  double h(BuildContext context) =>
      (this) *
      (MediaQuery.of(context).size.height / Responsive.heightScreenDesign);

  // Method to calculate responsive height based on percentage.
  double heightPercentage(BuildContext context) =>
      (this) * (MediaQuery.of(context).size.height);

  // Method to set height based on responsive design.
  double setHeight(BuildContext context, double height) =>
      MediaQuery.of(context).size.height *
      (height / Responsive.heightScreenDesign);

  // Method to calculate responsive width.
  double w(BuildContext context) =>
      this * (MediaQuery.of(context).size.width / Responsive.widthScreenDesign);

  // Method to calculate responsive width based on percentage.
  double widthPercentage(BuildContext context, double percentage) =>
      (percentage) * (MediaQuery.of(context).size.width);

  // Method to set width based on responsive design.
  double setWidth(BuildContext context, double width) =>
      MediaQuery.of(context).size.width *
      (width / Responsive.widthScreenDesign);

  // Method to calculate responsive radius.
  double r(BuildContext context) =>
      this *
      (MediaQuery.of(context).size.shortestSide / Responsive.widthScreenDesign);

  // Method to calculate responsive radius.
  double radius(BuildContext context, double radius) =>
      radius *
      (MediaQuery.of(context).size.shortestSide / Responsive.widthScreenDesign);

  // Method to calculate responsive font size.
  double sp(BuildContext context) =>
      MediaQuery.of(context).textScaler.scale(toDouble());

  // Method to set font size based on responsive design.
  double setSp(BuildContext context) =>
      MediaQuery.of(context).textScaler.scale(toDouble());

  // Method to get device pixel ratio using MediaQuery.
  double pixelRatio(BuildContext context) =>
      MediaQuery.of(context).devicePixelRatio;

  // Method to get screen width using MediaQuery.
  double screenWidth(BuildContext context) => MediaQuery.of(context).size.width;

  // Method to get screen height using MediaQuery.
  double screenHeight(BuildContext context) =>
      MediaQuery.of(context).size.height;

  // Method to get bottom padding due to system navigation bar.
  double bottomBarHeight(BuildContext context) =>
      MediaQuery.of(context).padding.bottom;

  // Method to get top padding due to system status bar.
  double statusBarHeight(BuildContext context) =>
      MediaQuery.of(context).padding.top;

  // Method to get text scale factor using MediaQuery.
  double textScaleFactor(BuildContext context) =>
      MediaQuery.of(context).textScaleFactor;

  // Method to scale width based on screen width and responsive design.
  double scaleWidth(BuildContext context) =>
      screenWidth(context) / Responsive.widthScreenDesign;

  // Method to scale height based on screen height and responsive design.
  double scaleHeight(BuildContext context) =>
      screenHeight(context) / Responsive.heightScreenDesign;

  // Method to get current orientation of the device using MediaQuery.
  Orientation orientation(BuildContext context) =>
      MediaQuery.of(context).orientation;

  // Method to get vertical spacing based on scaling factor.
  double getVerticalSpacing(BuildContext context, double spacing) =>
      spacing * scaleHeight(context);

  // Method to get horizontal spacing based on scaling factor.
  double getHorizontalSpacing(BuildContext context, double spacing) =>
      spacing * scaleWidth(context);

  // Method to create EdgeInsets with all sides scaled.
  EdgeInsets rPaddingAll(context) => EdgeInsets.all(8 * scaleWidth(context));

  // Method to create EdgeInsets with all sides scaled.
  EdgeInsets rEdgeInsetsAll(BuildContext context, double value) =>
      EdgeInsets.all(value * scaleWidth(context));

  // Method to create EdgeInsets with specific sides scaled.
  EdgeInsets rEdgeInsetsOnly(BuildContext context,
          {double left = 0,
          double top = 0,
          double right = 0,
          double bottom = 0}) =>
      EdgeInsets.only(
          left: left * scaleWidth(context),
          top: top * scaleHeight(context),
          right: right * scaleWidth(context),
          bottom: bottom * scaleHeight(context));

  // Method to create BoxConstraints with all sides scaled.
  BoxConstraints rBoxConstraints(BuildContext context,
          {double? maxWidth,
          double? minWidth,
          double? maxHeight,
          double? minHeight}) =>
      BoxConstraints(
        maxWidth:
            maxWidth != null ? maxWidth * scaleWidth(context) : double.infinity,
        minWidth: minWidth != null ? minWidth * scaleWidth(context) : 0,
        maxHeight: maxHeight != null
            ? maxHeight * scaleHeight(context)
            : double.infinity,
        minHeight: minHeight != null ? minHeight * scaleHeight(context) : 0,
      );

  // Method to create BorderRadius with all sides scaled.
  BorderRadius circular(context) =>
      BorderRadius.circular(16 * scaleWidth(context));

  // Method to create BorderRadius with all sides scaled.
  BorderRadius rBorderRadiusAll(BuildContext context, double radius) =>
      BorderRadius.all(Radius.circular(radius * scaleWidth(context)));

  // Method to calculate diagonal length based on scaling factors.
  double diagonal(BuildContext context, num d) =>
      d * scaleHeight(context) * scaleWidth(context);

  // Method to calculate diameter based on scaling factors.
  double diameter(BuildContext context, num d) =>
      d * max(scaleWidth(context), scaleHeight(context));

  // Method to determine the device type (mobile, tablet, desktop, etc.).
  DeviceType deviceType(BuildContext context) {
    DeviceType deviceType;
    switch (Platform.operatingSystem) {
      case 'android':
      case 'ios':
        deviceType = DeviceType.mobile;
        if ((MediaQuery.of(context).orientation == Orientation.portrait &&
                Responsive.widthScreenDesign < Responsive.maxMobile) ||
            (MediaQuery.of(context).orientation == Orientation.landscape &&
                Responsive.heightScreenDesign < Responsive.maxMobile)) {
          deviceType = DeviceType.mobile;
        } else {
          deviceType = DeviceType.tablet;
        }
        break;
      case 'linux':
        deviceType = DeviceType.linux;
        break;
      case 'macos':
        deviceType = DeviceType.mac;
        break;
      case 'windows':
        deviceType = DeviceType.windows;
        break;
      case 'fuchsia':
        deviceType = DeviceType.fuchsia;
        break;
      default:
        deviceType = DeviceType.web;
    }
    return deviceType;
  }

  // Method to return a widget based on the current device type.
  Widget deviceTypeWidget(BuildContext context,
      {required Widget defaultChild,
      required Widget? android,
      required Widget? ios,
      required Widget? linux,
      required Widget? macos,
      required Widget? windows,
      required Widget? fuchsia}) {
    switch (Platform.operatingSystem) {
      case 'android':
        return android ?? defaultChild;
      case 'ios':
        return ios ?? defaultChild;
      case 'linux':
        return linux ?? defaultChild;
      case 'macos':
        return macos ?? defaultChild;
      case 'windows':
        return windows ?? defaultChild;
      case 'fuchsia':
        return fuchsia ?? defaultChild;
      default:
        return defaultChild;
    }
  }

  // Method to select layout based on screen size.
  Widget layout(BuildContext context,
      {required Widget? watch,
      required Widget mobile,
      required Widget tablet,
      required Widget desktop}) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < Responsive.maxWatch) {
          return watch ?? mobile;
        } else if (constraints.maxWidth < Responsive.maxMobile) {
          return mobile;
        } else if (constraints.maxWidth < Responsive.maxTablet) {
          return tablet;
        } else {
          return desktop;
        }
      },
    );
  }

  // Method to select layout based on screen orientation.
  Widget layoutOrientation(BuildContext context,
      {required Widget landscape, required Widget portrait}) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (MediaQuery.of(context).orientation == Orientation.landscape) {
          return landscape;
        } else {
          return portrait;
        }
      },
    );
  }

  // Method to select integer value based on screen size.
  int layoutInt(BuildContext context,
      {required int mobile, required int tablet, required int desktop}) {
    if (MediaQuery.of(context).size.width < Responsive.maxMobile) {
      return mobile;
    } else if (MediaQuery.of(context).size.width < Responsive.maxTablet) {
      return tablet;
    } else {
      return desktop;
    }
  }

  // Method to select double value based on screen size.
  double layoutDouble(BuildContext context,
      {required double mobile,
      required double tablet,
      required double desktop}) {
    if (MediaQuery.of(context).size.width < Responsive.maxMobile) {
      return mobile;
    } else if (MediaQuery.of(context).size.width < Responsive.maxTablet) {
      return tablet;
    } else {
      return desktop;
    }
  }

  // Method to select value of any type based on screen size.
  T layoutValue<T>(BuildContext context,
      {required T mobile, required T tablet, required T desktop}) {
    if (MediaQuery.of(context).size.width < Responsive.maxMobile) {
      return mobile;
    } else if (MediaQuery.of(context).size.width < Responsive.maxTablet) {
      return tablet;
    } else {
      return desktop;
    }
  }

  // Method to round the number.
  int round() {
    return round();
  }

  // Method to calculate ceiling of the number.
  int ciel() {
    return ceil();
  }

  // Method to calculate floor of the number.
  int floor() {
    return floor();
  }
}
