import 'package:flutter/material.dart';
import 'package:foodease/core/helper/responsive/widgets.dart';
import 'package:foodease/core/utill/color_resources.dart';
import 'package:foodease/core/utill/svg.dart';
import 'package:foodease/core/widgets/custom_widgets/svg_pic.dart';
import 'package:foodease/features/auth/view/method_resset_password.dart';
import 'package:foodease/features/auth/view/set_location.dart';
import 'package:foodease/features/auth/view/upload_photo.dart';
import 'package:foodease/features/home/home.dart';
import 'package:provider/provider.dart';
import 'package:foodease/core/helper/responsive/num.dart';

class MainPageProvider extends ChangeNotifier {
  final PageController _pageController = PageController(initialPage: 2);
  int maxCount = 4;
  int _currentIndex = 0;

  PageController get pageController => _pageController;
  int get currentIndex => _currentIndex;

  final List<Page> bottomBarPages = [
    Page(title: "Home", svg: AppSvg.back, child: const Home()),
    Page(title: "title", svg: AppSvg.back, child: const SetLocation()),
    Page(title: "title", svg: AppSvg.back, child: const MethodRessetPassword()),
    Page(title: "title", svg: AppSvg.back, child: const UploadPhoto()),
  ];

  void changeCurrentIndexOfPage(int nextIndex) {
    _changeCurrent(nextIndex);
  }

  void _changeCurrent(int nextIndex) {
    _currentIndex = nextIndex;
    _pageController.animateToPage(
      nextIndex,
      duration: const Duration(milliseconds: 300),
      curve: Curves.bounceIn,
    );
    notifyListeners();
  }

  void init() {}

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<MainPageProvider>(context, listen: false);
    final providerListen = Provider.of<MainPageProvider>(context, listen: true);
    provider.init();

    return Scaffold(
      body: PageView(
        controller: provider.pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: List.generate(
          provider.bottomBarPages.length,
          (index) => providerListen.bottomBarPages[index].child,
        ),
      ),
      extendBody: true,
      bottomNavigationBar: (provider.bottomBarPages.length <= provider.maxCount)
          ? Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                  width: 355.w(context),
                  height: 74.h(context),
                  padding: EdgeInsets.symmetric(
                      horizontal: 20.w(context), vertical: 15.h(context)),
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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: List.generate(
                      provider.bottomBarPages.length,
                      (index) => providerListen.currentIndex == index
                          ? Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20.w(context),
                                  vertical: 12.h(context)),
                              decoration: ShapeDecoration(
                                gradient: LinearGradient(
                                  begin: const Alignment(0.99, -0.15),
                                  end: const Alignment(-0.99, 0.15),
                                  colors: [
                                    const Color(0xFF53E78B).withOpacity(0.1),
                                    const Color(0xFF14BE77).withOpacity(0.1)
                                  ],
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  SvgPictureCustom(
                                    provider.bottomBarPages[index].svg,
                                    color: ColorResources.green,
                                  ),
                                  const SizedBox().w(10, context),
                                  Text(
                                    provider.bottomBarPages[index].title,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12.sp(context),
                                      fontWeight: FontWeight.w400,
                                    ),
                                  )
                                ],
                              ),
                            )
                          : IconButton(
                              onPressed: () =>
                                  provider.changeCurrentIndexOfPage(index),
                              icon: SvgPictureCustom(
                                provider.bottomBarPages[index].svg,
                                color: ColorResources.green,
                              )),
                    ),
                  )),
            )
          : null,
    );
  }
}

class Page {
  final String title;
  final String svg;
  final Widget child;
  Page({
    required this.title,
    required this.svg,
    required this.child,
  });
}
