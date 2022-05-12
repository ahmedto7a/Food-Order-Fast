import 'package:dominos/const/colors.dart';
import 'package:dominos/core/view_model/fav_viwe_model.dart';
import 'package:dominos/core/view_model/home_viwe_model.dart';
import 'package:dominos/viwe/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import 'detalis_screen.dart';

class FavouritesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      centerTitle: true,
      elevation: 0.0,
      backgroundColor: AppColor.primary,
    ),
    body: SingleChildScrollView(
      child: Stack(
          children: [
      CustomPaint(
      child: Container(
        child:  Padding(
          padding:  EdgeInsets.only(left:35.0.sp,right: 35.sp,top: 39.sp),
          child: Column(
            children: [
              Text("Favourites",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 29.sp,color: AppColor.Home),
              ),
              Divider(thickness: 1.3,color:  AppColor.Home,endIndent: 27.8.sp,indent: 27.8.sp,)
            ],
          ),
        ),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      ),
      painter: HeaderCurvedContainer(),
  ),
         GetBuilder< FavViewModel>(
          init: FavViewModel(),
              builder: (controller)=>  Padding(
                  padding: EdgeInsets.only(top:MediaQuery.of(context).size.height/4,),
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisSpacing: 17.0.sp,
                      crossAxisCount: 2,
                      // childAspectRatio: 0.9.sp,
                      crossAxisSpacing: 1.0,
                    ),

                    /// start from here /////////////
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: controller.favProudect.length,
                    itemBuilder: (context, index) {
                      return GetBuilder<HomeViewModel>(
                        init: HomeViewModel(),
                        builder: (_)=>GestureDetector(
                          onTap: (){
                            Get.to( DetailesScreen(productModel: _.products[index]),
                            );
                          },
                          child: Stack(
                            clipBehavior: Clip.none,
                            alignment: Alignment.center,
                            children: [
                              Positioned(
                                top:30.sp,
                                bottom: -1.sp,
                                child: Card(

                                  color: Colors.white,
                                  elevation: 6,
                                  shadowColor:  AppColor.primary,
                                  shape: BeveledRectangleBorder(
                                    borderRadius: BorderRadius.circular(25.0),

                                  ),
                                  child: Container(
                                    height: 250.sp,
                                    width: 130.sp,

                                    padding: EdgeInsets.only(
                                      left: 8.sp,
                                    ),
                                    child: Column(
                                      // crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(top: 9.0.sp),
                                          child: Text(
                                            "${controller.favProudect[index].name}",
                                            style: TextStyle(
                                                color: AppColor.secondary,
                                                fontWeight: FontWeight.w900,
                                                fontSize: 20.sp),
                                          ),
                                        ),
                                        /// Row  for time and buttom Add /////////////////////////////////////
                                        /// /// time and buttom Add /////////////////////////////////////
                                        /// /// time and buttom Add /////////////////////////////////////
                                        Row(
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  left: 15.0.sp, right: 20.sp),
                                              child: Text(
                                                "${controller.favProudect[index].time}\nmin",
                                                style: TextStyle(
                                                    fontSize: 13.sp,
                                                    fontWeight: FontWeight.w600,
                                                    color: AppColor.secondary),
                                              ),
                                            ),
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
                                            Expanded(child: SizedBox()),
                                            /// buttom Add /////////////////////////////////////
                                            Container(
                                              height: 40.sp,
                                              width: 42.sp,
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(20.sp),
                                                  bottomRight: Radius.circular(20.sp),
                                                ),
                                                border: Border.all(
                                                    width: 2.sp,
                                                    color: AppColor.secondary
                                                ),
                                                //color: AppColor.secondary,
                                                color: AppColor.secondary,
                                              ),
                                              child: Icon(
                                                  Icons.favorite,color: Colors.redAccent,),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 70.sp,
                                child: Hero(
                                  tag: "location-image${controller.favProudect[index].image}",
                                  child: Image.network(
                                    "${controller.favProudect[index].image}",
                                    width: 80.sp,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
  ],
  ),
    ),
  );
}

class FavSoon extends StatelessWidget {
  const FavSoon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child:Text("Favourit Soon"),
    );
  }
}
