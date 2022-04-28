import 'package:app_tobe_sonet/src/base/TextStyle/TextStyle.dart';
import 'package:app_tobe_sonet/src/utils/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:transition/transition.dart';

import '../assets/index.dart';
import '../screen/chat/screenChat_view.dart';
import 'iconAvatarOnline.dart';
// import 'package:get/get.dart';
class Item_ChatOnline extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            Transition(
                child: ScreenChat(),
                transitionEffect: TransitionEffect.RIGHT_TO_LEFT,
                curve: Curves.linear));
      },
      child: Container(
        child: Container(
            height: 80.h,
            width: 341.w,
            margin: const EdgeInsets.only(top: 1),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border(bottom: BorderSide(color: colorGrey,width: 1))
          ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconAvatarOnline(),
                TitleMess(context),
                textFieldRegular('11:00am', 12.sp, colorGrey,TextAlign.center)
              ],
            )),
      ),
    );
  }

  Widget TitleMess(BuildContext context) {
    return Container(
      height: 70.h,
      width: 204.w,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          textFieldBold('Rose Tran', 16.sp, colorBlackText),
          textFieldRegular(
              'David Pham: I play badminton ...', 13, colorBlackText,TextAlign.left),
        ],
      ),
    );
  }
}
