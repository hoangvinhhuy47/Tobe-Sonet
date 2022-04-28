import 'package:app_tobe_sonet/src/assets/index.dart';
import 'package:app_tobe_sonet/src/base/TextStyle/TextStyle.dart';
import 'package:app_tobe_sonet/src/utils/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../base/InputComponent/InputComponent.dart';
import '../../../component/itemContact_view.dart';

class Screen_AddContact extends StatefulWidget {
  State<Screen_AddContact> createState() => _Screen_AddContact();
}

class _Screen_AddContact extends State<Screen_AddContact> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

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
                                AssetImage(IMG_Back),
                                color: colorWhite,
                                size: 20.w,
                              )),
                          textFieldBold('Add contact', 16.sp, colorWhite),
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
                              height: 12.h,
                            ),
                            InputNumber(context),
                            SizedBox(height: 12.h,),
                            ViewButton(context)
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

  Widget InputNumber(BuildContext context) {
    return Container(
      width: 375.w,
      height: 70.h,
      alignment: Alignment.center,
      child: InputComponent(
        isPassWord: false,
        lablel: '',
        require: false,
        isIcon: true,
        hintText: 'Phone Number',
      ),
    );
  }

  Widget ViewButton(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 274.w,
          height: 50.h,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: colorGreenText,
            borderRadius: BorderRadius.circular(25),
          ),
          child: textFieldRegular('Continue', 17.sp, colorWhite, TextAlign.center),
        ),
        SizedBox(
          height: 10.h,
        ),
        textFieldRegular('OR', 17.sp, colorGrey, TextAlign.center),
        Container(
          margin: const EdgeInsets.only(top: 15),
          width: 274.w,
          height: 50.h,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: colorGreenText,
            borderRadius: BorderRadius.circular(25),
          ),
          child: textFieldRegular(
              'Scan QR Code', 17.sp, colorWhite, TextAlign.center),
        ),
      ],
    );
  }
}
