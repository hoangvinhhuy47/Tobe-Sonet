import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class Item_ChatTime extends StatefulWidget {
  const Item_ChatTime({Key? key, required this.tilte}) : super(key: key);

  State<Item_ChatTime> createState() => _Item_ChatTime();
  final String tilte;
}

class _Item_ChatTime extends State<Item_ChatTime> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: 20,
      alignment: Alignment.center,
      margin: const EdgeInsets.all(
       5
      ),
      child: Text('${widget.tilte}',style: TextStyle(fontStyle: FontStyle.normal,fontFamily: 'IBMPlex',fontSize: 12,color:HexColor('#B5C0CF'),fontWeight: FontWeight.w300),),
    );
  }
}
