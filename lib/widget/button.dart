import 'package:dominos/const/colors.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CustomButton extends StatelessWidget {
  // const CustonButton({Key? key}) : super(key: key);
  final String text;
  final Function() onPreesed;
  final Color color;
  final Color txtcolor;

  CustomButton({required this.text, required this.onPreesed,required this.color,required this.txtcolor});
  @override
  Widget build(BuildContext context) {
    return  Container(
      height: 40.sp,
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: color,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30)),
        ),
        onPressed:onPreesed,
        child: Text(text,style: TextStyle(fontSize: 20,color: txtcolor),),
      ),
    );
  }
}