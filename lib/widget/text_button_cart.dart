import 'package:dominos/const/colors.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'custom_text.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressedFn;

  CustomButton(this.text, this.onPressedFn,);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: AppColor.primary,
        elevation: 0,
        padding: EdgeInsets.symmetric(vertical: 16.h),
      ),
      onPressed: onPressedFn,
      child: CustomText(
        text: text,
        fontSize: 14,
        alignment: Alignment.center,
      ),
    );
  }
}
