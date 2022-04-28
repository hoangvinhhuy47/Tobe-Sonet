import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:transition/transition.dart';
import '../../../assets/index.dart';
import '../../../base/TextStyle/TextStyle.dart';
import '../../../utils/style.dart';
import 'Screen_EditAccount.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ScreenSetting extends StatelessWidget {
  ScrollController controller;

  ScreenSetting({Key? key, required this.controller}) : super(key: key);
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
                      width: 300,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: ImageIcon(
                                AssetImage(IMG_Back),
                                color: colorWhite,
                                size: 20.w,
                              )),
                          textFieldBold('Settings', 16.sp, colorWhite),
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
                        controller: controller,
                        child: Column(
                          children: [
                            SizedBox(
                              height: 5.h,
                            ),
                            ViewCenter(context)
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
  Widget ViewCenter(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                Transition(
                    child: Screen_EditAccount(controller: controller,),
                    transitionEffect: TransitionEffect.RIGHT_TO_LEFT,
                    curve: Curves.linear));
          },
          child: Container(
            height: 65.h,
            width: 300.w,
            padding: const EdgeInsets.only(left: 10),
            decoration: BoxDecoration(
                color: HexColor('#EAEEEF'),
                borderRadius: BorderRadius.circular(30)),
            child: Row(
              children: [
                Container(
                  height: 50.h,
                  width: 50.w,
                  margin: const EdgeInsets.only(left: 5),
                  child: CircleAvatar(
                    child: Image.asset(
                      IMG_Account,
                      fit: BoxFit.contain,
                      height: 40.h,
                      width: 35.w,
                    ),
                    radius: 2,
                    backgroundColor: HexColor('#EAEEEF'),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 5),
                  height: 45.h,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Bryan Pham',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: HexColor('#757575'),
                          fontSize: 15.sp,
                          fontStyle: FontStyle.normal,
                          fontFamily: 'IBMPlex',
                        ),
                      ),
                      Text(
                        'Edit Account',
                        style: TextStyle(
                          fontWeight: FontWeight.w300,
                          color: HexColor('#1F34EB'),
                          fontSize: 12,
                          decoration: TextDecoration.underline,
                          fontStyle: FontStyle.normal,
                          fontFamily: 'IBMPlex',
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        Container(
          height: 50.h,
          width: 343.w,
          margin: const EdgeInsets.only(top: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  Container(
                    height: 35.h,
                    width: 35.w,
                    margin: const EdgeInsets.only(right: 5),
                    child: CircleAvatar(
                      child: Image.asset(
                        IMG_Setting_Key,
                        fit: BoxFit.contain,
                        height: 20.h,
                        width: 20.w,
                      ),
                      radius: 2,
                      backgroundColor: HexColor('#C4C4C4'),
                    ),
                  ),
                  Text(
                    'Change password',
                    style: TextStyle(
                      color: HexColor('#757575'),
                      fontSize: 16.sp,
                      fontStyle: FontStyle.normal,
                      fontFamily: 'IBMPlex',
                    ),
                  ),
                ],
              ),
              Container(
                height: 15.h,
                width: 30.w,
                child: Image.asset(
                  IMG_Left_Account,
                  fit: BoxFit.contain,
                ),
              )
            ],
          ),
        ),
        Container(
          height: 50.h,
          width: 343.w,
          margin: const EdgeInsets.only(top: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  Container(
                    height: 35.h,
                    width: 35.w,
                    margin: const EdgeInsets.only(right: 5),
                    child: CircleAvatar(
                      child: Image.asset(
                        IMG_Setting_Notification,
                        fit: BoxFit.contain,
                        height: 20.h,
                        width: 20.w,
                      ),
                      radius: 2,
                      backgroundColor: HexColor('#C4C4C4'),
                    ),
                  ),
                  Text(
                    'Notifications and Sounds',
                    style: TextStyle(
                      color: HexColor('#757575'),
                      fontSize: 16.sp,
                      fontStyle: FontStyle.normal,
                      fontFamily: 'IBMPlex',
                    ),
                  ),
                ],
              ),
              Container(
                height: 15.h,
                width: 30.w,
                child: Image.asset(
                  IMG_Left_Account,
                  fit: BoxFit.contain,
                ),
              )
            ],
          ),
        ),
        Container(
          height: 50.h,
          width: 343.w,
          margin: const EdgeInsets.only(top: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  Container(
                    height: 35.h,
                    width: 35.w,
                    margin: const EdgeInsets.only(right: 5),
                    child: CircleAvatar(
                      child: Image.asset(
                        IMG_Setting_Languages,
                        fit: BoxFit.contain,
                        height: 20.h,
                        width: 20.w,
                      ),
                      radius: 2,
                      backgroundColor: HexColor('#C4C4C4'),
                    ),
                  ),
                  Text(
                    'Language',
                    style: TextStyle(
                      color: HexColor('#757575'),
                      fontSize: 16.sp,
                      fontStyle: FontStyle.normal,
                      fontFamily: 'IBMPlex',
                    ),
                  ),
                ],
              ),
              Container(
                height: 15.h,
                width: 30.w,
                child: Image.asset(
                  IMG_Left_Account,
                  fit: BoxFit.contain,
                ),
              )
            ],
          ),
        ),
        Container(
          height: 50.h,
          width: 343.w,
          margin: const EdgeInsets.only(top: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  Container(
                    height: 35.h,
                    width: 35.w,
                    margin: const EdgeInsets.only(right: 5),
                    child: CircleAvatar(
                      child: Image.asset(
                        IMG_Setting_Security,
                        fit: BoxFit.contain,
                        height: 20.h,
                        width: 20.w,
                      ),
                      radius: 2,
                      backgroundColor: HexColor('#C4C4C4'),
                    ),
                  ),
                  Text(
                    'Privaty and Security',
                    style: TextStyle(
                      color: HexColor('#757575'),
                      fontSize: 16.sp,
                      fontStyle: FontStyle.normal,
                      fontFamily: 'IBMPlex',
                    ),
                  ),
                ],
              ),
              Container(
                height: 15.h,
                width: 30.w,
                child: Image.asset(
                  IMG_Left_Account,
                  fit: BoxFit.contain,
                ),
              )
            ],
          ),
        ),
        Container(
          height: 50.h,
          width: 343.w,
          margin: const EdgeInsets.only(top: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  Container(
                    height: 35.h,
                    width: 35.w,
                    margin: const EdgeInsets.only(right: 5),
                    child: CircleAvatar(
                      child: Image.asset(
                        IMG_Setting_Block,
                        fit: BoxFit.contain,
                        height: 20.h,
                        width: 20.w,
                      ),
                      radius: 2,
                      backgroundColor: HexColor('#C4C4C4'),
                    ),
                  ),
                  Text(
                    'Blocker User',
                    style: TextStyle(
                      color: HexColor('#757575'),
                      fontSize: 16.sp,
                      fontStyle: FontStyle.normal,
                      fontFamily: 'IBMPlex',
                    ),
                  ),
                ],
              ),
              Container(
                height: 15.h,
                width: 30.w,
                child: Image.asset(
                  IMG_Left_Account,
                  fit: BoxFit.contain,
                ),
              )
            ],
          ),
        ),
        Container(
          height: 50.h,
          width: 343.w,
          margin: const EdgeInsets.only(top: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  Container(
                    height: 35.h,
                    width: 35.w,
                    margin: const EdgeInsets.only(right: 5),
                    child: CircleAvatar(
                      child: Image.asset(
                        IMG_Setting_Chatting,
                        fit: BoxFit.contain,
                        height: 20.h,
                        width: 20.w,
                      ),
                      radius: 2,
                      backgroundColor: HexColor('#C4C4C4'),
                    ),
                  ),
                  Text(
                    'Chating Settings',
                    style: TextStyle(
                      color: HexColor('#757575'),
                      fontSize: 16.sp,
                      fontStyle: FontStyle.normal,
                      fontFamily: 'IBMPlex',
                    ),
                  ),
                ],
              ),
              Container(
                height: 15.h,
                width: 30.w,
                child: Image.asset(
                  IMG_Left_Account,
                  fit: BoxFit.contain,
                ),
              )
            ],
          ),
        ),
        Container(
          height: 50.h,
          width: 343.w,
          margin: const EdgeInsets.only(top: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  Container(
                    height: 35.h,
                    width: 35.w,
                    margin: const EdgeInsets.only(right: 5),
                    child: CircleAvatar(
                      child: Image.asset(
                        IMG_Setting_Logout,
                        fit: BoxFit.contain,
                        height: 20.h,
                        width: 20.w,
                      ),
                      radius: 2,
                      backgroundColor: HexColor('#C4C4C4'),
                    ),
                  ),
                  Text(
                    'Log Out',
                    style: TextStyle(
                      color: HexColor('#757575'),
                      fontSize: 16.sp,
                      fontStyle: FontStyle.normal,
                      fontFamily: 'IBMPlex',
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}


