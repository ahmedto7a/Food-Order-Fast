import 'package:dominos/const/colors.dart';
import 'package:dominos/core/view_model/cart_viwe_model.dart';
import 'package:dominos/core/view_model/checkout_viwe_model.dart';
import 'package:dominos/widget/button.dart';
import 'package:dominos/widget/custom_text_form_field.dart';
import 'package:dominos/widget/custom_text_two.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';


class SummaryDelevery extends StatelessWidget {
  final _formKeysummary = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return
      SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(right: 3.w, left: 3.w, bottom: 5.h),
          child: Form(
            key: _formKeysummary,
            child: GetBuilder<CheckoutViewModel>(
              init: Get.find<CheckoutViewModel>(),
              builder: (controller) => Column(
                children: [
                  ListViewProducts(),
                  SizedBox(
                    height: 3.4.h,
                  ),
                  CustomTextFormField(
                    title: 'Street',
                    hintText: '21, Tahrir Street',
                    validatorFn: (value) {
                      if (value!.isEmpty || value.length < 4)
                        return 'Please enter valid street name.';
                    },
                    onSavedFn: (value) {
                      controller.street = value;
                    },
                  ),
                  SizedBox(
                    height: 3.4.h,
                  ),
                  CustomTextFormField(
                    title: 'City',
                    hintText: 'Downtown Cairo',
                    validatorFn: (value) {
                      if (value!.isEmpty || value.length < 4)
                        return 'Please enter valid city name.';
                    },
                    onSavedFn: (value) {
                      controller.city = value;
                    },
                  ),
                  SizedBox(
                    height: 3.4.h,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: CustomTextFormField(
                          title: 'State',
                          hintText: 'Cairo',
                          validatorFn: (value) {
                            if (value!.isEmpty || value.length < 4)
                              return 'Please enter valid state name.';
                          },
                          onSavedFn: (value) {
                            controller.state = value;
                          },
                        ),
                      ),
                      SizedBox(
                        width: 16.w,
                      ),
                      Expanded(
                        child: CustomTextFormField(
                          title: 'Country',
                          hintText: 'Egypt',
                          validatorFn: (value) {
                            if (value!.isEmpty || value.length < 4)
                              return 'Please enter valid city name.';
                          },
                          onSavedFn: (value) {
                            controller.country = value;
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height:7.h,
                  ),
                  CustomTextFormField(
                    title: 'Phone Number',
                    hintText: '+20123456789',
                    keyboardType: TextInputType.phone,
                    validatorFn: (value) {
                      if (value!.isEmpty || value.length < 10)
                        return 'Please enter valid number.';
                    },
                    onSavedFn: (value) {
                      controller.phone = value;
                    },
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  GetBuilder<CartViewModel>(
                    init: CartViewModel(),
                    builder: (con)=>CustomButton(
                      txtcolor: AppColor.secondary,
                      color: AppColor.primary,
                      text: 'SUBMIT',
                          onPreesed: () async {
                        if (_formKeysummary.currentState!.validate()) {
                          _formKeysummary.currentState!.save();
                          await controller.addCheckoutDeleveryToFireStore() ;
                          /// add cart sub coluction from here
                          await con.addCartDeleveryToFireStore();
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
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
            height: 29.h,
            child: ListView.separated(
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
            height: 0.4.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomTextt(
                text: 'TOTAL: ',
                size: 25,
                color: Colors.grey,
              ),
              CustomTextt(
                text: '${controller.totalPrice.toString()} L.E',
                size: 24.5,
                fontWeight: FontWeight.bold,
                color: AppColor.primary,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
