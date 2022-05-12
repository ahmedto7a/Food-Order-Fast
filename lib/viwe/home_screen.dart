
import 'package:dominos/const/colors.dart';
import 'package:dominos/core/service/local_storge_user.dart';
import 'package:dominos/core/view_model/home_viwe_model.dart';
import 'package:dominos/viwe/drawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutterfire_ui/auth.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import '../widget/story/Storybutton.dart';
import 'detalis_screen.dart';

class HomeScreen extends StatelessWidget {

  Widget build(BuildContext context) {
     Get.put(LocalStorageUser());
     // TabController _tabController =TabController(length: 3, vsync: this);
    return  Scaffold(
      drawer: NavigationDrawerWidget(),
        appBar: AppBar(
          iconTheme: IconThemeData(color: AppColor.primary,size: 23.7.sp,),
          centerTitle: true,
          title: Text(
            "Food Ordaring",
            style:
            TextStyle(fontWeight: FontWeight.w900, color: AppColor.primary,fontSize: 21.7.sp),
          ),
          elevation: 0.0,
          backgroundColor: AppColor.Home,
        ),
        backgroundColor: AppColor.Home,
        body:  GetBuilder<HomeViewModel>(
          init: HomeViewModel(),
          builder: (controller)=> controller.loading.value==true ? Center(child: CircularProgressIndicator(color: AppColor.primary,))
              : SingleChildScrollView(
          child: AnimationLimiter(
              child: Column(
                  children: AnimationConfiguration.toStaggeredList(
                    duration: const Duration(milliseconds: 975),
                    childAnimationBuilder: (widget) => SlideAnimation(
                      horizontalOffset: 50.0,
                      child: FadeInAnimation(
                        child: widget,
                      ),
                    ),
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                          top: 15.sp,
                          left: 15.sp,
                        ),
                        child: SizedBox(
                          height: 50.sp,
                          width: double.infinity,
                          child: Text("Ready to Add your Story in our Domina Community !!",
                              style: TextStyle(
                                color: AppColor.textHomeColor,
                                fontWeight: FontWeight.w600,
                                fontSize: 17.sp,
                              )),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: SizedBox(
                          width: double.infinity,
                          height: 110.sp,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: [
                              StoryButton("me","https://firebasestorage.googleapis.com/v0/b/dominos-811a3.appspot.com/o/WhatsApp%20Image%202022-02-15%20at%209.26.35%20PM.jpeg?alt=media&token=d8f36b2d-aac9-467c-a797-51d5b2653d6c"),
                              StoryButton("Mo3","https://firebasestorage.googleapis.com/v0/b/dominos-811a3.appspot.com/o/2022-04-23%20(2).png?alt=media&token=af6de95c-b715-4e46-a25e-2a8cfe8a6e8b"),
                              StoryButton("Alaa","https://firebasestorage.googleapis.com/v0/b/dominos-811a3.appspot.com/o/2022-04-23%20(4).png?alt=media&token=cad09e79-7b35-45e5-be46-33422ba2f1ef"),
                              StoryButton("ZOOZ","https://firebasestorage.googleapis.com/v0/b/dominos-811a3.appspot.com/o/2022-04-23%20(8).png?alt=media&token=190c7041-f807-4187-b15b-e717f4d65395"),
                              StoryButton("Menaa","https://firebasestorage.googleapis.com/v0/b/dominos-811a3.appspot.com/o/2022-04-23%20(6).png?alt=media&token=ab31c1b4-8032-443d-a337-e36660c4f800"),
                              StoryButton("lola","https://firebasestorage.googleapis.com/v0/b/dominos-811a3.appspot.com/o/2022-04-23%20(4).png?alt=media&token=cad09e79-7b35-45e5-be46-33422ba2f1ef"),
                              StoryButton("Zezo","https://firebasestorage.googleapis.com/v0/b/dominos-811a3.appspot.com/o/2022-04-23%20(8).png?alt=media&token=190c7041-f807-4187-b15b-e717f4d65395"),
                              // StoryButton(),
                              // StoryButton(),
                              // StoryButton(),
                              // StoryButton(),
                              // StoryButton(),
                            ],
                          ),
                        ),
                      ),

                      SizedBox(
                        height: 30.sp,
                        width: double.infinity,
                        child: Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: 5.0.sp, left: 25.sp),
                              child: Text(
                                "Meal Category",
                                style:TextStyle(fontWeight: FontWeight.w800, color: AppColor.primary,fontSize: 20.sp),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 11.0.sp, left: 75.sp),
                              child: Text(
                                "See All",
                                style: TextStyle(
                                    color: AppColor.secondary,
                                    fontSize: 17.sp,
                                    fontWeight: FontWeight.w600),
                              ),
                            )
                          ],
                        ),
                      ),

                      /// /////////// Item Meal Category ////////////////////
                      /// /// /////////// Item Meal Category ////////////////////
                      /// /// /////////// Item Meal Category ////////////////////

                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Padding(
                                padding:
                                EdgeInsets.only(left: 20.0.sp, bottom: 5.sp, top: 2.sp),
                                child: Row(
                                  children: List.generate(
                                    controller.categories.length,
                                        (index) => Padding(
                                      padding: EdgeInsets.only(left: 3.sp, right: 9.sp),
                                      child: GestureDetector(
                                        onTap: () =>
                                          controller.changeSelectedCategory(index),
                                        child: Container(
                                          height: 50.sp,
                                          padding: EdgeInsets.symmetric(
                                            vertical: 5.sp,
                                            horizontal: 3.sp,
                                          ),
                                          margin: EdgeInsets.symmetric(
                                            vertical: 6.sp,
                                          ),
                                          decoration: BoxDecoration(
                                            color: controller.currentIndex == index
                                                ? AppColor.primary
                                                : Colors.white,
                                            borderRadius: BorderRadius.circular(23.sp),
                                            border: Border.all(
                                                width: 2.sp,
                                                color: controller.currentIndex == index
                                                    ? AppColor.primary
                                                    : Colors.white),
                                            boxShadow: [
                                              BoxShadow(
                                                offset: Offset(0.3, 0.3),
                                                color: AppColor.Boxshadow.withOpacity(0.40),
                                                blurRadius: 20,
                                              ),
                                            ],
                                          ),
                                          child: Row(
                                            children: [
                                              Container(
                                                decoration: BoxDecoration(
                                                  color: controller.currentIndex == index
                                                      ? AppColor.primary
                                                      : AppColor.Home,
                                                  borderRadius:
                                                  BorderRadius.circular(55.sp),
                                                ),
                                                child: Image.network(
                                                  controller.categories[index].image.toString(),
                                                  height: 36.sp,
                                                  width: 38.sp,
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsets.only(
                                                    right: 10.0.sp,
                                                    bottom: 3.sp,
                                                    left: 3.sp),
                                                child: Text(
                                                  controller.categories[index].name.toString(),
                                                  style: TextStyle(
                                                    color: controller.currentIndex == index
                                                        ? AppColor.Home
                                                        : AppColor.secondary,
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 15.sp,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),

                      /// /////////// Item Meal Category ////////////////////
                      /// /// /////////// Item Meal Category ////////////////////
                      /// /// /////////// Item Meal Category ////////////////////
                      ///  /// start from here ///////////// /// start from here ///////////// /// start from here /////////////

                      Padding(
                        padding: EdgeInsets.only(top:8.0.sp,),
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
                          itemCount: controller.products.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: (){
                                Get.to(DetailesScreen(productModel: controller.products[index]));
                              },
                              child: Stack(
                                clipBehavior: Clip.none,
                                alignment: Alignment.center,
                                children: [
                                  Positioned(
                                    top:30.sp,
                                    bottom: -1.sp,
                                    child: Card(
                                      color: AppColor.primary,
                                      elevation: 8,
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
                                          mainAxisAlignment: MainAxisAlignment.end,
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.only(top: 9.0.sp),
                                              child: Text(
                                                "${controller.products[index].name}",
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
                                                    "${controller.products[index].time}\nmin",
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
                                                 child: GestureDetector(

                                                        behavior: HitTestBehavior.translucent,
                                                   child: Icon(Icons.reply_all_rounded,
                                                            size: 25.sp,
                                                            color: AppColor.Home),
                                                      ),
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
                                      tag: "location-image${controller.products[index].image}",
                                      child: Image.network(
                                        "${controller.products[index].image}",
                                        width: 80.sp,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),


                      // Container(
                      //   child: TabBar(
                      //     tabs: [
                      //       Tab(text:("hhhhh"),),
                      //       Tab(text:("hzmhzm"),),
                      //       Tab(text:("AAAAAA"),),
                      //
                      //     ],
                      //   ),
                      // ),
                      // Container(
                      //   child: TabBarView(
                      //     children: [
                      //       Text("Hi AAAA"),
                      //       Text("Hi mmmm"),
                      //       Text("Hi tttt"),
                      //
                      //     ],
                      //   ),
                      // ),
                    ],
                  ),
                ),
              ),
        ),
          ),
    );
  }

}

