import 'package:dominos/const/colors.dart';
import 'package:dominos/viwe/control_viwe.dart';
import 'package:dominos/widget/button.dart';
import 'package:flutter/material.dart';
import '../utils/helper.dart';
import 'package:sizer/sizer.dart';
import 'login_signup_screen.dart';
import 'package:get/get.dart';

class OnbordingScreen extends StatelessWidget {
  const OnbordingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
        body: SizedBox(
      width: Helper.getScreenWidth(context),
      height: Helper.getScreenHeight(context),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: ClipPath(
              clipper: CustomClipperAppBar(),
              child: Container(
                width: double.infinity,
                height: Helper.getScreenHeight(context) * 0.5,
                decoration: ShapeDecoration(
                  color: AppColor.primary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Image.asset(
                  "assets/login_bg.png",
                  color: Colors.white,
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 38.0),
            child: Align(
              alignment: Alignment.center,
              child: Image.asset(
                "assets/logo_free-file.png",
                // "assets/2022-01-21 (2).png",
                width: 118.sp,
                height: 120.sp,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 185.sp,
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.only(
                left: 32,
                right: 32,
                bottom: 32,
              ),
              decoration: BoxDecoration(
                color: AppColor.primary,
                borderRadius: BorderRadius.circular(50),
              ),

              child: Column(
                children: [
                  // Image.asset("assets/Order fast_free-file (3).png"),
                  // Text(
                  //   "Simolify your\n cooking plan",
                  //   style: TextStyle(
                  //     fontSize: 23.sp,
                  //     color: Colors.white,
                  //     fontWeight: FontWeight.w900,
                  //   ),
                  // ),
                  // Text("No more confused about",style: const TextStyle(
                  //   fontSize: 22,
                  //   color: Colors.black,
                  //   fontWeight: FontWeight.w400,
                  // ),),
                  //   Text("your mreal menu",style: TextStyle(fontWeight: FontWeight.w400,  fontSize: 22,color: Colors.black)),
                     Image.asset("assets/Order fast_free-file (3).png",fit: BoxFit.cover,width: 130.sp,height: 130.sp),
                  Padding(
                    padding: const EdgeInsets.only( top: 8,left: 30, right: 30),
                    child: CustomButton(
                      txtcolor: AppColor.primary,
                      color: AppColor.Home,
                        text: "Let's Go",
                        onPreesed: () {
                          "${Get.to(ControlView())}";
                        }),
                  )
                ],
              ),

            ),
          ),
        ],
      ),
    ));
  }
}

class CustomClipperAppBar extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Offset controlPoint = Offset(size.width * 0.24, size.height);
    Offset endPoint = Offset(size.width * 0.25, size.height * 0.96);
    Offset controlPoint2 = Offset(size.width * 0.3, size.height * 0.78);
    Offset endPoint2 = Offset(size.width * 0.5, size.height * 0.78);
    Offset controlPoint3 = Offset(size.width * 0.7, size.height * 0.78);
    Offset endPoint3 = Offset(size.width * 0.75, size.height * 0.96);
    Offset controlPoint4 = Offset(size.width * 0.76, size.height);
    Offset endPoint4 = Offset(size.width * 0.79, size.height);
    Path path = Path()
      ..lineTo(0, size.height)
      ..lineTo(size.width * 0.21, size.height)
      ..quadraticBezierTo(
        controlPoint.dx,
        controlPoint.dy,
        endPoint.dx,
        endPoint.dy,
      )
      ..quadraticBezierTo(
        controlPoint2.dx,
        controlPoint2.dy,
        endPoint2.dx,
        endPoint2.dy,
      )
      ..quadraticBezierTo(
        controlPoint3.dx,
        controlPoint3.dy,
        endPoint3.dx,
        endPoint3.dy,
      )
      ..quadraticBezierTo(
        controlPoint4.dx,
        controlPoint4.dy,
        endPoint4.dx,
        endPoint4.dy,
      )
      ..lineTo(size.width, size.height)
      ..lineTo(size.width, 0);

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
