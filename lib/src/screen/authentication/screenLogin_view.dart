import 'dart:html';

import 'package:app_tobe_sonet/src/base/InputComponent/InputComponent.dart';
import 'package:app_tobe_sonet/src/base/TextStyle/TextStyle.dart';
import 'package:app_tobe_sonet/src/controller/basecontroller.dart';
import 'package:app_tobe_sonet/src/screen/main/index.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../assets/index.dart';
import '../../utils/style.dart';
import 'screenSignUp_view.dart';
import '../../controller/screenLogin_controller.dart';
import 'package:transition/transition.dart';
class Screen_Login extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: Size(375, 812),
        builder: () {
          ScreenUtil.setContext(context);
          return  Scaffold(
              resizeToAvoidBottomInset: true,
              body: Container(
                height: 812.h,
                width: 375.w,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    colors: <Color>[
                      HexColor('#00AA77'),
                      HexColor("#007C91"),
                    ],
                  ),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      HeaderImage(context),
                      InputLogin(context),
                    ],
                  ),
                ),
              ),
          );
        });
  }

  Widget HeaderImage(BuildContext context) {
    return Container(
      height: 449.h,
      width: 375.w,
      alignment: Alignment.center,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 147.h,
          ),
          Container(
            height: 130.h,
            width: 187.w,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                image: DecorationImage(
              image: AssetImage(
                ImageHeader_Login,
              ),
            )),
          ),
          SizedBox(
            height: 70.h,
          ),
          textFieldBold('Login to Tobesonet', 24.sp, colorWhite),
          SizedBox(
            height: 5.h,
          ),
          textFieldRegular(
              "All social media Apps are in one Platform", 14.sp, colorWhite,TextAlign.center)
        ],
      ),
    );
  }
  Widget InputLogin(BuildContext context) {
    return Container(
      height: 363.h,
      width: 375.w,
      alignment: Alignment.topCenter,
      decoration: BoxDecoration(
          color: colorWhite,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25), topRight: Radius.circular(25))),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 40.h,
            ),
            Container(
              // height: 50.h,
              width: 280.w,
              child: InputComponent(isPassWord: false,lablel: '',require: false,isIcon: true,hintText: 'Phone Number',),
            ),
            SizedBox(
              height: 5.h,
            ),
            Container(
                width: 280.w,
                child:InputComponent(isPassWord: true,lablel: '',require: false, hintText: 'Password',isIcon: false,)),
            SizedBox(
              height: 16.h,
            ),
            Container(
                padding: const EdgeInsets.only(right: 25),
                width: 375.w,
                alignment: Alignment.centerRight,
                child: textFieldRegular(
                    'Forgot password?', 14.sp, colorGreenText,TextAlign.center)),
            SizedBox(
              height: 15.h,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    Transition(
                        child: ScreenMain(),
                        transitionEffect: TransitionEffect.RIGHT_TO_LEFT,
                        curve: Curves.linear));
              },
              child: Container(
                  height: 42.h,
                  width: 274.w,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: HexColor('#4EBE99')),
                  child: textFieldBold('Login', 16.sp, colorWhite)),
            ),
            SizedBox(
              height: 20.h,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    Transition(
                        child: Screen_SignUp(),
                        transitionEffect: TransitionEffect.RIGHT_TO_LEFT,
                        curve: Curves.linear));
              },
              child: Container(
                width: 375.w,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    textFieldRegular(
                        "Don't have an acount?", 16.sp, colorBlackText,TextAlign.center),
                    textFieldRegular("Sign Up", 16.sp, colorGreenText,TextAlign.center)
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
