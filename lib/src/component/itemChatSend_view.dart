import 'dart:ui';

import 'package:app_tobe_sonet/src/assets/index.dart';
import 'package:app_tobe_sonet/src/base/TextStyle/TextStyle.dart';
import 'package:app_tobe_sonet/src/utils/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:focused_menu/modals.dart';
import 'package:hexcolor/hexcolor.dart';

import '../base/ForcusMenu/ForcusMenuChat.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Item_ChatSend extends StatefulWidget {
  const Item_ChatSend({Key? key, required this.tilte}) : super(key: key);

  State<Item_ChatSend> createState() => _Item_ChatSend();
  final String tilte;
}

class _Item_ChatSend extends State<Item_ChatSend> {
  var src_img = '';
  bool checkSeen = false;
  bool icon = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 375.w,
      margin: const EdgeInsets.only(top: 10),
      padding: const EdgeInsets.only(
        left: 5,
        right: 40,
      ),
      child: FocusedMenuHolder(
        onPressedLove: (value) {
          setState(() {
            src_img = value;
          });
        },
        onPressedLike: (value) {
          setState(() {
            src_img = value;
          });
        },
        onPressedSad: (value) {
          setState(() {
            src_img = value;
          });
        },
        onPressedSmile: (value) {
          setState(() {
            src_img = value;
          });
        },
        onPressedWOW: (value) {
          setState(() {
            src_img = value;
          });
        },
        onPressedAngry: (value) {
          setState(() {
            src_img = value;
          });
        },
        onPressedReply: (value) {
          setState(() {
            src_img = value;
          });
        },
        onPressedForward: (value) {
          setState(() {
            src_img = value;
          });
        },
        onPressedCoppy: (value) {
          setState(() {
            src_img = value;
          });
        },
        onPressedDelete: (value) {
          setState(() {
            src_img = value;
          });
        },
        menuWidth: MediaQuery.of(context).size.width * 0.8,
        blurSize: 5.0,
        menuItemExtent: 45,
        menuBoxDecoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.all(Radius.circular(15.0))),
        duration: Duration(milliseconds: 400),
        animateMenuItems: true,
        blurBackgroundColor: Colors.black54,
        openWithTap: true, // Open Focused-Menu on Tap rather than Long Press
        menuOffset:
            10.0, // Offset value to show menuItem from the selected item
        bottomOffsetHeight:
            80.0, // Offset height to consider, for showing the menu item ( for example bottom navigation bar), so that the popup menu will be shown on top of selected item.
        menuItems: <FocusedMenuItem>[
          // Add Each FocusedMenuItem  for Menu Options
        ],
        onPressed: () {},
        child: GestureDetector(
          onTap: () {
            setState(() {
              checkSeen = !checkSeen;
            });
          },
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 40.h,
                width: 40.w,
                child: Stack(alignment: Alignment.center, children: [
                  CircleAvatar(
                    child: Image.asset(
                      IMG_Avatar,
                      fit: BoxFit.contain,
                      height: 35.h,
                      width: 35.w,
                    ),
                    radius: 50,
                    backgroundColor: HexColor('#FFFFFF'),
                  ),
                  Positioned(
                      top: 28.h,
                      left: 28.w,
                      child: Container(
                        height: 12.h,
                        width: 12.w,
                        decoration: BoxDecoration(
                          border:
                              Border.all(color: HexColor('#FFFFFF'), width: 2),
                          borderRadius: BorderRadius.circular(50),
                          gradient: LinearGradient(
                            colors: <Color>[
                              HexColor('#22F3AE'),
                              HexColor('#4EBE99'),
                            ],
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.blueGrey.withOpacity(0.05),
                              spreadRadius: 2,
                              blurRadius: 3,
                              offset:
                                  Offset(0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                      ))
                ]),
              ),
              Stack(
                children: [
                  Container(
                    child: Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(
                              left: 5, top: 5, bottom: 10, right: 10),
                          decoration: BoxDecoration(
                            color: colorGreenText,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.blueGrey.withOpacity(0.1),
                                spreadRadius: 2,
                                blurRadius: 3,
                                offset:
                                    Offset(0, 3), // changes position of shadow
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Container(
                                alignment: Alignment.centerLeft,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: colorGreenText,
                                  ),
                                  padding: const EdgeInsets.only(
                                      top: 5, right: 5, left: 5, bottom: 5),
                                  child: textFieldRegular(
                                      '${widget.tilte}', 14.sp, colorWhite,TextAlign.left)),
                              checkSeen
                                  ? TweenAnimationBuilder(
                                      builder: (context, dynamic value, child) {
                                        return Transform(
                                          transform:
                                              Matrix4.rotationX(1.5708 * value),
                                          alignment: Alignment.topCenter,
                                          child: child,
                                        );
                                      },
                                      tween: Tween(begin: 1.0, end: 0.0),
                                      duration: Duration(milliseconds: 500),
                                      child: Container(
                                        margin: const EdgeInsets.only(top: 10),
                                        child: Row(
                                          children: [
                                         textFieldRegular('11:00am, 2022/02/12', 12.sp, colorWhite,TextAlign.right),
                                            Image.asset(
                                              'lib/src/assets/images/mess_checkseen.png',
                                              height: 15,
                                              width: 15,
                                              color: colorWhite,
                                            )
                                          ],
                                        ),
                                      ))
                                  : Container()
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                      bottom: 0,
                      right: 0,
                      child: src_img != ''
                          ? Container(
                              height: 20,
                              width: 20,
                              child: CircleAvatar(
                                child: Image.asset(
                                  src_img,
                                  fit: BoxFit.contain,
                                  height: 20,
                                  width: 20,
                                ),
                                radius: 2,
                                backgroundColor: HexColor('#FFFFFF'),
                              ),
                            )
                          : Container())
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
