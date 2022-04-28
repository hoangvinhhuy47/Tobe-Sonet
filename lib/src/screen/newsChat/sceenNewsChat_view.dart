import 'package:app_tobe_sonet/src/assets/index.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../component/itemNewChat_view.dart';

class Screen_NewsChat extends StatefulWidget {
  State<Screen_NewsChat> createState() => _Screen_NewsChat();
}

class _Screen_NewsChat extends State<Screen_NewsChat> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: HexColor('#E0E8EB'),
      body: Container(
        margin: const EdgeInsets.only(top: 30),
        padding: const EdgeInsets.only(top: 5, right: 5, left: 5),
        height: size.height - 30,
        width: size.width,
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.white.withOpacity(0.1),
                spreadRadius: 2,
                blurRadius: 3,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(15),
              topLeft: Radius.circular(15),
            )),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: size.width,
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 45,
                      width: 50,
                      margin: const EdgeInsets.only(left: 5),
                      child: CircleAvatar(
                        child: Image.asset(
                          IMG_LOGO,
                          fit: BoxFit.contain,
                          height: 22,
                          width: 22,
                        ),
                        radius: 50,
                        backgroundColor: HexColor('#FFFFFF'),
                      ),
                    ),
                    Text(
                      "New Chat",
                      style: TextStyle(
                          color: HexColor('#ACC1C7'),
                          fontFamily: 'IBMPlex',
                          fontWeight: FontWeight.w600,
                          fontSize: 18),
                    ),
                    Container(
                      height: 45,
                      width: 50,
                      margin: const EdgeInsets.only(left: 5),
                      child: CircleAvatar(
                        child: Image.asset(
                          'lib/src/assets/images/add_newgr.png',
                          fit: BoxFit.contain,
                          height: 22,
                          width: 22,
                        ),
                        radius: 50,
                        backgroundColor: HexColor('#FFFFFF'),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                  height: 50,
                  width: size.width,
                  margin: const EdgeInsets.only(top: 20),
                  alignment: Alignment.center,
                  child: Container(
                    height: 50,
                    width: size.width * 0.9,
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
                      decoration: InputDecoration(

                          border: InputBorder.none,
                          hintStyle:
                          TextStyle(color: Colors.blueGrey, fontSize: 15),
                          prefixIcon: IconButton(
                            icon: Icon(Icons.search, color: HexColor('#A5BBC2')),
                            onPressed: () {},
                            iconSize: 22,
                          )),
                    ),
                  )),
              Container(
                width: size.width,
                height: 50,
                margin: const EdgeInsets.only(top: 20),
                child: Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(right: 15),
                      height: 50,
                      width: 50,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: HexColor('#FAFAFA')),
                      child: Image.asset('lib/src/assets/images/add_newgrAll.png',fit: BoxFit.contain,height: 30,width: 30,),
                    ),
                    Text('New Group',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 17,fontStyle: FontStyle.normal,fontFamily: 'IBMPlex',color: HexColor('#ACC1C7')),)
                  ],
                ),
              ),
              Container(
                height: 1,
                width: size.width,
                margin: const EdgeInsets.only(top: 5),
                color: HexColor('#EEF1F1'),
              ),
              Container(
                width: size.width,
                height: size.height-235,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Item_NewChat(),
                      Item_NewChat(),
                      Item_NewChat(),
                      Item_NewChat(),
                      Item_NewChat(),
                      Item_NewChat(),
                      Item_NewChat(),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
