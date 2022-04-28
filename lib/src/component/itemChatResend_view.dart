import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:focused_menu/focused_menu.dart';
import 'package:focused_menu/modals.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../base/TextStyle/TextStyle.dart';
import '../utils/style.dart';
class Item_ChatResend extends StatefulWidget {
  const Item_ChatResend({Key? key, required this.tilte}) : super(key: key);

  State<Item_ChatResend> createState() => _Item_ChatResend();
  final String tilte;
}

class _Item_ChatResend extends State<Item_ChatResend> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 375.w,
      alignment: Alignment.centerRight,
      margin: const EdgeInsets.only(top: 10),
      padding: const EdgeInsets.only(left: 40, right: 10),
      child: Container(
        margin: const EdgeInsets.only(left: 10),
        decoration: BoxDecoration(
          color: HexColor('#F1FAFB'),
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.blueGrey.withOpacity(0.05),
              spreadRadius: 2,
              blurRadius: 3,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: HexColor('#F1FAFB')
            ),
            padding: const EdgeInsets.only(
                top: 10, right: 5, left: 10, bottom: 5),
            child: textFieldRegular(
                '${widget.tilte}', 14.sp, colorBlackText,TextAlign.left)),
      ),
    );
  }
}
