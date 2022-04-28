import 'package:flutter/material.dart';

Text textFieldThin(String value, double size, Color colorText) {
  return Text(
    value,
    textAlign: TextAlign.center,
    style: TextStyle(
        fontSize: size,
        fontWeight: FontWeight.w200,
        fontStyle: FontStyle.normal,
        fontFamily: 'IBMPlex',
        color: colorText),
  );
}

Text textFieldRegular(String value, double size, Color colorText,TextAlign align) {
  return Text(
    value,
    textAlign: align,
    style: TextStyle(
        fontSize: size,
        fontWeight: FontWeight.w300,
        fontStyle: FontStyle.normal,
        fontFamily: 'IBMPlex',
        color: colorText),
  );
}

Text textFieldBold(String value, double size, Color colorText) {
  return Text(
    value,
    textAlign: TextAlign.center,
    maxLines: 2,
    style: TextStyle(
        fontSize: size,
        fontWeight: FontWeight.w600,
        fontStyle: FontStyle.normal,
        fontFamily: 'IBMPlex',
        color: colorText),
  );
}

Text textFieldOverLine(String value, double size, Color colorText) {
  return Text(
    value,
    textAlign: TextAlign.center,
    maxLines: 2,
    style: TextStyle(
      decoration: TextDecoration.lineThrough,
        fontSize: size,
        fontWeight: FontWeight.w300,
        fontStyle: FontStyle.normal,
        fontFamily: 'IBMPlex',
        color: colorText),
  );
}
