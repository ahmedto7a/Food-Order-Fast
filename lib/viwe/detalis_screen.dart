
import 'package:dominos/const/colors.dart';
import 'package:dominos/core/view_model/cart_viwe_model.dart';
import 'package:dominos/model/caart_mode.dart';
import 'package:dominos/model/proudect_model.dart';
import 'package:dominos/widget/fooddetail/custom_app_bar_detail_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/snackbar/snackbar.dart';
import 'package:sizer/sizer.dart';
import '../core/view_model/fav_viwe_model.dart';
import '../model/fav_model.dart';
import 'control_viwe.dart';


class DetailesScreen extends StatelessWidget {
   final ProductModel productModel;
    DetailesScreen({ required this.productModel});


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColor.primary,
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    height: 230.sp,
                    child: Stack(
                      children: [
                        Column(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Container(),
                            ),
                            Expanded(
                              flex: 1,
                              child: Container(
                                decoration: BoxDecoration(

                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(50.sp),
                                    topRight: Radius.circular(50.sp),
                                  ),
                                  color: AppColor.Home,
                                ),
                              ),
                            )
                          ],
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Container(
                            margin: EdgeInsets.all(15.sp),
                            width: 220.sp,
                            height: 220.sp,
                            decoration: BoxDecoration(

                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.white.withOpacity(0.3),
                                    offset: Offset(-1, 0),
                                    blurRadius: 10,
                                  )
                                ]),
                            ///   //////////////////////////////////////////////
                            ///   //////////////////////////////////////////////
                            ///   //////////////////////////////////////////////
                            ///   //////////////////////////////////////////////
                            ///   //////////////////////////////////////////////
                            ///   //////////////////////////////////////////////
                            ///   //////////////////////////////////////////////


                                child: Hero(
                                tag: "location-image${productModel.image}",
                                child: Image.network(
                                  "${productModel.image}",
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),

                        /// Icon to backe and FAv///////////////////////////////////////
                        Positioned(
                          top: 20.sp,
                          child:
                          GetBuilder<FavViewModel>(
                            init: FavViewModel(),
                            builder: (controller)=>
                             CustomAppBar(
                                leftIcon: Icons.arrow_back,
                                leftCallback: () => Get.off(
                                  ControlView(),
                                ),
                                onTap: () {
                                  Get.snackbar(
                                    "",
                                   " ",
                                    titleText:Text(" ${productModel.name} Add your Fav ",style: TextStyle(color: Colors.white,fontSize: 22,fontWeight: FontWeight.w700),),
                                    // titleText:Text("     Will be Soon  ",style: TextStyle(color: Colors.white,fontSize: 22,fontWeight: FontWeight.w700),),
                                    backgroundColor: Colors.black26,
                                    borderWidth: 2.5,
                                    colorText:Colors.white,
                                    margin: EdgeInsets.all(45),
                                    borderColor:  Colors.redAccent,
                                    icon: Padding(
                                      padding: const EdgeInsets.only(left: 17.0),
                                      child: const Icon(Icons.wifi_protected_setup, color: Colors.white,size: 33,),
                                    ),
                                    snackPosition: SnackPosition.TOP,
                                  );
                                  controller.addProduct(

                                    FavModel(
                                        name: "${productModel.name}",
                                        image: "${productModel.image}",
                                        time: "${productModel.time}",
                                        productId: "${productModel.productId}"
                                    ),
                                  );
                                },
                               icon: Icon(Icons.favorite , color:Colors.redAccent,size: 24.sp,),

                              ),
                          ),
                          ),
                      ],
                    ),
                  ),

                  /// name meal and details//////////////////////////////////////
                  /// /// name meal and details/////////////////////////////////////////
                  Container(
                    padding: EdgeInsets.only(top: 2.sp),
                    color: AppColor.Home,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Text(
                            "${productModel.name}",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 22.sp,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 5.sp,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            _buildIconText(Icons.access_time_outlined,
                                Colors.blue, "${productModel.time} min"),
                            Column(
                              children: List.generate(
                                6,
                                    (index) => Container(
                                  height: 2.sp,
                                  width: 2.sp,
                                  margin: EdgeInsets.only(bottom: 2),
                                  decoration: BoxDecoration(
                                      color: AppColor.secondary,
                                      borderRadius:
                                      BorderRadius.circular(2.sp)),
                                ),
                              ),
                            ),
                            _buildIconText(
                              Icons.local_fire_department_outlined,
                              Colors.red,
                              "${productModel.kcal}",
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 17.sp,
                        ),

                        /// decortion ///////////////////////////////
                        ///  ///////////////////////////////////////////
                        Container(
                          width: double.maxFinite,
                          height: 40.sp,
                          child: Stack(
                            children: [
                              Align(
                                alignment: Alignment(-0.5, 0),
                                child: Container(
                                  height: double.maxFinite,
                                  width: 150.sp,
                                  decoration: BoxDecoration(
                                    color: Colors.grey.withOpacity(0.1),
                                    borderRadius: BorderRadius.circular(30.sp),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 8.0,top: 12.0),
                                    child: Text(
                                      ' ${productModel.price} L.E',
                                      style: TextStyle(
                                          fontSize: 19.sp,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ),

                              /// counter and quntaty///////////////////////////////////////
                              /// /// counter and quntaty///////////////////////////////////////

                              Align(
                                alignment: Alignment(0.1, 0),
                                child: Container(
                                  height: double.maxFinite,
                                  width: 100.sp,
                                  decoration: BoxDecoration(
                                    color: AppColor.primary,
                                    borderRadius: BorderRadius.circular(30.sp),
                                  ),
                                  child: GestureDetector(
                                    onTap: (){
                                      Get.snackbar(
                                        "",
                                        "     Add to cart to order ",
                                        titleText:Text("   Now We See You",style: TextStyle(color: Colors.black,fontSize: 22,fontWeight: FontWeight.w700),),

                                        backgroundColor: AppColor.Boxshadow,
                                        borderWidth: 3.5,colorText: Colors.black,
                                        margin: EdgeInsets.all(20),
                                        borderColor: AppColor.secondary,
                                        icon: Padding(
                                          padding: const EdgeInsets.all(18.0),
                                          child: Icon(Icons.remove_red_eye_rounded, color: Colors.black),
                                        ),
                                        snackPosition: SnackPosition.TOP,
                                      );

                                    },
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(bottom: 10.0),
                                          child: Icon(Icons.remove_red_eye,color: Colors.black,size: 25.sp,),
                                        ),
                                        SizedBox(width: 2.sp,),
                                        Container(
                                          // height: 60.sp,
                                          width: 30.sp,
                                          padding: EdgeInsets.all(12.sp),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(90),bottomRight:Radius.circular(90)),
                                              // shape: BoxShape.circle,
                                              color: Colors.black),
                                          child: Text(
                                            "1",
                                            style: TextStyle(

                                              color: Colors.white,
                                                fontSize: 15.sp,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        SizedBox(width: 2.sp,),

                                        Padding(
                                          padding: const EdgeInsets.only(bottom: 10.0),
                                          child: Icon(Icons.remove_red_eye,color: Colors.black,size: 25.sp,),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                        Container(
                          color: AppColor.Home,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                EdgeInsets.only(top: 2.0.sp, left: 13.sp),
                                child: Text(
                                  'About ',
                                  style: TextStyle(
                                      fontSize: 28,
                                      fontWeight: FontWeight.w600),
                                ),

                              ),
                              SizedBox(height: 22.sp,),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(9.sp),
                                  color: Colors.white,
                                  border: Border.all(color: Colors.white),
                                ),
                                child: Padding(
                                  padding:  EdgeInsets.all(8.0),
                                  child: Text(
                                    "${productModel.description}",
                                    style: TextStyle(
                                        letterSpacing: 0.3,
                                         wordSpacing: 0.5,
                                        color: Colors.blueGrey,
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w600
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 220.sp,),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),

                ],
              ),
            ),

          ],
        ),
        ///   /////////////////////////////////////////////

        /// FloutActionButton/////////////////////////////////////////////
        /// FloutActionButton//////////////////////////////////////////
        floatingActionButton: Container (
          width: 130.sp,
          height: 40.sp,
          child: GetBuilder<CartViewModel>(
            init: CartViewModel(),
            builder:(controller)=> RawMaterialButton(
              onPressed: (){
                Get.snackbar(
                "The ${productModel.name} Adedd to cart ",
                "Go to Cart",
                  backgroundColor: AppColor.Home,
                  borderWidth: 2.5,colorText: Colors.black,
                  margin: EdgeInsets.all(20),
                  borderColor: AppColor.primary,
                  icon: const Icon(Icons.library_add_check, color: AppColor.primary),
                snackPosition: SnackPosition.BOTTOM,
                );
                controller.addProduct(
                  CartModel(
                    name: "${productModel.name}",
                    image: "${productModel.image}",
                    price: "${productModel.price}",
                    productId: "${productModel.productId}"
                ),
                );
              },

              fillColor: AppColor.primary,
              shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.sp)),
              elevation: 2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [

                  Container(
                    height: 40,
                    width: 39,
                    decoration: BoxDecoration(color: Colors.white,
                      borderRadius: BorderRadius.circular(50.sp),
                    ),
                    child: Icon(
                      Icons.shopping_bag_outlined,
                      color: Colors.black,
                      size: 24.sp,
                    ),
                  ),
                  Text("Add Cart",style: TextStyle(fontSize: 17.sp,fontWeight: FontWeight.bold,color: AppColor.secondary),),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  _buildIconText(IconData icon, Color color, String text) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Icon(
            icon,
            color: color,
          ),
          Text(
            text,
            style: const TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}

