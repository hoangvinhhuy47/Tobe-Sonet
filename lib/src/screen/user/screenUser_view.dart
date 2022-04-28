import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import 'package:transition/transition.dart';
import '../../assets/index.dart';
import '../../base/TextStyle/TextStyle.dart';
import '../../utils/style.dart';
import 'Setting/Screen_Setting.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class ScreenUser extends StatelessWidget {
  ScrollController controller;

  ScreenUser({Key? key, required this.controller}) : super(key: key);
  @override
  Widget build(BuildContext context) {

    return ScreenUtilInit(
        designSize: Size(375, 812),
        builder: () {
          ScreenUtil.setContext(context);
          return Scaffold(
            resizeToAvoidBottomInset: true,
            body: Container(
              height: 812.h,
              width: 375.w,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.centerRight,
                  end: Alignment.centerLeft,
                  colors: <Color>[
                    LinerGreen2,
                    LinerGreen1,
                  ],
                ),
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 53.h,
                    ),
                    Container(
                      width: 300.w,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: ImageIcon(
                                AssetImage(IMG_LOGO),
                                color: colorGreenText,
                                size: 20.w,
                              )),
                          textFieldBold('My account', 16.sp, colorWhite),
                          SizedBox(
                            width: 20.w,
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 35.h,
                    ),
                    Container(
                      height: 702.5.h,
                      width: 375.w,
                      decoration: BoxDecoration(
                          color: colorWhite,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(25),
                              topRight: Radius.circular(25))),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            SizedBox(
                              height: 5.h,
                            ),
                            ViewCenter(context),
                            // SizedBox(height: 12.h,),
                            // ViewButton(context)
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }

  Widget ViewHeader(BuildContext context, Size size) {
    return Container(
      width: size.width,
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 45,
            width: 50,
            margin: const EdgeInsets.only(left: 5),
            child: CircleAvatar(
              child: Image.asset(
                IMG_LOGO,
                fit: BoxFit.contain,
                height: 22,
                width: 22,
              ),
              radius: 50,
              backgroundColor: HexColor('#FFFFFF'),
            ),
          ),
          Text(
            "My account",
            style: TextStyle(
                color: HexColor('#ACC1C7'),
                fontFamily: 'IBMPlex',
                fontWeight: FontWeight.w600,
                fontSize: 18),
          ),
          Container(
            height: 45,
            width: 50,
            margin: const EdgeInsets.only(left: 5),
            child: CircleAvatar(
              radius: 50,
              backgroundColor: HexColor('#FFFFFF'),
            ),
          ),
        ],
      ),
    );
  }

  Widget ViewCenter(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 5),
          height: 130.h,
          width: 375.w,
          alignment: Alignment.center,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 85.h,
                width: 85.w,
                child: CircleAvatar(
                  child: Image.asset(
                    IMG_Account,
                    fit: BoxFit.contain,
                    height: 60.h,
                    width: 60.w,
                  ),
                  radius: 50,
                  backgroundColor: HexColor('#EAEEEF'),
                ),
              ),
              Container(
                width: 150.w,
                height: 40.h,
                alignment: Alignment.center,
                child: Text("Vĩnh Huy 47",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: HexColor('#757575'),
                      fontSize: 19,
                      fontStyle: FontStyle.normal,
                      fontFamily: 'IBMPlex',
                    )),
              )
            ],
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                Transition(
                    child: ScreenSetting(controller: controller,),
                    transitionEffect: TransitionEffect.RIGHT_TO_LEFT,
                    curve: Curves.linear));
          },
          child: Container(
            width: 300.w,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Settings',
                  style: TextStyle(
                    color: HexColor('#757575'),
                    fontSize: 14.sp,
                    fontStyle: FontStyle.normal,
                    fontFamily: 'IBMPlex',
                  ),
                ),
                Container(
                  height: 15.h,
                  width: 22.w,
                  child: Image.asset(
                    IMG_Left_Account,
                    fit: BoxFit.contain,
                  ),
                )
              ],
            ),
          ),
        ),
        SizedBox(height: 30.h,),
        Container(
          width: 300.w,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Add contacts',
                style: TextStyle(
                  color: HexColor('#757575'),
                  fontSize: 14.sp,
                  fontStyle: FontStyle.normal,
                  fontFamily: 'IBMPlex',
                ),
              ),
              Container(
                height: 15.h,
                width: 22.w,
                child: Image.asset(
                  IMG_Left_Account,
                  fit: BoxFit.contain,
                ),
              )
            ],
          ),
        ),
        SizedBox(height: 20.h,),
        Container(
          width: 300.w,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Invite friends',
                style: TextStyle(
                  color: HexColor('#757575'),
                  fontSize: 14.sp,
                  fontStyle: FontStyle.normal,
                  fontFamily: 'IBMPlex',
                ),
              ),
              Container(
                height: 15.h,
                width: 22.w,
                child: Image.asset(
                  IMG_Left_Account,
                  fit: BoxFit.contain,
                ),
              )
            ],
          ),
        ),
        SizedBox(height: 20.h,),
        Container(
          width: 300.w,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Security',
                style: TextStyle(
                  color: HexColor('#757575'),
                  fontSize: 14.sp,
                  fontStyle: FontStyle.normal,
                  fontFamily: 'IBMPlex',
                ),
              ),
              Container(
                height: 15.h,
                width: 22.w,
                child: Image.asset(
                  IMG_Left_Account,
                  fit: BoxFit.contain,
                ),
              )
            ],
          ),
        ),
        SizedBox(height: 20.h,),
        Container(
          height: 45.h,
          alignment: Alignment.center,
          width: 343.w,
          padding: const EdgeInsets.only(left: 30, right: 30),
          color: HexColor('#FAFAFA'),
          child: Text(
            'Join the Swaptobe Community',
            style: TextStyle(
              color: HexColor('#757575'),
              fontSize: 14.sp,
              fontStyle: FontStyle.normal,
              fontFamily: 'IBMPlex',
            ),
          ),
        ),
        SizedBox(height: 12.h,),
        Container(
          height: 40.h,
          alignment: Alignment.centerLeft,
          width: 300.w,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 40.h,
                width: 40.w,
                child: CircleAvatar(
                  child: Image.asset(
                    IMG_Fly_Account,
                    fit: BoxFit.contain,
                    height: 20.h,
                    width: 20.w,
                  ),
                  radius: 1,
                  backgroundColor: HexColor('#9E9D9E'),
                ),
              ),
              Container(
                height: 40.h,
                width: 40.w,
                child: CircleAvatar(
                  child: Image.asset(
                    IMG_TWICHTER_Account,
                    fit: BoxFit.contain,
                    height: 20.h,
                    width: 20.w,
                  ),
                  radius: 1,
                  backgroundColor: HexColor('#9E9D9E'),
                ),
              ),
              Container(
                height: 40.h,
                width: 40.w,
                child: CircleAvatar(
                  child: Image.asset(
                    IMG_REDDIT_Account,
                    fit: BoxFit.contain,
                    height: 20.h,
                    width: 20.w,
                  ),
                  radius: 1,
                  backgroundColor: HexColor('#9E9D9E'),
                ),
              ),
              Container(
                height: 40.h,
                width: 40.w,
                child: CircleAvatar(
                  child: Image.asset(
                    IMG_FaceBook_Account,
                    fit: BoxFit.contain,
                    height: 20.h,
                    width: 20.w,
                  ),
                  radius: 1,
                  backgroundColor: HexColor('#9E9D9E'),
                ),
              ),
              Container(
                height: 40.h,
                width: 40.w,
                child: CircleAvatar(
                  child: Image.asset(
                    IMG_InstaGram_Account,
                    fit: BoxFit.contain,
                    height: 20.h,
                    width: 20.w,
                  ),
                  radius: 1,
                  backgroundColor: HexColor('#9E9D9E'),
                ),
              ),
              Container(
                height: 40.h,
                width: 40.w,
                child: CircleAvatar(
                  child: Image.asset(
                    IMG_Youtube_Account,
                    fit: BoxFit.contain,
                    height: 20.h,
                    width: 20.w,
                  ),
                  radius: 1,
                  backgroundColor: HexColor('#9E9D9E'),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 30.h,),
        Container(
          width: 300.w,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Help Center',
                style: TextStyle(
                  color: HexColor('#757575'),
                  fontSize: 14.sp,
                  fontStyle: FontStyle.normal,
                  fontFamily: 'IBMPlex',
                ),
              ),
              Container(
                height: 15.h,
                width: 22.w,
                child: Image.asset(
                  IMG_Left_Account,
                  fit: BoxFit.contain,
                ),
              )
            ],
          ),
        ),
        SizedBox(height: 30.h,),
        Container(
          width: 300.w,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'About Us',
                style: TextStyle(
                  color: HexColor('#757575'),
                  fontSize: 14.sp,
                  fontStyle: FontStyle.normal,
                  fontFamily: 'IBMPlex',
                ),
              ),
              Container(
                height: 15.h,
                width: 22.w,
                child: Image.asset(
                  IMG_Left_Account,
                  fit: BoxFit.contain,
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
