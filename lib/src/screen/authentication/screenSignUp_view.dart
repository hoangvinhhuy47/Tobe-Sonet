import 'package:app_tobe_sonet/src/assets/index.dart';
import 'package:app_tobe_sonet/src/base/TextStyle/TextStyle.dart';
import 'package:app_tobe_sonet/src/controller/basecontroller.dart';
import 'package:app_tobe_sonet/src/controller/screenSignUp_controller.dart';
import 'package:app_tobe_sonet/src/screen/authentication/screenLogin_view.dart';
import 'package:app_tobe_sonet/src/utils/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../base/InputComponent/InputComponent.dart';
import 'package:transition/transition.dart';
class Screen_SignUp extends StatelessWidget  {
  @override
  void initState() {}
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: Size(375, 812),
        builder: () {
          ScreenUtil.setContext(context);
          return Material(
            child: Scaffold(
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
                      SizedBox(
                        height: 30.h,
                      ),
                      InputSignUp(context)
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }

  Widget HeaderImage(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: 120.h,
        ),
        Container(
          height: 130.h,
          width: 187.w,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(IMG_SIGNUP), fit: BoxFit.contain)),
        ),
        SizedBox(
          height: 50.h,
        ),
        textFieldBold("Sign Up", 24.sp, colorWhite),
        SizedBox(
          height: 5.h,
        ),
        textFieldRegular("All social media Apps are in one Platform", 14.sp,
            colorWhite, TextAlign.center)
      ],
    );
  }

  Widget InputSignUp(BuildContext context) {
    return Container(
      height: 431.h,
      width: 375.w,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25), topRight: Radius.circular(25))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 10.h,
          ),
          Container(
            child: InputComponent(
              isPassWord: false,
              lablel: '',
              require: false,
              isIcon: true,
              hintText: 'Phone Number',
            ),
          ),
          SizedBox(
            height: 2.h,
          ),
          Container(
              child: InputComponent(
            isPassWord: false,
            lablel: '',
            require: false,
            hintText: 'Phone verification code',
            isIcon: false,
          )),
          SizedBox(
            height: 2.h,
          ),
          Container(
              child: InputComponent(
            isPassWord: true,
            lablel: '',
            require: false,
            hintText: 'Password',
            isIcon: false,
          )),
          SizedBox(
            height: 5.h,
          ),
          Container(
              child: InputComponent(
            isPassWord: true,
            lablel: '',
            require: false,
            hintText: 'Password comfirm',
            isIcon: false,
          )),
          SizedBox(
            height: 15.h,
          ),
          GestureDetector(
            onTap: () {},
            child: Container(
                alignment: Alignment.center,
                height: 42.h,
                width: 274.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  gradient: LinearGradient(
                    colors: <Color>[
                      Color(0xFF53CEA0),
                      Color(0xFF53CEA0),
                      Color(0xFF53CEA0),
                    ],
                  ),
                ),
                child: textFieldBold('Sign Up', 16.sp, colorWhite)),
          ),
          SizedBox(
            height: 20.h,
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
              width: 375.w,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  textFieldRegular("Already have an account?", 16.sp,
                      colorBlackText, TextAlign.center),
                  textFieldRegular(
                      "LogIn", 16.sp, colorGreenText, TextAlign.center),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
