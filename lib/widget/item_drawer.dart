
import 'package:dominos/const/colors.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ItemAccount extends StatelessWidget {
  final double borderRadius;
  final String text;
  final IconData icon;
  final IconData iconn;
  final Color colorIcon;
  final VoidCallback? onPressed;

  const ItemAccount({
    this.borderRadius = 15.0,
    required this.text,
    required this.icon,
    required this.iconn,
    required this.colorIcon,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Container(
      height: 50.sp,
      width: size.width,
      margin: EdgeInsets.only(bottom: 10.0),
      decoration: BoxDecoration(
        border: Border.all(color: AppColor.primary,width: 1.2.sp),
          borderRadius: BorderRadius.circular(borderRadius.sp)
      ),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(borderRadius.sp)),
        elevation: 0,
        color: Colors.grey[100],
        margin: EdgeInsets.all(0),
        child: InkWell(
          onTap: onPressed,
          borderRadius: BorderRadius.circular(borderRadius.sp),
          child: Padding(
            padding: const EdgeInsets.only(left: 10.0, right: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      height: 38,
                      width: 38,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: colorIcon,
                      ),
                      child: Icon(icon, color: Colors.white ),
                    ),
                    SizedBox(width: 8.0),
                   Text(text,style: TextStyle(fontSize: 15.sp,fontWeight: FontWeight.w400),),
                  ],
                ),
                Icon(iconn)
              ],
            ),
          ),
        ),
      ),
    );
  }
}