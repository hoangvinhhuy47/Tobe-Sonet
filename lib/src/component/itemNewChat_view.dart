import 'package:app_tobe_sonet/src/assets/index.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class Item_NewChat extends StatefulWidget {
  State<Item_NewChat> createState() => _Item_NewChat();
}

class _Item_NewChat extends State<Item_NewChat> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
        height: 50,
        width: size.width,
        margin: const EdgeInsets.only(top: 15),
        padding: const EdgeInsets.only(left: 5, right: 15),
        child: Row(
          children: [
            Container(
              margin: const EdgeInsets.only(right: 10),
              height: 50,
              width: 50,
              child: Stack(alignment: Alignment.center, children: [
                Container(
                  height: 50,
                  width: 50,
                  margin: const EdgeInsets.only(left: 5),
                  child: CircleAvatar(
                    child: Image.asset(
                      IMG_Avatar,
                      fit: BoxFit.contain,
                      height: 50,
                      width: 50,
                    ),
                    radius: 50,
                    backgroundColor: HexColor('#FFFFFF'),
                  ),
                ),
                Positioned(
                    top: 35,
                    left: 35,
                    child: Container(
                      height: 15,
                      width: 15,
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
                            color: Colors.white.withOpacity(0.1),
                            spreadRadius: 2,
                            blurRadius: 3,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                    ))
              ]),
            ),
            Text(
              'Alexander The Roman',
              style: TextStyle(
                  fontFamily: 'IBMPlex',
                  color: HexColor('#3A3C3D'),
                  fontStyle: FontStyle.normal,
                  fontSize: 15,
                  fontWeight: FontWeight.w500),
            )
          ],
        ));
  }
}
