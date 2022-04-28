import 'package:flutter/material.dart';
import 'package:bottom_picker/bottom_picker.dart';
import 'package:hexcolor/hexcolor.dart';

void openDateTimePicker(BuildContext context) {
  BottomPicker.dateTime(
    title: 'Chọn Ngày',
    titleStyle: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 15,
      color: Colors.black,
    ),
    onSubmit: (date) {
      print(date);
    },
    onClose: () {
      print('Picker closed');
    },
    pickerTextStyle: TextStyle(
        color: HexColor('#757575'),
        fontFamily: 'IBMPlex',
        fontWeight: FontWeight.w400,
        fontSize: 15),
    use24hFormat: true,
    minDateTime: DateTime(1990, 5, 1),
    maxDateTime: DateTime(2022, 8, 2),
    initialDateTime: DateTime(2021, 15, 3),
    buttonText: 'Xác Nhận',
    displayButtonIcon: false,
    gradientColors: [
      HexColor('#4EBE99'),
      HexColor('#4EBE99'),
    ],
    buttonTextStyle: TextStyle(
        color: HexColor('#FFFFFF'),
        fontFamily: 'IBMPlex',
        fontWeight: FontWeight.w400,
        fontSize: 15),
  ).show(context);
}
