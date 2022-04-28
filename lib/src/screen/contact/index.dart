import 'package:app_tobe_sonet/src/screen/contact/screenContact/screenAddContact_view.dart';
import 'package:app_tobe_sonet/src/screen/contact/screenContact/screenContact_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Routes_Contact extends StatefulWidget {
  State<Routes_Contact> createState() => _Routes_Contact();
  Routes_Contact({Key? key, required this.EventScroll}) : super(key: key);
  dynamic EventScroll;
  ScrollController controller = ScrollController();
}

class _Routes_Contact extends State<Routes_Contact> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: MaterialApp(
        initialRoute: 'Screen_Contact',
        debugShowCheckedModeBanner: false,
        routes: {
          'Screen_Contact': (context) => Screen_Contact(
                EventScroll: widget.EventScroll,
              ),
          'Screen_AddContact': (context) => Screen_AddContact()
        },
      ),
    );
  }
}
