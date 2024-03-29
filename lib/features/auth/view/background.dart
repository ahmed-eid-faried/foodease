import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:foodease/core/helper/responsive/media_query_values.dart';
import 'package:foodease/core/helper/responsive/num.dart';
import 'package:foodease/core/utill/color_resources.dart';
import 'package:foodease/core/utill/svg.dart';
import 'package:foodease/core/widgets/custom_widgets/svg_pic.dart';

class BackgroundScreen extends StatelessWidget {
  const BackgroundScreen({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                        ColorResources.getIconBg(context),
                        ColorResources.getIconBg(context).withOpacity(0)
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
                    ColorResources.getIconBg(context).withOpacity(0.7),
                    ColorResources.getIconBg(context).withOpacity(0.5),
                    ColorResources.getIconBg(context).withOpacity(0)
                  ],
                ),
              ),
            ),
          ),
          // const Text("data")
          Positioned.fill(child: child)
        ],
      ),
    );
  }
}
