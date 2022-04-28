import 'package:app_tobe_sonet/src/base/TextStyle/TextStyle.dart';
import 'package:app_tobe_sonet/src/utils/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class InputComponent extends StatefulWidget {
  const InputComponent(
      {Key? key,
      required this.lablel,
      required this.require,
      this.helperText,
      required this.isPassWord,
      this.id,
      this.styleText,
      required this.hintText, required this.isIcon})
      : super(key: key);

  State<InputComponent> createState() => _InputComponent();
  final String lablel;
  final bool require;
  final String? helperText;
  final bool isPassWord;
  final TextEditingController? id;
  final TextStyle? styleText;
  final String hintText;
  final bool isIcon;
}

class _InputComponent extends State<InputComponent> {
  bool __passwordVisible = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      __passwordVisible = widget.isPassWord;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      width: 320.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Row(
              children: [
                RichText(
                    text: TextSpan(
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'IBMPlex',
                            fontStyle: FontStyle.normal,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400),
                        children: [
                      TextSpan(text: widget.lablel, style: widget.styleText)
                    ])),
                Offstage(
                  offstage: !widget.require,
                  child: Text(
                    '*',
                    style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.w400,
                        fontSize: 12.sp),
                  ),
                )
              ],
            ),
          ),
          Container(
            height: widget.helperText != null ? 70.h : 50.h,
            child: TextFormField(
              controller: widget.id,
              obscureText: __passwordVisible,
              style: TextStyle(fontSize: 13.sp,color: colorBlackText,fontFamily: 'IBMPlex',fontStyle: FontStyle.normal,fontWeight: FontWeight.w500),
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  // hintText: widget.hintText,
                  hintStyle: TextStyle(fontSize: 14.sp,color: colorGrey),
                  errorStyle: TextStyle(color: Colors.red, fontSize: 12.sp,),
                  errorText: widget.helperText,
                  alignLabelWithHint: true,
                  labelText: widget.hintText,
                  labelStyle: TextStyle(fontSize: 12.sp),
                  helperStyle: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.w300,
                      fontSize: 10.sp),
                 prefixIconConstraints: BoxConstraints(maxWidth: widget.isIcon?65.w:10),
                  prefixIcon:widget.isIcon?Container(
                    height: 22.h,
                    width: 65.w,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(height: 25.h,width: 25.w,
                        decoration: BoxDecoration(
                          image: DecorationImage(image: AssetImage('lib/src/assets/images/ic_vietnam.png'),fit: BoxFit.contain)
                        ),
                        ),
                        textFieldBold('+84', 12.sp, colorBlackText),
                        Icon(Icons.arrow_drop_down_rounded,color: colorBlackText,size: 13.w,)
                      ],
                    ),
                  ):Container(width: 10,),
                  suffixIconConstraints: BoxConstraints(maxWidth: widget.isPassWord?35.w:1),
                  suffixIcon:widget.isPassWord? IconButton(
                    icon: Icon(__passwordVisible
                        ? Icons.remove_red_eye
                        : Icons.visibility_off_rounded),
                    onPressed: () {
                      setState(() {
                        __passwordVisible = !__passwordVisible;
                      });
                    },
                    iconSize: 16.w,
                  ):Container(
                    height: 1,width: 1,
                  )),
            ),
          )
        ],
      ),
    );
  }
}
