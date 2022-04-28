import 'package:app_tobe_sonet/src/base/TextStyle/TextStyle.dart';
import 'package:app_tobe_sonet/src/controller/basecontroller.dart';
import 'package:app_tobe_sonet/src/controller/screenLogin_controller.dart';
import 'package:app_tobe_sonet/src/controller/main_controller.dart';
import 'package:app_tobe_sonet/src/function/main_event.dart';
import 'package:app_tobe_sonet/src/screen/user/routesUser_event.dart';
import 'package:app_tobe_sonet/src/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../assets/index.dart';
import '../contact/index.dart';
import '../home/screenHome_view.dart';
import 'package:badges/badges.dart';
import 'package:floating_frosted_bottom_bar/floating_frosted_bottom_bar.dart';

class ScreenMain extends StatefulWidget {
  State<ScreenMain> createState() => _ScreenMain();
}

class _ScreenMain extends State<ScreenMain> with TickerProviderStateMixin {
  int selectedIndex = 1;
  ScrollController controller = ScrollController();
  bool isBottomSheet = false;
  void eventScroll(bool value) {
    if (!value) {
      setState(() {
        _offsetFloat = Tween<Offset>(begin: Offset.zero, end: Offset(0.0, 0.0))
            .animate(_controller);
      });
    } else {
      setState(() {
        _offsetFloat = Tween<Offset>(begin: Offset.zero, end: Offset(0.0,2.5))
            .animate(_controller);
      });
    }
  }

  late AnimationController _controller;
  late Animation<Offset> _offsetFloat;
  late final offsetBool;
  late final double widthSlide;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    );

    _offsetFloat = Tween<Offset>(begin: Offset.zero, end: Offset(0.0, 0.0))
        .animate(_controller);

    _offsetFloat.addListener(() {
      setState(() {});
    });

    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: Size(375, 812),
        builder: () {
          ScreenUtil.setContext(context);
          return Scaffold(
              resizeToAvoidBottomInset: false,
              body: Stack(
                children: [
                  Container(
                    height: 812.h,
                    width: 375.w,
                    child: selectedIndex == 0
                        ? Routes_Contact(
                      EventScroll: eventScroll,
                          )
                        : selectedIndex == 1
                            ? Screen_Home(
                                EventScroll: eventScroll,
                              )
                            : Routes_User(
                                controller: controller,
                              ),
                  ),
                  Positioned(
                      bottom: 28.h,
                      child: SlideTransition(
                        position: _offsetFloat,
                        child: Container(
                            height: 50.h,
                            width: 375.w,
                            alignment: Alignment.center,
                            child: Container(
                                height: 50.h,
                                width: 321.w,
                                decoration: BoxDecoration(
                                  color: colorSmoke,
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceAround,
                                  crossAxisAlignment:
                                  CrossAxisAlignment.center,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          selectedIndex = 0;
                                        });
                                      },
                                      child: Container(
                                        height: 50.h,
                                        width: 100.w,
                                        child: Column(
                                          mainAxisAlignment:
                                          MainAxisAlignment.center,
                                          children: [
                                            ImageIcon(
                                              AssetImage(IC_CALL_CHAT),
                                              color: selectedIndex == 0
                                                  ? colorGreenText
                                                  : colorGrey,
                                              size: 20.h,
                                            ),
                                            textFieldRegular(
                                                'Call',
                                                13.sp,
                                                selectedIndex == 0
                                                    ? colorGreenText
                                                    : colorGrey,
                                                TextAlign.center)
                                          ],
                                        ),
                                      ),
                                    ),
                                    GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            selectedIndex = 1;
                                          });
                                        },
                                        child: Container(
                                          height: 50.h,
                                          width: 100.w,
                                          child: Column(
                                            mainAxisAlignment:
                                            MainAxisAlignment.center,
                                            crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                            children: [
                                              Badge(
                                                  badgeColor: Colors.yellow,
                                                  elevation: 2,
                                                  position:
                                                  BadgePosition.topEnd(
                                                      top: -8.h,
                                                      end: -12.w),
                                                  animationDuration:
                                                  Duration(
                                                      milliseconds:
                                                      300),
                                                  animationType:
                                                  BadgeAnimationType
                                                      .fade,
                                                  borderSide: BorderSide(
                                                      width: 1,
                                                      color: colorWhite),
                                                  badgeContent: Text(
                                                    '10',
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 8.sp,
                                                        fontWeight:
                                                        FontWeight
                                                            .bold),
                                                  ),
                                                  child: ImageIcon(
                                                    AssetImage(
                                                        IMG_MESS_BOTTOM),
                                                    color:
                                                    selectedIndex == 1
                                                        ? colorGreenText
                                                        : colorGrey,
                                                    size: 22.h,
                                                  )),
                                              textFieldRegular(
                                                  'Messages',
                                                  13.sp,
                                                  selectedIndex == 1
                                                      ? colorGreenText
                                                      : colorGrey,
                                                  TextAlign.center)
                                            ],
                                          ),
                                        )),
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          selectedIndex = 2;
                                        });
                                      },
                                      child: Container(
                                        height: 50.h,
                                        width: 100.w,
                                        child: Column(
                                          mainAxisAlignment:
                                          MainAxisAlignment.center,
                                          children: [
                                            ImageIcon(
                                              AssetImage(
                                                  IMG_ACCOUNT_BOTTOM),
                                              color: selectedIndex == 2
                                                  ? colorGreenText
                                                  : colorGrey,
                                              size: 20.h,
                                            ),
                                            textFieldRegular(
                                                'Account',
                                                13.sp,
                                                selectedIndex == 2
                                                    ? colorGreenText
                                                    : colorGrey,
                                                TextAlign.center)
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ))),
                      ))
                ],
              ));
        });
  }
}
