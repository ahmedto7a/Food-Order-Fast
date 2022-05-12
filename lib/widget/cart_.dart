import 'package:dominos/const/colors.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
class CoustomContainer extends StatelessWidget {
  const CoustomContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(19.0),
      child: Container(
        decoration: BoxDecoration(color: AppColor.Home,borderRadius: BorderRadius.circular(30),
        border: Border.all(color: AppColor.primary),
        ),
        height: 80.sp,
        width: double.infinity,
      ),
    );
  }
}

/// هحتاج صوره المنتج