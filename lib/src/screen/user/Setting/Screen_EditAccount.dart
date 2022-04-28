import 'package:app_tobe_sonet/src/Utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../assets/index.dart';
import '../../../base/TextStyle/TextStyle.dart';
import '../../../utils/style.dart';

class Screen_EditAccount extends StatefulWidget {
  State<Screen_EditAccount> createState() => _Screen_EditAccount();
  ScrollController controller;

  Screen_EditAccount({Key? key, required this.controller}) : super(key: key);
}

class _Screen_EditAccount extends State<Screen_EditAccount> {
  bool _character = true;
  bool _character1 = false;
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
                        textFieldBold('Edit Account', 16.sp, colorWhite),
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
                      controller: widget.controller,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 5.h,
                          ),
                          ViewCenter(context),
                          SizedBox(height: 80.h,)
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }
  Widget ViewCenter(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 5, bottom: 10),
          height: 90.h,
          width: 343.w,
          alignment: Alignment.center,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 85.h,
                width: 85.w,
                child: Stack(
                  children: [
                    CircleAvatar(
                      child: Image.asset(
                        IMG_Account,
                        fit: BoxFit.contain,
                        height: 60.h,
                        width: 60.w,
                      ),
                      radius: 50,
                      backgroundColor: HexColor('#EAEEEF'),
                    ),
                    Positioned(
                      right: 0,
                      bottom: 0,
                      child: Container(
                        height: 25.h,
                        width: 25.w,
                        child: CircleAvatar(
                          child: Image.asset(
                            IC_Camera_Home,
                            fit: BoxFit.contain,
                            height: 15.h,
                            width: 15.w,
                            color: HexColor('#FFFFFF'),
                          ),
                          radius: 2,
                          backgroundColor: HexColor('#C4C4C4'),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        Text(
          'Your name',
          style: TextStyle(
              color: HexColor('#757575'),
              fontFamily: 'IBMPlex',
              fontWeight: FontWeight.w400,
              fontSize: 15.sp),
        ),
        Container(
          height: 60.h,
          width: 343.w,
          margin: const EdgeInsets.only(top:5,  bottom: 10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  spreadRadius: 1,
                  blurRadius: 1,
                  offset: Offset(0, 1), // changes position of shadow
                ),
              ],
              color: HexColor('#F9FAFB')),
          child: TextFormField(
            textAlign: TextAlign.left,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.only(left: 10),
                hintText: 'Bryan Pham',
                border: InputBorder.none,
                hintStyle: TextStyle(
                  color: HexColor('#757575'),
                  fontFamily: 'IBMPlex',
                  fontWeight: FontWeight.w600,
                  fontSize: 15.sp,
                )),
          ),
        ),
        Text(
          'Gender',
          style: TextStyle(
              color: HexColor('#757575'),
              fontFamily: 'IBMPlex',
              fontWeight: FontWeight.w400,
            fontSize: 15.sp,),
        ),
        Container(
          height: 60.h,
          width: 343.w,
          margin: const EdgeInsets.only(top: 5, bottom: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                  height: 60.h,
                  width: 140.w,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        spreadRadius: 1,
                        blurRadius: 1,
                        offset:
                            Offset(0, 1), // changes position of shadow
                      ),
                    ],
                    color: HexColor('#F9FAFB'),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ListTile(
                    onTap: () {
                      setState(() {
                        _character = true;
                        _character1 = false;
                      });
                    },
                    title: const Text(
                      'Male',
                      style: TextStyle(
                          fontFamily: 'IBMPlex',
                          fontWeight: FontWeight.w500,
                          fontSize: 10),
                    ),
                    leading: Container(
                      child: Radio(
                        value: false,
                        activeColor: HexColor('#007C91'),
                        groupValue: _character1,
                        onChanged: (value) {},
                      ),
                    ),
                  )),
              Container(
                  height: 60.h,
                  width: 140.w,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        spreadRadius: 1,
                        blurRadius: 1,
                        offset:
                            Offset(0, 1), // changes position of shadow
                      ),
                    ],
                    color: HexColor('#F9FAFB'),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ListTile(
                    onTap: () {
                      setState(() {
                        _character = false;
                        _character1 = true;
                      });
                    },
                    title: const Text(
                      'Female',
                      style: TextStyle(
                          fontFamily: 'IBMPlex',
                          fontWeight: FontWeight.w500,
                          fontSize: 10),
                    ),
                    leading: Container(

                      child: Radio(
                        value: false,
                        activeColor: HexColor('#007C91'),
                        groupValue: _character,
                        onChanged: (value) {},
                      ),
                    ),
                  ))
            ],
          ),
        ),
        Text(
          'Date of Birth',
          style: TextStyle(
              color: HexColor('#757575'),
              fontFamily: 'IBMPlex',
              fontWeight: FontWeight.w400,
              fontSize: 15),
        ),
        GestureDetector(
          onTap: () {
            openDateTimePicker(context);
          },
          child: Container(
            height: 60.h,
            margin: const EdgeInsets.only(top: 5, bottom: 10),
            padding: const EdgeInsets.only(left: 5,right: 5),
            width: 343.w,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    spreadRadius: 1,
                    blurRadius: 1,
                    offset: Offset(0, 1), // changes position of shadow
                  ),
                ],
                color: HexColor('#F9FAFB')),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '01/01/1990',
                  style: TextStyle(
                      color: HexColor('#757575'),
                      fontFamily: 'IBMPlex',
                      fontWeight: FontWeight.w400,
                      fontSize: 15.sp),
                ),
                Container(
                  height: 15.h,
                  width: 10.w,
                  child: Image.asset(
                    IMG_TURNDOWN,
                    fit: BoxFit.contain,
                  ),
                )
              ],
            ),
          ),
        ),
        Text(
          'Your Job',
          style: TextStyle(
              color: HexColor('#757575'),
              fontFamily: 'IBMPlex',
              fontWeight: FontWeight.w400,
              fontSize: 15.sp),
        ),
        Container(
          height: 60.h,
          margin: const EdgeInsets.only(top: 5, bottom: 10),
          padding: const EdgeInsets.only(left: 5, right: 10),
          width: 343.w,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  spreadRadius: 1,
                  blurRadius: 1,
                  offset: Offset(0, 1), // changes position of shadow
                ),
              ],
              color: HexColor('#F9FAFB')),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Designer',
                style: TextStyle(
                    color: HexColor('#757575'),
                    fontFamily: 'IBMPlex',
                    fontWeight: FontWeight.w400,
                    fontSize: 15.sp),
              ),
            ],
          ),
        ),
        Text(
          'Phone number',
          style: TextStyle(
              color: HexColor('#757575'),
              fontFamily: 'IBMPlex',
              fontWeight: FontWeight.w400,
              fontSize: 15),
        ),
        Container(
          height: 60.h,
          margin: const EdgeInsets.only(top: 5, bottom: 10),
          padding: const EdgeInsets.only(left: 5, right: 10),
          width: 343.w,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  spreadRadius: 1,
                  blurRadius: 1,
                  offset: Offset(0, 1), // changes position of shadow
                ),
              ],
              color: HexColor('#F9FAFB')),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '+84 909123456',
                style: TextStyle(
                    color: HexColor('#757575'),
                    fontFamily: 'IBMPlex',
                    fontWeight: FontWeight.w400,
                    fontSize: 15.sp),
              ),
            ],
          ),
        ),
        Text(
          'Education',
          style: TextStyle(
              color: HexColor('#757575'),
              fontFamily: 'IBMPlex',
              fontWeight: FontWeight.w400,
              fontSize: 15.sp),
        ),
        Container(
          height: 60.h,
          margin: const EdgeInsets.only(top: 5, bottom: 10),
          padding: const EdgeInsets.only(left: 5, right: 10),
          width: 343.w,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  spreadRadius: 1,
                  blurRadius: 1,
                  offset: Offset(0, 1), // changes position of shadow
                ),
              ],
              color: HexColor('#F9FAFB')),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'District 3, HCM City',
                style: TextStyle(
                    color: HexColor('#757575'),
                    fontFamily: 'IBMPlex',
                    fontWeight: FontWeight.w400,
                    fontSize: 15.sp),
              ),
              Container(
                height: 15.h,
                width: 10.w,
                child: Image.asset(
                  IMG_TURNDOWN,
                  fit: BoxFit.contain,
                ),
              )
            ],
          ),
        ),
        Text(
          'Relationship',
          style: TextStyle(
              color: HexColor('#757575'),
              fontFamily: 'IBMPlex',
              fontWeight: FontWeight.w400,
              fontSize: 15.sp),
        ),
        Container(
          height:60.h,
          margin: const EdgeInsets.only(top: 5, bottom: 10),
          padding: const EdgeInsets.only(left: 5, right: 10),
          width: 343.w,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  spreadRadius: 1,
                  blurRadius: 1,
                  offset: Offset(0, 1), // changes position of shadow
                ),
              ],
              color: HexColor('#F9FAFB')),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Single',
                style: TextStyle(
                    color: HexColor('#757575'),
                    fontFamily: 'IBMPlex',
                    fontWeight: FontWeight.w400,
                    fontSize: 15.sp),
              ),
              Container(
                height: 15.h,
                width: 10.w,
                child: Image.asset(
                  IMG_TURNDOWN,
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
