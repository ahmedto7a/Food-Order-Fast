import 'package:dominos/const/colors.dart';
import 'package:dominos/core/view_model/cart_viwe_model.dart';
import 'package:dominos/widget/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:get/route_manager.dart';
import 'package:sizer/sizer.dart';

import 'checkout_screen.dart';


class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Get.put(CartViewModel());
    return Scaffold(
      // backgroundColor: AppColor.Home,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Cart",style: TextStyle(fontSize: 23.sp,color: AppColor.primary),),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.white,
      ),
      body: GetBuilder<CartViewModel>(
        init: CartViewModel(),
        builder: (controller) => controller.cartProducts.isEmpty
            ? Center(
          child: ColumnnSVG(),
        )
            : Column(
          children: [
               SizedBox(
             height: 10.sp,
             ),
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: controller.cartProducts.length,
                itemBuilder: (BuildContext, int index) {
                  return Padding(
                    padding: EdgeInsets.all(10.0.sp),
                    child: Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: AppColor.Home,
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(color: AppColor.primary),
                          ),
                          height: 100.sp,
                          width: double.infinity,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                    left: 10.sp, right: 10.sp),
                                child: CircleAvatar(
                                  child: Image.network(
                                    controller.cartProducts[index].image,
                                    width: 80.sp,
                                  ),
                                  backgroundColor: Colors.white,
                                  minRadius: 3,
                                ),
                              ),
                              Column(
                                crossAxisAlignment:
                                CrossAxisAlignment.center,
                                mainAxisAlignment:
                                MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    controller.cartProducts[index].name,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20.sp,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  Text(
                                    "${controller.cartProducts[index].price.toString()} L.E",
                                    style: TextStyle(
                                        color: AppColor.primary,
                                        fontSize: 19.sp,
                                        fontWeight: FontWeight.w800),
                                  ),

                                  /// counter /////////////////////////////////////////
                                  /// counter /////////////////////////////////////////
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius:
                                      BorderRadius.circular(20.sp),
                                      color: Colors.white,
                                    ),
                                    width: 100.sp,
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.center,
                                      children: [
                                        GestureDetector(

                                          child: Icon(
                                            Icons.add,
                                            color: Colors.black,

                                          ),
                                          onTap: ()=>controller.increaseQuantity(index),
                                        ),
                                        SizedBox(
                                          width: 18.sp,
                                        ),
                                        Text(
                                          "${controller.cartProducts[index].quantity}",
                                          style: TextStyle(
                                              color: AppColor.primary,
                                              fontSize: 16.sp,
                                              fontWeight:
                                              FontWeight.bold),
                                        ),
                                        SizedBox(
                                          width: 18.sp,
                                        ),
                                        Container(
                                          padding: EdgeInsets.only(
                                              bottom: 10.sp),
                                          child: GestureDetector(
                                            child: Icon(
                                              Icons.minimize,
                                              color: Colors.black,
                                            ),
                                            onTap: () {
                                              controller.decreaseQuantity(index);
                                              // print("${controller.decreaseQuantity(index)}");
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),

                                  /// counter /////////////////////////////////////////
                                  /// counter /////////////////////////////////////////
                                ],
                              ),
                            ],
                          ),
                        ),
                        Align(
                          alignment: Alignment.topRight,
                          child: GestureDetector(
                            onTap:(){
                              controller.removeProduct(controller.cartProducts[index].productId);
                            },
                            child: Container(
                              padding: EdgeInsets.all(10.sp),
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: AppColor.primary),
                              child: Icon(
                                Icons.delete_sweep_sharp,
                                color: Colors.white,
                                size: 25.sp,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            // Expanded(child: SizedBox()),
            Material(
              elevation: 5,
              child: Container(
                width: double.infinity,
                height: 70.sp,
                color: Colors.white24,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(text: "ToTal",color: Colors.black54,fontSize: 18.sp,fontWeight: FontWeight.w500,),
                          SizedBox(height: 4.sp,),
                          GetBuilder<CartViewModel>(
                              init: CartViewModel(),
                              builder:(controller)=> CustomText(text:"${controller.totalPrice} L.E",fontSize: 14.sp,color:AppColor.primary,))
                        ],
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.all( 12.0),
                      child: GestureDetector(
                        onTap: (){
                          Get.to(CheckOutScreen());
                        },
                        child: Container(
                          decoration: BoxDecoration(color: AppColor.primary,
                              borderRadius: BorderRadius.circular(19.sp)
                          ),

                          height: 52.sp,
                          width: 128.sp,
                          child: Center(child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("Check Out",style: TextStyle(fontSize: 18.sp,color: AppColor.Home,fontWeight: FontWeight.w700),),
                          )),
                        ),
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

  Widget ColumnnSVG() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          "assets/undraw_empty_cart.svg",
          width: 200,
          height: 200,
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          "Cart Empty",
          style: TextStyle(fontSize: 30),
        ),
      ],
    );
  }
}


//
//
