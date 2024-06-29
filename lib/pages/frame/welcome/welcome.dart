import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_dbestech/pages/frame/welcome/notifiers/welcome_notifier.dart';
import 'package:riverpod_dbestech/widgets.dart';

import '../../../app_colors.dart';

class Welcome extends ConsumerStatefulWidget {
  const Welcome({super.key});

  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => const Welcome());
  }

  @override
  ConsumerState<Welcome> createState() => _WelcomePage();
}


class _WelcomePage extends ConsumerState<Welcome>{
  PageController pageController = PageController(initialPage: 0);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var state = ref.watch(welcomeProvider);

    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          body: Container(
            width: 375,
            margin: EdgeInsets.only(top: 34),
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                PageView(
                  scrollDirection: Axis.horizontal,
                  reverse: false,
                  onPageChanged: (index){
                    if (kDebugMode) {
                      print("_______$index");
                    }
                    ref.read(welcomeProvider.notifier).pageChanged(index);
                  },
                  controller: pageController,
                  pageSnapping: true,
                  physics: ClampingScrollPhysics(),
                  children: [
                    Column(
                      children: [
                        Container(
                          width: 345,
                          height: 345,
                          child: Image.asset("assets/reading.png", fit: BoxFit.fitWidth,),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 15),
                          child: const Text("First See Learning",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: AppColors.primaryText,
                              fontSize: 24,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                        Container(
                          width: 375,
                          margin: EdgeInsets.only(top: 15),
                          padding: EdgeInsets.only(top: 15, right: 30),
                          child: const Text(
                            "Forget about a for of paper all knowledge in one learning!",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: AppColors.primarySecondaryElementText,
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                        nextButton(pageController,1),
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          width: 345,
                          height: 345,
                          child: Image.asset("assets/man.png", fit: BoxFit.fitWidth,),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 15),
                          child: const Text("Connect with everyone",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: AppColors.primaryText,
                              fontSize: 24,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                        Container(
                          width: 375,
                          margin: EdgeInsets.only(top: 15),
                          padding: EdgeInsets.only(top: 15, right: 30),
                          child: const Text(
                            "Always keep in touch with your tutor & friend. Let's get connected",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: AppColors.primarySecondaryElementText,
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                        nextButton(pageController,2),
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          width: 345,
                          height: 345,
                          child: Image.asset("assets/boy.png", fit: BoxFit.fitWidth,),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 15),
                          child: const Text("Always Fascinated Learning",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: AppColors.primaryText,
                              fontSize: 24,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                        Container(
                          width: 375,
                          margin: EdgeInsets.only(top: 15),
                          padding: EdgeInsets.only(top: 15, right: 30),
                          child: const Text(
                            "Forget about a for of paper all knowledge in one learning!",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: AppColors.primarySecondaryElementText,
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),

                        nextButton(pageController,3),
                      ],
                    ),
                  ],
                ),
                Positioned(
                  child: DotsIndicator(
                    mainAxisAlignment: MainAxisAlignment.center,
                    reversed: false,
                    dotsCount: 3,
                    position: state.page.toDouble(),
                    decorator: DotsDecorator(
                      color: AppColors.primaryThirdElementText,
                      activeColor: AppColors.primaryText,
                      size: const Size.square(8.0),
                      activeSize: const Size(18.0, 18.0),
                      activeShape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),

                  ),
                ),
              ],
            ),

          ),
        ),
      ),

    );
  }

  
}
