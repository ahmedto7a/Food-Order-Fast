import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CustomAppBar extends StatelessWidget {


  final IconData leftIcon;
  final Icon icon;
  final Function()? leftCallback;
  final Function()? onTap;

  const CustomAppBar(
      {Key? key,
        required this.onTap,
        required this.icon,
        required this.leftIcon,
        this.leftCallback})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
          top:17.sp ,left: 15.sp,right: 15.sp),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: leftCallback != null ? () => leftCallback!() : null,
            child: _buildIcon(leftIcon),
          ),
          SizedBox(width: 200.sp),
          Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.black,
            ),
            child: GestureDetector(onTap: onTap,child: icon,)
            ),

        ],
      ),
    );
  }

  Widget _buildIcon(IconData icon) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.black,
      ),
      child: Icon(icon,size:23.sp ,color:  Colors.white,),
    );
  }

}

