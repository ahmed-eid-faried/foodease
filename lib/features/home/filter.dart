import 'package:flutter/material.dart';
import 'package:foodease/core/helper/responsive/num.dart';
import 'package:foodease/core/helper/responsive/widgets.dart';
import 'package:foodease/core/theme/controllers/theme_controller.dart';
import 'package:foodease/core/utill/svg.dart';
import 'package:foodease/core/widgets/custom_widgets/svg_pic.dart';
import 'package:foodease/core/widgets/custom_widgets/text_form_field_custom.dart';
import 'package:foodease/features/auth/view/background.dart';
import 'package:foodease/features/home/home.dart';
import 'package:foodease/features/onboarding/onboarding.dart';
import 'package:provider/provider.dart';

class Filter extends StatelessWidget {
  const Filter({super.key});
  @override
  Widget build(BuildContext context) {
    List<String> types = ["Restaurant", "Menu"];
    List<String> locations = ['1 Km', '>10 Km', '<10 Km'];
    List<String> foods = [
      'Cake',
      'Soup',
      'Main Course',
      'Appetizer',
      'Dessert',
    ];

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
          FilterWidget(
            title: "Type",
            items: types,
          ),
          const SizedBox().h(20, context),
          FilterWidget(
            title: "Location",
            items: locations,
            // reslut: true,
          ),
          const SizedBox().h(20, context),
          FilterWidget(
            title: "Food",
            items: foods,
          ),
          const Spacer(),
          CustomButtonGreen(
            title: 'Search',
            width: 375.w(context),
          ),
          const SizedBox().h(60, context),
        ],
      ),
    ));
  }
}

class FilterWidget extends StatelessWidget {
  const FilterWidget({
    super.key,
    required this.title,
    required this.items,
    this.reslut = false,
    this.onTap,
  });
  final String title;
  final bool reslut;
  final List<String> items;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (!reslut)
          Text(
            title.toUpperCase(),
            style: TextStyle(
              color: Colors.white,
              fontSize: 15.sp(context),
              fontWeight: FontWeight.w400,
            ),
          ),
        if (!reslut) const SizedBox().h(20, context),
        Wrap(
          spacing: 10,
          runSpacing: 10,
          children: List.generate(
              items.length,
              (index) => ItemOfFilterWdget(
                  onTap: onTap, text: items[index], reslut: reslut)),
        ),
      ],
    );
  }
}

class ItemOfFilterWdget extends StatefulWidget {
  const ItemOfFilterWdget({
    super.key,
    required this.onTap,
    required this.reslut,
    required this.text,
  });

  final Function()? onTap;
  final String text;
  final bool reslut;

  @override
  State<ItemOfFilterWdget> createState() => _ItemOfFilterWdgetState();
}

class _ItemOfFilterWdgetState extends State<ItemOfFilterWdget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        widget.onTap;
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 16),
        decoration: ShapeDecoration(
          color: Colors.white.withOpacity(0.1),
          shape: RoundedRectangleBorder(
            side: BorderSide(
                width: 1, color: const Color(0xFFF4F4F4).withOpacity(0.1)),
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
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              widget.text,
              style: TextStyle(
                color: Colors.white.withOpacity(0.5),
                fontSize: 12.sp(context),
                fontWeight: FontWeight.w400,
              ),
            ),
            if (widget.reslut) const SizedBox().w(8, context),
            if (widget.reslut)
              SvgPictureCustom(
                AppSvg.close,
                width: 16.r(context),
                height: 16.r(context),
              )
          ],
        ),
      ),
    );
  }
}
