import 'package:dominos/const/colors.dart';
import 'package:dominos/widget/story/storydata.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class StoryButton extends StatelessWidget {
  String userName;
  String AvatarName;
StoryButton(this.userName,this.AvatarName);
  @override
  Widget build(BuildContext context) {
    return Padding(padding: const EdgeInsets.all(9) ,
      child: Column(
        children: [
          InkWell(
            borderRadius:  BorderRadius.circular(35.sp),
            onTap: (){

            },
            child: Container(
              height: 66.sp,
              width: 66.sp,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(55.sp),
                border: Border.all(color: AppColor.primary,width: 2.4.sp),
              ) ,
              child: Padding(
                padding: EdgeInsets.all(1.3.sp),
              child: Container(
                decoration:BoxDecoration(
                  borderRadius: BorderRadius.circular(35.sp),
                image: DecorationImage(
                  image: NetworkImage(AvatarName),
                  fit: BoxFit.cover,
                ) ,

              ),
            ),
          ),
            ),
          ),
          SizedBox(height: 3.sp,),
          Text(userName)
      ],
    ),

    );
  }
}
