import 'package:flutter/material.dart';
import 'package:foodease/core/helper/responsive/num.dart';
import 'package:foodease/core/helper/responsive/widgets.dart';
import 'package:foodease/core/theme/controllers/theme_controller.dart';
import 'package:foodease/core/utill/color_resources.dart';
import 'package:foodease/core/utill/images.dart';
import 'package:foodease/core/utill/svg.dart';
import 'package:foodease/core/widgets/custom_widgets/svg_pic.dart';
import 'package:foodease/core/widgets/custom_widgets/text_form_field_custom.dart';
import 'package:foodease/features/auth/view/background.dart';
import 'package:foodease/features/auth/view/signup.dart';
import 'package:foodease/features/onboarding/onboarding.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  const Home({super.key});

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
          Row(
            children: [
              SizedBox(
                width: 233.w(context),
                child: const Text(
                  'Find Your \nFavorite Food',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 31,
                    fontFamily: 'BentonSans',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              const SizedBox().w(28, context),
              Container(
                width: 45.r(context),
                height: 45.r(context),
                padding: const EdgeInsets.all(12),
                decoration: ShapeDecoration(
                  color: Colors.white.withOpacity(0.1),
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                        width: 1,
                        color: const Color(0xFFF4F4F4).withOpacity(0.1)),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  shadows: const [
                    BoxShadow(
                      color: Color(0x115A6CEA),
                      blurRadius: 50,
                      offset: Offset(12, 26),
                      spreadRadius: 0,
                    )
                  ],
                ),
                child: const SvgPictureCustom(
                    1 == 1 ? AppSvg.notificationsActive : AppSvg.notifications),
              )
            ],
          ),
          const SizedBox().h(20, context),
          Row(
            children: [
              TextFormFieldCustom(
                width: 260.w(context),
                title: 'What do you want to order?',
                prefixIcon: SvgPictureCustom(
                  AppSvg.search,
                  color: Provider.of<ThemeController>(context).white,
                ),
                fontSize: 14.sp(context),
              ),
              const SizedBox().w(8, context),
              ButtonCustom(
                minWidth: 50.w(context),
                height: 50.w(context),
                padding: 8,
                onPressed: () {},
                child: SvgPictureCustom(
                  AppSvg.filter,
                  width: 24.r(context),
                  height: 24.r(context),
                ),
              ),
            ],
          ),
          const SizedBox().h(10, context),
          const ScrollViewHomeWidget(),
          const SizedBox().h(25, context),
        ],
      ),
    ));
  }
}

class ScrollViewHomeWidget extends StatelessWidget {
  const ScrollViewHomeWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 540.h(context),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox().h(10, context),
            const BannerWidget(),
            const SizedBox().h(25, context),
            ItemHomeWidget(
              title: 'Nearest Restaurant',
              onPressed: () {},
              child: SizedBox(
                height: 184.h(context),
                child: const RestaurantListWidget(),
              ),
            ),
            const SizedBox().h(25, context),
            ItemHomeWidget(
              title: 'Popular Menu',
              onPressed: () {},
              child: const FoodItemsList(),
            ),
            const SizedBox().h(75, context),
          ],
        ),
      ),
    );
  }
}

class FoodItemsList extends StatelessWidget {
  const FoodItemsList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemCount: 10,
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        physics: const NeverScrollableScrollPhysics(),
        separatorBuilder: (context, index) => const SizedBox().h(8, context),
        itemBuilder: (context, index) => Container(
              width: 323.w(context),
              height: 87.h(context),
              padding: const EdgeInsets.all(12),
              decoration: ShapeDecoration(
                color: Colors.white.withOpacity(0.1),
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                      width: 1,
                      color: const Color(0xFFF4F4F4).withOpacity(0.1)),
                  borderRadius: BorderRadius.circular(15),
                ),
                shadows: const [
                  BoxShadow(
                    color: Color(0x115A6CEA),
                    blurRadius: 50,
                    offset: Offset(12, 26),
                    spreadRadius: 0,
                  )
                ],
              ),
              child: Row(
                children: [
                  Image.asset(
                    AppImage.food,
                    width: 64.r(context),
                    height: 64.r(context),
                    fit: BoxFit.cover,
                  ),
                  const SizedBox().w(10, context),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Green Noddle',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15.sp(context),
                          fontFamily: 'BentonSans',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Text(
                        'Noodle Home',
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.3),
                          fontSize: 14.sp(context),
                          fontFamily: 'BentonSans Regular',
                          fontWeight: FontWeight.w400,
                        ),
                      )
                    ],
                  ),
                  const Spacer(),
                  Text(
                    '\$15',
                    style: TextStyle(
                      color: const Color(0xFFFEAD1D),
                      fontSize: 22.sp(context),
                      fontFamily: 'BentonSans',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox().w(10, context),
                ],
              ),
            ));
  }
}

class RestaurantListWidget extends StatelessWidget {
  const RestaurantListWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 10,
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      separatorBuilder: (context, index) => const SizedBox().w(10, context),
      itemBuilder: (context, index) {
        return Container(
          width: 147.w(context),
          height: 184.h(context),
          decoration: ShapeDecoration(
            color: const Color(0xFF252525),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            shadows: const [
              BoxShadow(
                color: Color(0x7F010107),
                blurRadius: 50,
                offset: Offset(0, 0),
                spreadRadius: 0,
              )
            ],
          ),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Image.asset(
              AppImage.restaurant,
              width: 90.r(context),
              height: 90.r(context),
              fit: BoxFit.contain,
            ),
            const SizedBox().h(10, context),
            Text(
              'Vegan Resto',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16.sp(context),
                fontFamily: 'BentonSans',
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox().h(4, context),
            Text(
              '12 Mins',
              style: TextStyle(
                color: Colors.white.withOpacity(0.5),
                fontSize: 12.sp(context),
                fontFamily: 'BentonSans',
                fontWeight: FontWeight.w400,
              ),
            )
          ]),
        );
      },
    );
  }
}

class ItemHomeWidget extends StatelessWidget {
  const ItemHomeWidget({
    super.key,
    required this.child,
    required this.title,
    this.onPressed,
  });
  final Widget child;
  final String title;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontSize: 15.sp(context),
                fontFamily: 'BentonSans',
                fontWeight: FontWeight.w400,
              ),
            ),
            const Spacer(),
            TextButton(
              onPressed: onPressed,
              child: Text(
                'View More',
                style: TextStyle(
                  color: const Color(0xFFFF8D4B),
                  fontSize: 12.sp(context),
                  fontFamily: 'BentonSans',
                  fontWeight: FontWeight.w400,
                ),
              ),
            )
          ],
        ),
        const SizedBox().h(12, context),
        child
      ],
    );
  }
}

class BannerWidget extends StatelessWidget {
  const BannerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 350.w(context),
      height: 150.h(context),
      child: Stack(
        children: [
          Image.asset(
            AppImage.banner,
            width: 350.w(context),
            height: 150.h(context),
            fit: BoxFit.fill,
          ),
          Positioned(
            top: 24.h(context),
            left: 180.w(context),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  width: 142,
                  child: Text(
                    'Special Deal For \nOctober',
                    style: TextStyle(
                      color: ColorResources.black,
                      fontSize: 17,
                      fontFamily: 'BentonSans',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                const SizedBox().h(10, context),
                CustomButtonGreen(
                  title: "Buy Now",
                  colorFlip: true,
                  fontSize: 12.sp(context),
                  width: 90,
                  height: 40,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
