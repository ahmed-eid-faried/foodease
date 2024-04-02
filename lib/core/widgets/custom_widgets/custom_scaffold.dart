import 'package:flutter/material.dart';
import 'package:foodease/core/utill/color_resources.dart';
import 'package:foodease/features/auth/view/background.dart';

class CustomScaffold extends StatelessWidget {
  const CustomScaffold({
    super.key,
    this.floatingActionButton,
    required this.body,
    this.appBar,
    this.backgroundColor,
    this.extendBodyBehindAppBar = false,
    this.bottomNavigationBar,
    this.extendBody = true,
  });
  final bool extendBodyBehindAppBar;
  final Widget? floatingActionButton;
  final Widget body;
  final PreferredSizeWidget? appBar;
  final Color? backgroundColor;
  final Widget? bottomNavigationBar;
  final bool extendBody;
  @override
  Widget build(BuildContext context) {
    return BackgroundScreen(
      appBar: appBar,
      backgroundColor: backgroundColor ?? ColorResources.getHomeBg(context),
      bottomNavigationBar: bottomNavigationBar,
      extendBody: extendBody,
      floatingActionButton: floatingActionButton,
      extendBodyBehindAppBar: extendBodyBehindAppBar,
      child: body,
    );
  }
}
//  GestureDetector(
// onHorizontalDragEnd: (details) {
//   if (details.primaryVelocity! > 0) {
//     Navigator.of(context).pop();
//   }
// },
// child:
// Scaffold(

// body: NotificationListener<ScrollNotification>(
//     onNotification: (scrollNotification) {
//       if (scrollNotification is ScrollEndNotification &&
//           scrollNotification.metrics.pixels ==
//               scrollNotification.metrics.maxScrollExtent) {
//         Navigator.of(context).pop();
//       }
//       return false;
//     },
//     child: ListView(
//       scrollDirection: Axis.horizontal,
// children: [body],
//     )),
// ),
