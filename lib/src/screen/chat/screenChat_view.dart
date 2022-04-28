import 'package:app_tobe_sonet/src/base/TextStyle/TextStyle.dart';
import 'package:app_tobe_sonet/src/controller/screenChat_controller.dart';
import 'package:app_tobe_sonet/src/utils/image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';
import '../../assets/index.dart';

import '../../component/itemChatResend_view.dart';
import '../../component/itemChatSend_view.dart';
import '../../component/itemChatTime_view.dart';

import 'package:flutter/services.dart';
import 'package:wechat_camera_picker/wechat_camera_picker.dart';
import '../../base/KeyboarEmoij/keyBoardEmoij_event.dart';
import '../../controller/main_controller.dart';
import '../../utils/style.dart';
import '../../controller/basecontroller.dart';
class Chat {
  //modal class for Person object
  String title;
  int type;
  Chat({required this.title, required this.type});
}
class ScreenChat extends StatefulWidget{
  State<ScreenChat> createState()=>_ScreenChat();
}
class _ScreenChat extends State<ScreenChat> {
  bool isImage = false;
  List<Chat> data_chat = [];
  bool emojiShowing = false;
  final ip_chat = TextEditingController();

  @override
  Widget build(BuildContext context) {
    data_chat.add(Chat(
        title: 'How is your family? \nHow is your mother doing?', type: 1));
    data_chat.add(Chat(
        title: 'Hi Tammy, I am fine. How are you Tammy? \nI am fine too.',
        type: 2));
    data_chat.add(Chat(
        title: 'How is your family? \nHow is your mother doing?', type: 1));
    data_chat.add(Chat(
        title: 'How is your family? \nHow is your mother doing?', type: 2));
    data_chat.add(Chat(title: '14:02 25/03/2022', type: 3));
    data_chat.add(Chat(
        title: 'How is your family? \nHow is your mother doing?', type: 1));
    data_chat.add(Chat(
        title: 'Hi Tammy, I am fine. How are you Tammy? \n I am fine too.',
        type: 2));
    data_chat.add(Chat(
        title: 'How is your family? \nHow is your mother doing?', type: 2));
    data_chat.add(Chat(
        title: 'How is your family? \nHow is your mother doing?', type: 1));
    data_chat.add(Chat(title: '14:02 25/03/2022', type: 3));
    data_chat.add(Chat(
        title: 'Hi Tammy, I am fine. How are you Tammy? \nI am fine too.',
        type: 2));
    // Get.lazyPut(() => ChatController_GetX(),fenix: true);
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
                children: [
                  SizedBox(
                    height: 48.h,
                  ),
                  ViewHeader(context),
                  SizedBox(
                    height: 5.h,
                  ),
                  ViewData(context)
                ],
              ),
            ),
            bottomSheet: BottomSheet(context),
          );
        });
  }

  Widget ViewHeader(BuildContext context) {
    return Container(
      height: 40.h,
      width: 343.w,
      child: Row(
        children: [
          GestureDetector(
            onTap: (){
             Navigator.pop(context);
            },
            child: ImageIcon(
              AssetImage(IMG_Back),
              color: colorWhite,
              size: 12.w,
            ),
          ),
          SizedBox(
            width: 11.w,
          ),
          Container(
            height: 40.h,
            width: 41.w,
            child: CircleAvatar(
              child: Image.asset(
                IMG_Avatar,
                fit: BoxFit.cover,
                height: 30.h,
                width: 30.w,
              ),
              radius: 2,
              backgroundColor: HexColor('#FFFFFF'),
            ),
          ),
          SizedBox(
            width: 5.w,
          ),
          Container(
            height: 40.h,
            width: 147.w,
            child: Column(
              children: [
                textFieldBold('Alexander Huynh', 15.sp, colorWhite),
                Container(
                  child: Row(
                    children: [
                      SizedBox(
                        width: 15.w,
                      ),
                      Container(
                        height: 9.w,
                        width: 9.w,
                        decoration: BoxDecoration(
                            color: colorGreenText,
                            borderRadius: BorderRadius.circular(50),
                            border: Border.all(color: colorWhite, width: 1)),
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      textFieldRegular('Active', 14.sp, colorWhite,TextAlign.center)
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            width: 120.w,
            height: 50.h,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  height: 30.h,
                  width: 29.w,
                  child: CircleAvatar(
                    child: Image.asset(
                      IC_CALL_CHAT,
                      fit: BoxFit.contain,
                      height: 12.h,
                      width: 14.w,
                    ),
                    radius: 2,
                    backgroundColor: HexColor('#FAFAFA'),
                  ),
                ),
                Container(
                  height: 30.h,
                  width: 29.w,
                  child: CircleAvatar(
                    child: Image.asset(
                      IC_CALLVIDEO_CHAT,
                      fit: BoxFit.contain,
                      height: 12.h,
                      width: 14.w,
                    ),
                    radius: 50,
                    backgroundColor: HexColor('#FAFAFA'),
                  ),
                ),
                Container(
                  height: 30.h,
                  width: 29.w,
                  margin: const EdgeInsets.only(right: 2),
                  child: CircleAvatar(
                    child: Image.asset(
                      IC_MORE_CHAT,
                      fit: BoxFit.contain,
                      height: 12.h,
                      width: 14.w,
                    ),
                    radius: 50,
                    backgroundColor: HexColor('#FAFAFA'),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget BottomSheet(BuildContext context) {
    return Container(
      width: 375.w,
      height: !emojiShowing & !isImage ? 50.h : 300,
      child: Column(
        children: [
          Container(
            height: 50.h,
            alignment: Alignment.center,
            width: 375.w,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  spreadRadius: 2,
                  blurRadius: 1,
                  offset: Offset(0, 0.5), // changes position of shadow
                ),
              ],
            ),
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 15.w,
                ),
                Container(
                  height: 50.h,
                  width: 230.w,
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            FocusScopeNode currentFocus =
                            FocusScope.of(context);
                            if (!currentFocus.hasPrimaryFocus) {
                              currentFocus.unfocus();
                            }
                            emojiShowing = !emojiShowing;
                            isImage = false;
                          });
                        },
                        child: Container(
                          height: 20.h,
                          width: 20.w,
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5))),
                          child: Image.asset(
                            IC_CHAT_CHAT,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      Container(
                        height: 40.h,
                        width: 200.w,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.05),
                                spreadRadius: 1,
                                blurRadius: 1,
                                offset:
                                    Offset(0, 1), // changes position of shadow
                              ),
                            ],
                            color: HexColor('#E6ECEE')),
                        child: TextFormField(
                          style: TextStyle(
                              fontSize: 12.sp,
                              color: colorBlackText,
                              fontWeight: FontWeight.w400),
                          textAlign: TextAlign.left,
                          controller: ip_chat,
                          maxLines: 2,
                          onTap: () {
                            setState(() {
                              FocusScopeNode currentFocus =
                                  FocusScope.of(context);
                              if (!currentFocus.hasPrimaryFocus) {
                                currentFocus.unfocus();
                              }
                              isImage = false;
                              emojiShowing = false;
                            });
                          },
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.only(left: 8),
                            hintText: 'Type a message ...',
                            border: InputBorder.none,
                            hintStyle: TextStyle(
                                fontSize: 12.sp,
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w300,
                                fontFamily: 'IBMPlex'),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  height: 50.h,
                  width: 130.w,
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GestureDetector(
                        onTap: () async {
                          await CameraPicker.pickFromCamera(
                            context,
                            pickerConfig: const CameraPickerConfig(
                              enableRecording: true,
                              enableAudio: true,
                              enablePinchToZoom: true,
                            ),
                          );
                        },
                        child: Container(
                          height: 20.h,
                          width: 20.w,
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5))),
                          child: Image.asset(
                            IC_CAMERA_CHAT,
                            fit: BoxFit.contain,
                            color: HexColor('#A5BBC2'),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            FocusScopeNode currentFocus =
                                FocusScope.of(context);
                            if (!currentFocus.hasPrimaryFocus) {
                              currentFocus.unfocus();
                            }
                            isImage = !isImage;
                            emojiShowing = false;
                          });
                        },
                        child: Container(
                          height: 20.h,
                          width: 20.w,
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5))),
                          child: Image.asset(
                            IC_PICTURE_CHAT,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      Container(
                        height: 20.h,
                        width: 20.w,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(5))),
                        child: Image.asset(
                          IC_MICRO_CHAT,
                          fit: BoxFit.contain,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            emojiShowing = false;
                            isImage = false;
                            FocusScopeNode currentFocus =
                                FocusScope.of(context);
                            if (!currentFocus.hasPrimaryFocus) {
                              currentFocus.unfocus();
                            }
                            if (ip_chat.text.length > 0) {
                              data_chat.add(Chat(title: ip_chat.text, type: 2));
                              ip_chat.text = '';
                            }
                          });
                        },
                        child: Container(
                          height: 20.h,
                          width: 20.w,
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5))),
                          child: Image.asset(
                            IC_SEND_CHAT,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Offstage(
            offstage: !emojiShowing,
            child: KeyBoardEmoij(controller: ip_chat),
          ),
          Offstage(
            offstage: !isImage,
            child: ImageGallery(),
          )
        ],
      ),
    );
  }

  Widget ViewData(BuildContext context) {
    return Expanded(
        flex: 1,
        child: Container(
          decoration: BoxDecoration(
              color: colorWhite,
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(15), topLeft: Radius.circular(15))),
          child: ListView.builder(
              padding: const EdgeInsets.only(bottom: 50),
              itemCount: data_chat.length,
              itemBuilder: (context, index) {
                final item = data_chat[index];
                return item.type == 1
                    ? Item_ChatSend(
                        tilte: item.title,
                      )
                    : item.type == 2
                        ? Item_ChatResend(
                            tilte: item.title,
                          )
                        : Item_ChatTime(
                            tilte: item.title,
                          );
              }),
        ));
  }
}
