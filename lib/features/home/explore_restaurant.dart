import 'package:flutter/material.dart';
import 'package:foodease/core/helper/responsive/num.dart';
import 'package:foodease/core/helper/responsive/widgets.dart';
import 'package:foodease/core/theme/controllers/theme_controller.dart';
import 'package:foodease/core/utill/svg.dart';
import 'package:foodease/core/widgets/custom_widgets/svg_pic.dart';
import 'package:foodease/core/widgets/custom_widgets/text_form_field_custom.dart';
import 'package:foodease/features/auth/view/background.dart';
import 'package:foodease/features/home/home.dart';
import 'package:foodease/features/home/home_controller.dart';
import 'package:provider/provider.dart';

// ExploreRestaurant
class ExploreRestaurant extends StatelessWidget {
  const ExploreRestaurant({super.key});

  @override
  Widget build(BuildContext context) {
    return BackgroundScreen(
        child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 25.w(context)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox().h(60, context),
          const TileHomeWidget(),
          const SizedBox().h(20, context),
          Row(
            children: [
              TextFormFieldCustom(
                width: 325.w(context),
                title: 'What do you want to order?',
                prefixIcon: SvgPictureCustom(
                  AppSvg.search,
                  color: Provider.of<ThemeController>(context).white,
                ),
                fontSize: 14.sp(context),
              ),
            ],
          ),
          const SizedBox().h(20, context),
          Text(
            'Popular Restaurant',
            style: TextStyle(
              color: Colors.white,
              fontSize: 15.sp(context),
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox().h(20, context),
          const ExploreRestaurantWidget(),
          const SizedBox().h(25, context),
        ],
      ),
    ));
  }
}

class ExploreRestaurantWidget extends StatelessWidget {
  const ExploreRestaurantWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: (context.watch<HomeProvider>().filters.isNotEmpty)
          ? 440.h(context)
          : 490.h(context),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: List.generate(10, (index) => const RestaurantWidget()),
            ),
            const SizedBox().h(75, context)
          ],
        ),
      ),
    );
  }
}
