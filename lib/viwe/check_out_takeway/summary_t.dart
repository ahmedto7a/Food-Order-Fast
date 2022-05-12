import 'package:dominos/const/colors.dart';
import 'package:dominos/core/view_model/cart_viwe_model.dart';
import 'package:dominos/core/view_model/checkout_viwe_model.dart';
import 'package:dominos/widget/button.dart';
import 'package:dominos/widget/custom_text_two.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';


class SummaryTackaWay extends StatelessWidget {
  // final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return ListViewProducts();
    // SingleChildScrollView(
    //   child: Padding(
    //     padding: EdgeInsets.only(right: 3.w, left: 3.w, bottom: 5.h),
    //     child: GetBuilder<CheckoutViewModel>(
    //       init: Get.find<CheckoutViewModel>(),
    //       builder: (controller) => Column(
    //         children: [
    //           Text("DFGHNJMKL;SLKS",style: TextStyle(color: Colors.black),),
    //           // ListViewProducts(),
    //           SizedBox(
    //             height: 5.4.h,
    //           ),
    //           // CustomButton(
    //           //   txtcolor: AppColor.Home,
    //           //   color: AppColor.primary,
    //           //   text: '',
    //           //   onPreesed: () async {
    //           //     if (_formKey.currentState!.validate()) {
    //           //       _formKey.currentState!.save();
    //           //       await controller.addCheckoutToFireStore();
    //           //     }
    //           //   },
    //           // ),
    //         ],
    //       ),
    //     ),
    //   ),
    // );
  }
}

class ListViewProducts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartViewModel>(
      builder: (controller) => Column(
        children: [
          Container(
            // color: Colors.redAccent,
            height: 33.h,
            child: ListView.separated(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: controller.cartProducts.length,
              itemBuilder: (context, index) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [

                    /// Image////////////////
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4.sp),
                        // color: Colors.grey,
                      ),
                      height: 21.h,
                      width: 29.4.w,
                      child: Image.network(
                        controller.cartProducts[index].image,
                        fit: BoxFit.contain,
                      ),
                    ),
                    SizedBox(height: 2.sp,),
                    CustomTextt(
                      text: controller.cartProducts[index].name,
                      size: 25,
                    ),
                    SizedBox(height: 2.sp,),
                    CustomTextt(
                      text:
                      '${controller.cartProducts[index].price} x ${controller.cartProducts[index].quantity} L.E',
                      size: 17.5,
                      color: AppColor.primary,
                    ),
                  ],
                );
              },
              separatorBuilder: (context, index) {
                return SizedBox(
                  width: 5.w,
                );
              },
            ),
          ),
          SizedBox(
            height: 3.8.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomTextt(
                text: 'TOTAL: ',
                size: 22,
                color: Colors.grey,
              ),
              CustomTextt(
                text: '${controller.totalPrice.toString()} L.E',
                size: 20.5,
                fontWeight: FontWeight.bold,
                color: AppColor.primary,
              ),
              SizedBox(height: 50,),
            ],
          ),
        ],
      ),
    );
  }
}
