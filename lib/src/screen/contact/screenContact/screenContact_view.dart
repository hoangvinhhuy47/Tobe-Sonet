import 'package:app_tobe_sonet/src/assets/index.dart';
import 'package:app_tobe_sonet/src/screen/contact/screenContact/screenAddContact_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:transition/transition.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../base/TextStyle/TextStyle.dart';
import '../../../component/itemContact_view.dart';
import '../../../utils/style.dart';

class Screen_Contact extends StatefulWidget {
  State<Screen_Contact> createState() => _Screen_Contact();

  Screen_Contact({Key? key, required this.EventScroll}) : super(key: key);
  dynamic EventScroll;
  ScrollController controller = ScrollController();
}

class _Screen_Contact extends State<Screen_Contact> {
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
                          ImageIcon(
                            AssetImage(IMG_LOGO),
                            color: colorGreenText,
                            size: 20.w,
                          ),
                          textFieldBold('Contacts', 16.sp, colorWhite),
                          GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    Transition(
                                        child: Screen_AddContact(),
                                        transitionEffect:
                                            TransitionEffect.RIGHT_TO_LEFT,
                                        curve: Curves.linear));
                              },
                              child: ImageIcon(
                                AssetImage(IC_ADDNEWGR),
                                color: colorWhite,
                                size: 20.w,
                              )),
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
                            ViewInputSearch(context),
                            SizedBox(
                              height: 12.h,
                            ),
                            ViewItemContact(context)
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

  Widget ViewInputSearch(BuildContext context) {
    return Container(
        height: 50.h,
        width: 341.w,
        alignment: Alignment.center,
        child: Container(
          height: 50.h,
          width: 341.w,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  spreadRadius: 1,
                  blurRadius: 1,
                  offset: Offset(0, 1), // changes position of shadow
                ),
              ],
              color: HexColor('#FAFAFA')),
          child: TextFormField(
            style: TextStyle(color: Colors.blueGrey, fontSize: 13.sp),
            decoration: InputDecoration(
                border: InputBorder.none,
                hintStyle: TextStyle(color: Colors.blueGrey, fontSize: 13.sp),
                prefixIcon: IconButton(
                  icon: Icon(Icons.search, color: HexColor('#A5BBC2')),
                  onPressed: () {},
                  iconSize: 22,
                )),
          ),
        ));
  }

  Widget ViewItemContact(BuildContext context) {
    return Container(
        height: 600.h,
        width: 375.w,
        child: NotificationListener<ScrollNotification>(
            child: ListView(
              controller: widget.controller,
              children: [
                Item_Contact(),
                Item_Contact(),
                Item_Contact(),
                Item_Contact(),
                Item_Contact(),
                Item_Contact(),
                Item_Contact(),
                Item_Contact(),
                Item_Contact(),
                Item_Contact(),
                Item_Contact(),
                Item_Contact(),
                Item_Contact(),
              ],
            ),
            onNotification: (scrollNotification) {
              if (widget.controller.position.userScrollDirection ==
                  ScrollDirection.reverse) {
                widget.EventScroll(true);
              }
              if (widget.controller.position.userScrollDirection ==
                  ScrollDirection.forward) {
                widget.EventScroll(false);
              }
              return true;
            }));
  }
}
