import 'package:app_tobe_sonet/src/utils/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import '../assets/index.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class IconAvatarOffline extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55.h,
      width: 55.w,
      margin: const EdgeInsets.only(left: 5),
      child: Stack(alignment: Alignment.center, children: [
        Container(
          height: 48.h,
          width: 48.w,
          child: CircleAvatar(
            child: Image.asset(
              IMG_Avatar,
              fit: BoxFit.contain,
              height: 40.h,
              width: 40.w,
            ),
            radius: 2,
            backgroundColor: colorGrey,
          ),
        ),
        Positioned(
            top: 40.h,
            left: 38.w,
            child: Container(
              height: 15.h,
              width: 15.w,
              decoration: BoxDecoration(
                border: Border.all(color: HexColor('#FFFFFF'), width: 2),
                borderRadius: BorderRadius.circular(50),
                color: colorGrey,
                boxShadow: [
                  BoxShadow(
                    color: Colors.white.withOpacity(0.1),
                    spreadRadius: 2,
                    blurRadius: 3,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
            ))
      ]),
    );
  }
}
