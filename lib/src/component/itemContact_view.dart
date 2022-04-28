import 'package:app_tobe_sonet/src/component/iconAvatarOnline.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import '../assets/index.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class Item_Contact extends StatefulWidget {
  State<Item_Contact> createState() => _Item_Contact();
}

class _Item_Contact extends State<Item_Contact> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 60.h,
        width: 375.w,
        margin: const EdgeInsets.only(top: 15),
        padding: const EdgeInsets.only(left: 5, right: 15),
        child: Row(
          children: [
           IconAvatarOnline(),
            Text(
              'Alexander The Roman',
              style: TextStyle(
                  fontFamily: 'IBMPlex',
                  color: HexColor('#3A3C3D'),
                  fontStyle: FontStyle.normal,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500),
            )
          ],
        ));
  }
}
