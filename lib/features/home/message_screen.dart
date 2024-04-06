import 'package:flutter/material.dart';
import 'package:foodease/core/helper/responsive/num.dart';
import 'package:foodease/core/helper/responsive/widgets.dart';
import 'package:foodease/core/utill/color_resources.dart';
import 'package:foodease/core/utill/images.dart';
import 'package:foodease/core/widgets/custom_widgets/appbar/custom_app_bar.dart';
// import 'package:foodease/core/widgets/common/custom_app_bar_widget.dart';
import 'package:foodease/core/widgets/custom_widgets/custom_scaffold.dart';
import 'package:foodease/features/home/home.dart';

class MessageScreen extends StatelessWidget {
  const MessageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
        appBar: const CustomAppBar(text: ""),
        body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.w(context)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                    width: 325.w(context),
                    child: Text(
                      'Chat',
                      style: TextStyle(
                        color: ColorResources.getTextTitle(context),
                        fontSize: 25.sp(context),
                        fontWeight: FontWeight.w400,
                      ),
                    )),
                SizedBox(
                  height: 640.h(context),
                  child: ListView.separated(
                      itemCount: 4,
                      shrinkWrap: true,
                      padding: EdgeInsets.zero,
                      // physics: const NeverScrollableScrollPhysics(),
                      separatorBuilder: (context, index) =>
                          const SizedBox().h(8, context),
                      itemBuilder: (context, index) => const ListViewCard(
                            image: AppImage.man,
                            title: 'Ahmed Mady',
                            subtitle: 'Your Order Just Arrived!',
                            time: '20:00',
                          )),
                ),
                const SizedBox().h(20, context),
              ],
            )));
  }
}
