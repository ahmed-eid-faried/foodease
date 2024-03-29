// This import statement is bringing in necessary packages from the Dart SDK and Flutter framework.
import 'dart:io'; // Provides classes for working with files, directories, and other I/O operations.
import 'dart:math'; // Provides mathematical constants and functions.
import 'package:flutter/material.dart';
import 'package:foodease/core/helper/responsive/class.dart';
import 'package:foodease/core/helper/responsive/enum.dart'; // Imports the Flutter Material Design library.

// Extension to calculate responsive sizes and dimensions based on the device's screen size.
extension MediaQueryValues on BuildContext {
  // Retrieves MediaQueryData from the current BuildContext.
  MediaQueryData get _mediaQueryData => MediaQuery.of(this);

  // Provides various properties of the device's screen size and dimensions.
  double get height => _mediaQueryData.size.height; // Height of the screen.
  double get width => _mediaQueryData.size.width; // Width of the screen.
  double get aspectRatio =>
      _mediaQueryData.size.aspectRatio; // Aspect ratio of the screen.
  double get toPadding =>
      _mediaQueryData.viewPadding.top; // Top padding of the view.
  double get bottom =>
      _mediaQueryData.viewInsets.bottom; // Bottom padding of the view.

  //////////////////////////////////////////////////////////////////////////////////////////////////////////////

  // Methods to calculate responsive sizes for height, width, radius, and font size.
  double h(double i) =>
      (i) *
      (_mediaQueryData.size.height /
          Responsive.heightScreenDesign); // Responsive height.
  double heightPercentage(double percentage) =>
      (percentage) *
      (_mediaQueryData.size.height); // Responsive height in percentage.
  double setHeight(double height) =>
      _mediaQueryData.size.height *
      (height / Responsive.heightScreenDesign); // Set height.
  double w(double i) =>
      (i) *
      (_mediaQueryData.size.width /
          Responsive.widthScreenDesign); // Responsive width.
  double widthPercentage(double percentage) =>
      (percentage) *
      (_mediaQueryData.size.width); // Responsive width in percentage.
  double setWidth(double width) =>
      _mediaQueryData.size.width *
      (width / Responsive.widthScreenDesign); // Set width.
  double r(double radius) =>
      radius *
      (_mediaQueryData.size.shortestSide /
          Responsive.widthScreenDesign); // Responsive radius.
  double radius(double radius) =>
      radius *
      (_mediaQueryData.size.shortestSide /
          Responsive.widthScreenDesign); // Responsive radius.
  double sp(double fontSize) =>
      _mediaQueryData.textScaler.scale(fontSize); // Responsive font size.
  double setSp(double fontSize) =>
      _mediaQueryData.textScaler.scale(fontSize); // Set font size.

  //////////////////////////////////////////////////////////////////////////////////////////////////////////////
  //////////////////////////////////////////////////////////////////////////////////////////////////////////////

  // Methods to retrieve device-specific properties.
  double get pixelRatio =>
      _mediaQueryData.devicePixelRatio; // Pixel ratio of the device.
  double get screenWidth => _mediaQueryData.size.width; // Width of the screen.
  double get screenHeight =>
      _mediaQueryData.size.height; // Height of the screen.
  double get bottomBarHeight =>
      _mediaQueryData.padding.bottom; // Height of the bottom navigation bar.
  double get statusBarHeight =>
      _mediaQueryData.padding.top; // Height of the status bar.
  double get textScaleFactor =>
      _mediaQueryData.textScaler.scale(1); // Text scaling factor.

  // Methods to calculate scaling factors for width and height.
  double get scaleWidth =>
      screenWidth / Responsive.widthScreenDesign; // Width scaling factor.
  double get scaleHeight =>
      screenHeight / Responsive.heightScreenDesign; // Height scaling factor.

  // Retrieves the device orientation.
  Orientation get orientation => _mediaQueryData.orientation;

  // Methods to calculate spacing according to the scaling factors.
  double getVerticalSpacing(double spacing) =>
      spacing * scaleHeight; // Vertical spacing.
  double getHorizontalSpacing(double spacing) =>
      spacing * scaleWidth; // Horizontal spacing.

  // Methods to create EdgeInsets with scaled values.
  EdgeInsets get rPaddingAll =>
      EdgeInsets.all(8 * scaleWidth); // EdgeInsets for all sides.
  EdgeInsets rEdgeInsetsAll(double value) => EdgeInsets.all(
      value * scaleWidth); // EdgeInsets for all sides with custom value.
  EdgeInsets rEdgeInsetsOnly(
          {double left = 0,
          double top = 0,
          double right = 0,
          double bottom = 0}) =>
      EdgeInsets.only(
          left: left * scaleWidth,
          top: top * scaleHeight,
          right: right * scaleWidth,
          bottom: bottom *
              scaleHeight); // EdgeInsets for specified sides with custom values.

  // Method to create BoxConstraints with scaled values.
  BoxConstraints rBoxConstraints(
          {double? maxWidth,
          double? minWidth,
          double? maxHeight,
          double? minHeight}) =>
      BoxConstraints(
        maxWidth: maxWidth != null ? maxWidth * scaleWidth : double.infinity,
        minWidth: minWidth != null ? minWidth * scaleWidth : 0,
        maxHeight:
            maxHeight != null ? maxHeight * scaleHeight : double.infinity,
        minHeight: minHeight != null ? minHeight * scaleHeight : 0,
      );

  // Methods to create BorderRadius with scaled values.
  BorderRadius get circular => BorderRadius.circular(
      16 * scaleWidth); // BorderRadius for circular shape.
  BorderRadius rBorderRadiusAll(double radius) =>
      BorderRadius.all(Radius.circular(radius *
          scaleWidth)); // BorderRadius for all corners with custom radius.

  //////////////////////////////////////////////////////////////////////////////////////////////////////////////

  // Method to calculate diagonal size based on both width and height scaling factors.
  double diagonal(num d) => d * scaleHeight * scaleWidth;

  // Method to calculate diameter based on the maximum scaling factor.
  double diameter(num d) => d * max(scaleWidth, scaleHeight);

  //////////////////////////////////////////////////////////////////////////////////////////////////////////////

  // Method to determine the type of device.
  DeviceType deviceType() {
    DeviceType deviceType;
    switch (Platform.operatingSystem) {
      case 'android':
      case 'ios':
        deviceType = DeviceType.mobile;
        if ((MediaQuery.of(this).orientation == Orientation.portrait &&
                Responsive.widthScreenDesign < Responsive.maxMobile) ||
            (MediaQuery.of(this).orientation == Orientation.landscape &&
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

// If the operating system is one of the specified platforms (android, ios, linux,
// macos, windows, or fuchsia), the function returns the corresponding widget
// that was passed in as an argument. If the operating system is not one of the
// specified platforms, the function returns the default widget that was passed in
//as the defaultChild parameter.
  Widget deviceTypeWidget({
    required Widget defaultChild,
    required Widget? android,
    required Widget? ios,
    required Widget? linux,
    required Widget? macos,
    required Widget? windows,
    required Widget? fuchsia,
  }) {
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

  // Method to render different layouts based on the device's screen size.
  Widget layout({
    required Widget? watch,
    required Widget mobile,
    required Widget tablet,
    required Widget desktop,
  }) {
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

  /// A reusable widget that displays a different layout based on the orientation of the screen.
  /// This widget takes two required parameters, `landscape` and `portrait`, which
  /// are both widgets that will be displayed based on the current orientation of the
  /// device's screen.
  Widget layoutOrientation({
    required Widget landscape,
    required Widget portrait,
  }) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (_mediaQueryData.orientation == Orientation.landscape) {
          return landscape;
        } else {
          return portrait;
        }
      },
    );
  }

  // Method to retrieve an integer value based on the device's screen size.
  int layoutInt({
    required int mobile,
    required int tablet,
    required int desktop,
  }) {
    if (_mediaQueryData.size.width < Responsive.maxMobile) {
      return mobile;
    } else if (_mediaQueryData.size.width < Responsive.maxTablet) {
      return tablet;
    } else {
      return desktop;
    }
  }

  // Method to retrieve a double value based on the device's screen size.
  double layoutDouble({
    required double mobile,
    required double tablet,
    required double desktop,
  }) {
    if (_mediaQueryData.size.width < Responsive.maxMobile) {
      return mobile;
    } else if (_mediaQueryData.size.width < Responsive.maxTablet) {
      return tablet;
    } else {
      return desktop;
    }
  }

  // Method to retrieve a generic value based on the device's screen size.
  T layoutValue<T>({
    required T mobile,
    required T tablet,
    required T desktop,
  }) {
    if (_mediaQueryData.size.width < Responsive.maxMobile) {
      return mobile;
    } else if (_mediaQueryData.size.width < Responsive.maxTablet) {
      return tablet;
    } else {
      return desktop;
    }
  }
}
