import 'package:dominos/const/colors.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';


class AboutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: AppColor.primary,title: Text("About Us",style: TextStyle(fontSize: 16.sp),),centerTitle: true,),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  children: [

                    SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          AboutCard(),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Divider(thickness: 1.2,height: 35.sp,color: AppColor.secondary),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          AboutCard(),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Divider(thickness: 1.2,height: 35.sp,color: AppColor.secondary),
                          ),
                          SizedBox(
                            height: 10,
                          ),

                          AboutCard(),
                          SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AboutCard extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 5,
            backgroundColor: AppColor.primary,
          ),
          SizedBox(
            width: 10,
          ),
          Flexible(
            child: Text(
              "About Domino\'s, Domino\'s Kebda is a restaurant that you must know. If you don\'t know it, you must go to know it because it takes care of the requirements of your stomach and ease your mind through the fast foods it offers. This is your home, Domino\'s\nOr you can also order in the Domino's application\nWe work to satisfy all the needs of your sweet stomach as soon as possible without the need for anything but this application and the Internet. You can also eat inside the place and visualize it",
              style: TextStyle(
                color: Colors.black,
                fontSize: 14.sp,
                letterSpacing: 0.2,
                wordSpacing: 1.9,
                fontWeight: FontWeight.w800
              ),
            ),
          ),
        ],
      ),
    );
  }
}





