// import 'package:flutter/cupertino.dart';
// import 'package:get/get.dart';
//
// import '../screen/User/routesUser_event.dart';
// import '../screen/contact/index.dart';
// import '../screen/home/screenHome_view.dart';
//
// class MainController_GetX extends GetxController {
//   static MainController_GetX instace = Get.find();
//   @override
//   var selectedIndex = 1.obs;
//   var badges = 1.obs;
//   void changeIndex(int value) {
//     if (selectedIndex != value) {
//       selectedIndex = RxInt(value);
//       badges = RxInt(value);
//       print(RxInt(value));
//     }
//   }
//
//   List<Widget> screen = [Routes_Contact(), Screen_Home(), Routes_User()];
//   Widget getScreen() {
//     print(screen[selectedIndex.toInt()]);
//     return Obx(() => screen[selectedIndex.toInt()]);
//   }
// }
// // controller_getX.selectedIndex == 1
// // ? Screen_Home()
// //     : controller_getX.selectedIndex == 0
// // ? Routes_Contact()
// //     : Routes_User()),
