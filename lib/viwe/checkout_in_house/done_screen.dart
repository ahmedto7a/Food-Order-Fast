import 'package:dominos/const/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

class OrderDoneInDomina extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ColumnnSVG();
  }
}


Widget ColumnnSVG() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      SvgPicture.asset(
        "assets/undraw_order_confirmed_re_g0if.svg",
        width: 180.sp,
        height: 240.sp,
      ),
      SizedBox(
        height: 40,
      ),
      Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children:[
          Divider(thickness: 1.3,color: AppColor.primary,indent: 3.4,),
          SizedBox(
            height: 10,
          ),
          Text(
            "Your Order placed  and wait the notification to Submit order or Refuse , Thank You ",
            style: TextStyle(fontSize: 22,fontWeight: FontWeight.w800,color: Colors.black),
          ),

        ],
      ),
      SizedBox(height: 35,),
    ],
  );
}
