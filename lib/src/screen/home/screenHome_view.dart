import 'package:app_tobe_sonet/src/base/TextStyle/TextStyle.dart';
import 'package:app_tobe_sonet/src/function/main_event.dart';
import 'package:app_tobe_sonet/src/utils/global.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:transition/transition.dart';

import '../../assets/index.dart';
import '../../component/iconAvatarOffline.dart';
import '../../component/iconAvatarOnline.dart';
import '../../utils/style.dart';
import '../NewsChat/sceenNewsChat_view.dart';
import 'package:draggable_widget/draggable_widget.dart';
import '../../component/itemChatOffLine_view.dart';
import '../../component/itemChatOnline_view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Screen_Home extends StatelessWidget {
  Screen_Home({Key? key, required this.EventScroll,}) : super(key: key);

  ScrollController controller = ScrollController();
  dynamic EventScroll;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
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
                  width: 300.w,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      textFieldBold('Messages', 16.sp, colorWhite),
                      Container(
                        height: 21.h,
                        width: 20.w,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(IMG_SEARCH),
                                fit: BoxFit.contain)),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 35.h,
                ),
                ViewChat(context),
              ],
            ),
          ),
          DraggableWidget(
            bottomMargin: 120,
            topMargin: 120,
            intialVisibility: true,
            horizontalSpace: 20,
            shadowBorderRadius: 50,
            child: Container(
                height: 46.w,
                width: 46.w,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  gradient: LinearGradient(
                    begin: Alignment.centerRight,
                    end: Alignment.centerLeft,
                    colors: <Color>[
                      LinerGreen2,
                      LinerGreen1,
                    ],
                  ),
                ),
                child: ImageIcon(
                  AssetImage(IMG_PEN),
                  color: colorWhite,
                  size: 20.w,
                )),
            initialPosition: AnchoringPosition.bottomRight,
            // dragController: dragController,
          ),
        ],
      ),
    );
  }

  Widget ViewChat(BuildContext context) {
    return Container(
      height: 702.5.h,
      width: 375.w,
      decoration: BoxDecoration(
          color: colorWhite,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25), topRight: Radius.circular(25))),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 31.h,
            ),
            Container(
              height: 55.h,
              width: 350.w,
              child: ListView(
                scrollDirection: Axis.horizontal,
                dragStartBehavior: DragStartBehavior.start,
                children: [
                  Container(
                    height: 50.h,
                    width: 50.w,
                    margin: const EdgeInsets.only(left: 15),
                    child: Container(
                      height: 48.h,
                      width: 48.w,
                      child: CircleAvatar(
                        child: Image.asset(
                          IMG_ADD_NEWUSER,
                          fit: BoxFit.contain,
                          height: 45.h,
                          width: 45.w,
                        ),
                        radius: 50,
                        backgroundColor: colorWhite,
                      ),
                    ),
                  ),
                  IconAvatarOnline(),
                  IconAvatarOnline(),
                  IconAvatarOnline(),
                  IconAvatarOnline(),
                  IconAvatarOffline(),
                  IconAvatarOffline(),
                  IconAvatarOffline(),
                ],
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Container(
                height: 574.h,
                width: 375.w,
                child: NotificationListener<ScrollNotification>(
                    child: ListView(
                      controller: controller,
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      dragStartBehavior: DragStartBehavior.start,
                      children: [
                        Item_ChatOnline(),
                        Item_ChatOnline(),
                        Item_ChatOffline(),
                        Item_ChatOffline(),
                        Item_ChatOnline(),
                        Item_ChatOnline(),
                        Item_ChatOnline(),
                        Item_ChatOnline(),
                        Item_ChatOffline(),
                        Item_ChatOnline(),
                        Item_ChatOnline(),
                        Item_ChatOnline(),
                        Item_ChatOnline(),
                        Item_ChatOffline(),
                        Item_ChatOnline(),
                        Item_ChatOnline(),
                        Item_ChatOnline(),
                        Item_ChatOnline(),
                      ],
                    ),
                    onNotification: (scrollNotification) {
                      if (controller.position.userScrollDirection ==
                          ScrollDirection.reverse) {
                        EventScroll(true);
                      }
                      if (controller.position.userScrollDirection ==
                          ScrollDirection.forward) {
                        EventScroll(false);
                      }
                      return true;
                    }))
          ],
        ),
      ),
    );
  }
}
