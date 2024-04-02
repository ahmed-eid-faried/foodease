import 'package:flutter/material.dart';
import 'package:foodease/core/helper/responsive/media_query_values.dart';
import 'package:foodease/core/helper/responsive/num.dart';
import 'package:foodease/core/helper/responsive/widgets.dart';
import 'package:foodease/core/utill/color_resources.dart';
import 'package:foodease/core/utill/svg.dart';
import 'package:foodease/core/widgets/custom_widgets/svg_pic.dart';

class BackgroundScreen extends StatelessWidget {
  const BackgroundScreen(
      {super.key,
      required this.child,
      this.extendBodyBehindAppBar = false,
      this.floatingActionButton,
      this.appBar,
      this.backgroundColor,
      this.bottomNavigationBar,
      this.extendBody = true,
      this.appBarOutline});
  final Widget child;
////////////////////////////////////////////////////////////////////////////////
  final bool extendBodyBehindAppBar;
  final Widget? floatingActionButton;
  final Widget? appBar;
  final PreferredSizeWidget? appBarOutline;
  final Color? backgroundColor;
  final Widget? bottomNavigationBar;
  final bool extendBody;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: ColorResources.getHomeBg(context),
      appBar: appBarOutline,
      backgroundColor: backgroundColor ?? ColorResources.getHomeBg(context),
      bottomNavigationBar: bottomNavigationBar,
      extendBody: extendBody,
      floatingActionButton: floatingActionButton,
      extendBodyBehindAppBar: extendBodyBehindAppBar,
      resizeToAvoidBottomInset: true,
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: Container(
                  width: 376.w(context),
                  height: context.height / 2,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: const Alignment(0.00, -1.00),
                      end: const Alignment(0, 1),
                      colors: [
                        ColorResources.getHomeBg(context),
                        ColorResources.getHomeBg(context).withOpacity(0)
                      ],
                    ),
                  ),
                  child: SvgPictureCustom(
                    AppSvg.background,
                    boxFit: BoxFit.cover,
                    height: context.height / 2,
                    width: context.width,
                  ),
                ),
              ),
              SizedBox(height: context.height / 2, width: context.width),
            ],
          ),
          Positioned.fill(
            child: Container(
              width: context.width,
              height: context.height / 2,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: const Alignment(0.00, 1.00),
                  end: const Alignment(0, -1),
                  colors: [
                    ColorResources.getHomeBg(context).withOpacity(0.7),
                    ColorResources.getHomeBg(context).withOpacity(0.5),
                    ColorResources.getHomeBg(context).withOpacity(0)
                  ],
                ),
              ),
            ),
          ),
          // const Text("data")
          // Visibility(
          //   visible: appBar != null,
          //   child: Positioned(
          //     top: 0,
          //     height: 100.h(context),
          //     child: appBar ?? Container(),
          //   ),
          // ),
          Positioned.fill(
              child: Column(
            children: [
              appBar ?? Container(),
              const SizedBox().h(20, context),
              Expanded(child: child),
            ],
          ))
        ],
      ),
    );
  }
}
