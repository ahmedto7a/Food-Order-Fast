import 'package:dominos/const/colors.dart';
import 'package:dominos/core/network_conction_model.dart';
import 'package:dominos/core/view_model/auth_viwe_model.dart';
import 'package:dominos/core/view_model/controll_viwe_model.dart';
import 'package:dominos/core/view_model/home_viwe_model.dart';
import 'package:dominos/viwe/home_screen.dart';
import 'package:dominos/viwe/login_signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';


class ControlView extends GetWidget<AuthViweModel> {


  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return (Get.put(AuthViweModel()).user == null)
          ? LoginSignupScreen()
          :GetBuilder<HomeViewModel>(
          init: HomeViewModel(),
           builder: (controller) => Scaffold(
           body:controller.currentScreen,
           bottomNavigationBar: Container(
        height: 75.sp,
        decoration: BoxDecoration(
          color: AppColor.Home,
          boxShadow: [
            BoxShadow(
              offset: Offset(0.3, 0.3),
              color: AppColor.Boxshadow.withOpacity(0.17),
              blurRadius: 22,
            ),
          ],
        ),

              child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            backgroundColor: AppColor.NavigationBar,
            selectedItemColor: AppColor.primary,
            unselectedItemColor: AppColor.secondary,
            currentIndex: controller.navigatorValue,
            onTap: (index) {
              controller.changeSelectedValue(index) ;

            },
            items: [
              buildBottomNavigationBarItem(
                  "assets/pro-home.png", 27.sp.toInt(), 0),
              buildBottomNavigationBarItem(
                  "assets/notification-icon-transparent-11.jpg",
                  27.sp.toInt(),
                  1),
              buildBottomNavigationBarItem(
                  "assets/icon-cart-shop.png", 27.sp.toInt(), 2),
            ],
          ),
        ),
      ),
      );
    });
  }


  BottomNavigationBarItem buildBottomNavigationBarItem(
      String image, int size, int index) {
    return BottomNavigationBarItem(
      icon: Padding(
        padding: EdgeInsets.only(top: 1.5.sp),
        child: Column(
          children: [
            ImageIcon(
              AssetImage(image),
              size: size.toDouble(),
            ),
            // SizedBox(
            //   height: 4.sp,
            // ),
            GetBuilder<HomeViewModel>(
              init: HomeViewModel(),
              builder: (controler)=> Center(
                child: Container(
                  height: 8.sp,
                  width: 8.sp,
                  decoration: BoxDecoration(
                      color: controler.navigatorValue == index
                          ? AppColor.primary
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(9.sp),
                      border:
                      Border.all(width: 0.6.sp, color: AppColor.NavigationBar)),
                ),
              ),
            ),
          ],
        ),
      ),
      label: "",
    );
  }

}


