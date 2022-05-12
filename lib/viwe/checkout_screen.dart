import 'package:dominos/const/colors.dart';
import 'package:dominos/core/view_model/checkout_viwe_model.dart';
import 'package:dominos/utils/helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:sizer/sizer.dart';

import 'check_out_delevery/checkout_standerd_screens_d.dart';
import 'check_out_takeway/checkout_standerd_screens_t.dart';
import 'checkout_in_house/checkout_standerd_screens.dart';

class CheckOutScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.Home,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: AppColor.Home,
        leading: Padding(
          padding: const EdgeInsets.only(left: 18.0),
          child: IconButton(icon:Icon(Icons.arrow_back_ios) ,onPressed:()=>Get.back() ,color: AppColor.primary,iconSize: 25.sp,),
        ),
      ),
      body: Stack(
        children: [
          SafeArea(
            child: SingleChildScrollView(
              child:  AnimationLimiter(
                child: Column(
                  children: AnimationConfiguration.toStaggeredList(
                    duration: const Duration(milliseconds: 1075),
                    childAnimationBuilder: (widget) => SlideAnimation(
                      verticalOffset: 150.0,
                      child: FlipAnimation(
                        child: widget,
                      ),
                    ),
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                      ),

                    ),

                    SizedBox(
                      height: 25.sp,
                    ),

                    SizedBox(
                        height: Helper.getScreenHeight(context) * 0.6.sp,
                        width: Helper.getScreenWidth(context),
                        child: Stack(
                          children: [
                            Container(
                              height: double.infinity,
                              width: 100.sp,
                              decoration: ShapeDecoration(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(30),
                                      bottomRight: Radius.circular(30),
                                    ),
                                  ),
                                  color: AppColor.primary),
                            ),

                            /// Text and images for place and delivery //////////////////////////////////
                            /// /// Text and images for place and delivery ///////////////////////////////
                            /// /// Text and images for place and delivery //////////////////////////////
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 15.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 15.sp,
                                  ),
                                  /// Text and images for place and delivery ////////////////////////////////////////////////////////
                                  /// /// Text and images for place and delivery ////////////////////////////////////////////////////////
                                  /// /// Text and images for place and delivery ////////////////////////////////////////////////////////
                                  /// /// Text and images for place and delivery ////////////////////////////////////////////////////////
                                  Container(
                                    height: 80.sp,
                                    width: double.infinity,
                                    margin: const EdgeInsets.symmetric(
                                      horizontal: 20,
                                    ),
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 20,
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(50),
                                        bottomLeft: Radius.circular(50),
                                        topRight: Radius.circular(50),
                                        bottomRight: Radius.circular(50),
                                      ),
                                      color: AppColor.primary,
                                      boxShadow: [
                                        BoxShadow(
                                          color: AppColor.secondary,
                                          offset: Offset(0, 5),
                                          blurRadius: 10,
                                        ),
                                      ],
                                    ),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Choose where you want to Receive your order !!",
                                          style: TextStyle(

                                            fontSize: 22,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),

                                  SizedBox(
                                    height: 23.sp,
                                  ),

                                  GetBuilder<CheckoutViewModel>(
                                    init: CheckoutViewModel(),
                                    builder:(controller)=> GestureDetector(
                                      onTap: (){
                                        if( controller.inDomina=true){
                                          controller.stutsOrderDomina=="stuts Order Delevery";
                                          // print("${controller.inDomina}");

                                          //controller.addCheckoutToFireStore();
                                        }

                                        Get.to(CheckOutInDomina());
                                        },
                                      child: MenuCard(
                                        imageShape: ClipOval(
                                          child: Container(
                                            height: 90.sp,
                                            width: 80.sp,
                                            child: Image.asset(
                                              Helper.getAssetName(
                                                  "14-149321_store-clipart-restaurant-building-coffee-shop-png.png",),
                                              fit: BoxFit.scaleDown,
                                            ),
                                          ),
                                        ),
                                        name: "  Eat in restourant ",
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 23.sp,
                                  ),

                                  GetBuilder<CheckoutViewModel>(
                                    init: Get.put(CheckoutViewModel()),
                                    builder:(controller)=> GestureDetector(
                                      onTap: (){
                                        if( controller.indelevery=true){
                                          controller.stutsOrderDelevery="stuts Order Delevery";
                                          // print("${controller.stutsOrderDelevery}");

                                        }

                                          Get.to(CheckOutDelevery());

                                        },
                                      child: MenuCard(
                                        imageShape: ClipRRect(
                                          borderRadius: BorderRadius.circular(10),
                                          child: Container(
                                            height: 82.sp,
                                            width: 82.sp,
                                            child: Image.asset(
                                              Helper.getAssetName(
                                                  "delevery.png",),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        name: "Order Deleviry",
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 23.sp,
                                  ),
                                  GetBuilder<CheckoutViewModel>(
                                    init: Get.put(CheckoutViewModel()),
                                    builder: (controller)=>GestureDetector(
                                      onTap: () {
                                        if(controller.takeway==true){
                                          controller.stutsOrderTakeway="stuts order take way";
                                        }
                                        Get.to(CheckOutTakeWay());
                                      },
                                      child: MenuCard(
                                        imageShape: ClipRRect(
                                          // clipper: CustomTriangle(),
                                          child: Container(
                                            height: 120.sp,
                                            width: 80.sp,
                                            child: Image.asset(
                                              Helper.getAssetName(
                                                  "takeway.png",),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        name: "Order TakeWay",
                                      ),
                                    ),
                                  ),

                                ],
                              ),
                            )
                          ],
                        ),
                    ),
                  ],
              ),
            ),
          ),
            ),
            ),
            ],
      ),
    );
  }
}

class MenuCard extends StatelessWidget {


  final String name;
  final Widget imageShape;

  MenuCard({required this.imageShape,required this.name,});
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 80,
          width: double.infinity,
          margin: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: 80,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(50),
              bottomLeft: Radius.circular(50),
              topRight: Radius.circular(10),
              bottomRight: Radius.circular(10),
            ),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: AppColor.secondary,
                offset: Offset(0, 5),
                blurRadius: 10,
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: TextStyle(

                  fontSize: 17,
                  fontWeight: FontWeight.w500,
                  color: AppColor.primary,
                ),
              ),
                      ],
          ),
        ),
        SizedBox(
          height: 80,
          child: Align(
            alignment: Alignment.centerLeft,
            child: imageShape,
          ),
        ),
        SizedBox(
          height: 80,
          child: Align(
            alignment: Alignment.centerRight,
            child: Container(
              height: 40,
              width: 40,
              decoration: ShapeDecoration(
                  shape: CircleBorder(),
                  color: Colors.white,
                  shadows: [
                    BoxShadow(
                      color: AppColor.secondary,
                      offset: Offset(0, 2),
                      blurRadius: 5,
                    )
                  ]),
              child: Icon(Icons.arrow_forward_ios,color: AppColor.primary,)
            ),
          ),
        ),
      ],
    );
  }
}

class CustomTriangle extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Offset controlpoint = Offset(size.width * 0, size.height * 0.5);
    Offset endpoint = Offset(size.width * 0.2, size.height * 0.85);
    Offset controlpoint2 = Offset(size.width * 0.33, size.height);
    Offset endpoint2 = Offset(size.width * 0.6, size.height * 0.9);
    Offset controlpoint3 = Offset(size.width * 1.4, size.height * 0.5);
    Offset endpoint3 = Offset(size.width * 0.6, size.height * 0.1);
    Offset controlpoint4 = Offset(size.width * 0.33, size.height * 0);
    Offset endpoint4 = Offset(size.width * 0.2, size.height * 0.15);

    Path path = new Path()
      ..moveTo(size.width * 0.2, size.height * 0.15)
      ..quadraticBezierTo(
        controlpoint.dx,
        controlpoint.dy,
        endpoint.dx,
        endpoint.dy,
      )
      ..quadraticBezierTo(
        controlpoint2.dx,
        controlpoint2.dy,
        endpoint2.dx,
        endpoint2.dy,
      )
      ..quadraticBezierTo(
        controlpoint3.dx,
        controlpoint3.dy,
        endpoint3.dx,
        endpoint3.dy,
      )
      ..quadraticBezierTo(
        controlpoint4.dx,
        controlpoint4.dy,
        endpoint4.dx,
        endpoint4.dy,
      );

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}

class CustomDiamond extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.moveTo(size.width * 0.1000000, size.height * 0.4400000);
    path.quadraticBezierTo(size.width * 0.0243800, size.height * 0.5247000,
        size.width * 0.1000000, size.height * 0.6000000);
    path.quadraticBezierTo(size.width * 0.3550000, size.height * 0.8250000,
        size.width * 0.4400000, size.height * 0.9000000);
    path.quadraticBezierTo(size.width * 0.5140600, size.height * 0.9574800,
        size.width * 0.5800000, size.height * 0.9000000);
    path.quadraticBezierTo(size.width * 0.8200000, size.height * 0.6450000,
        size.width * 0.9000000, size.height * 0.5600000);
    path.quadraticBezierTo(size.width * 0.9500400, size.height * 0.5009400,
        size.width * 0.9000000, size.height * 0.4200000);
    path.quadraticBezierTo(size.width * 0.6450000, size.height * 0.1800000,
        size.width * 0.5600000, size.height * 0.1000000);
    path.quadraticBezierTo(size.width * 0.5029400, size.height * 0.0446800,
        size.width * 0.4200000, size.height * 0.1000000);
    path.quadraticBezierTo(size.width * 0.3400000, size.height * 0.1850000,
        size.width * 0.1000000, size.height * 0.4400000);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
