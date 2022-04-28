import 'package:app_tobe_sonet/src/assets/index.dart';
import 'package:app_tobe_sonet/src/base/TextStyle/TextStyle.dart';
import 'package:app_tobe_sonet/src/controller/splash_controller.dart';
import 'package:app_tobe_sonet/src/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
import '../authentication/screenLogin_view.dart';
import 'package:transition/transition.dart';
class WellComeScreen extends StatelessWidget {
  // final SplashController_GetX controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return  ScreenUtilInit(
        designSize: Size(375, 812),
        builder: () {
          ScreenUtil.setContext(context);
          return Material(
            child: Container(
              height: 812.h,
              width: 375.w,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  colors: <Color>[
                    HexColor('#007C91'),
                    HexColor("#00AA77"),
                  ],
                ),
              ),
              child: Column(
                children: [HeaderImage(context), Login(context)],
              ),
            ),
          );
        });
  }

  Widget HeaderImage(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 375.h,
          width: 375.w,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(ImageGR_Main), fit: BoxFit.contain)),
        ),
        SizedBox(
          height: 46.h,
        ),
        textFieldBold(
            "All social media Apps \n are in the Platform", 20.sp, colorWhite,)
      ],
    );
  }

  Widget Login(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 25.h,
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                Transition(
                    child: Screen_Login(),
                    transitionEffect: TransitionEffect.RIGHT_TO_LEFT,
                    curve: Curves.linear));
          },
          child: Container(
              height: 42.h,
              width: 274.h,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    spreadRadius: 2,
                    blurRadius: 3,
                    offset: Offset(0, 2), // changes position of shadow
                  ),
                ],
                borderRadius: BorderRadius.circular(15),
                gradient: LinearGradient(
                  colors: <Color>[
                    HexColor('#92AA00'),
                    HexColor("#F9A11B"),
                  ],
                ),
              ),
              child: textFieldBold('Login', 16.sp, colorWhite)),
        ),
        SizedBox(
          height: 20.h,
        ),
        GestureDetector(
          onTap: () {},
          child: Container(
              height: 42.h,
              width: 274.h,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    spreadRadius: 3,
                    blurRadius: 3,
                    offset: Offset(0, 4), // changes position of shadow
                  ),
                ],
                gradient: LinearGradient(
                  colors: <Color>[
                    HexColor("#007A7A"),
                    HexColor('#00AA77'),
                  ],
                ),
              ),
              child: textFieldBold("Sign Up with Gmail", 16.sp, colorWhite)),
        ),
        SizedBox(
          height: 43.h,
        ),
        textFieldRegular(
            'By process you agree to the Privacy Policy \nand terms & Conditions',
            14.sp,
            colorWhite,TextAlign.center)
      ],
    );
  }
}
