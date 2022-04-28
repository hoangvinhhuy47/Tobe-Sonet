import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'screenUser_view.dart';
import 'Setting/Screen_Setting.dart';
// import 'package:get/get.dart';
class Routes_User extends StatelessWidget {
  ScrollController controller;

  Routes_User({Key? key, required this.controller}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: MaterialApp(
        initialRoute: 'Screen_User',
        debugShowCheckedModeBanner: false,
        routes: {
          'Screen_User': (context) => ScreenUser(controller: controller,),
          'Screen_Setting': (context) => ScreenSetting(controller: controller,)
        },
      ),
    );
  }
}
