import 'package:flutter/material.dart';
import 'package:riverpod_dbestech/widgets/app_shadow.dart';
import 'package:riverpod_dbestech/widgets/text_widgets.dart';

Widget appOnboardingPage(PageController controller,{String imagePath = "assets/images/reading.png", String title = "", String subtitle = "",int index=0}){
  return Column(children: [
    Image.asset(imagePath,fit: BoxFit.fitWidth,),
    Container(margin:EdgeInsets.only(top:15,),child: text24Normal(text: title),),
    Container(margin:EdgeInsets.only(top:15),padding:EdgeInsets.only(left:30,right:30),child: text16Normal(text: subtitle),),
    nextButton(controller,index)
  ],);
}


Widget nextButton(PageController controller,int index) {
  return GestureDetector(
    onTap: () {
      if (index < 3) {
        controller.animateToPage(index,
            duration: const Duration(milliseconds: 300), curve: Curves.linear);
      }
    },
    child: Container(
      width: 325,
      height: 50,
      margin: EdgeInsets.only(top: 100, left: 25, right: 25),
      decoration: appBoxShadow(),
      child: Center(
          child: text16Normal(
              text: index < 3 ? "Next" : "Get started", color: Colors.white)),
    ),
  );
}
