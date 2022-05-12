import 'package:dominos/const/colors.dart';
import 'package:dominos/core/view_model/auth_viwe_model.dart';
import 'package:dominos/core/view_model/profile_viwe_model.dart';
import 'package:dominos/viwe/profile_screen.dart';
import 'package:dominos/viwe/user_scren.dart';
import 'package:dominos/widget/item_drawer.dart';
import 'package:dominos/widget/switch.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'about_screen.dart';
import 'fav_screen.dart';


class NavigationDrawerWidget extends StatelessWidget {

  // late final List<ProductModel> favProudect;
  //  NavigationDrawerWidget({required this.favProudect});


  final padding = const EdgeInsets.symmetric(horizontal: 20);

   const NavigationDrawerWidget({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    // final name = 'Ahmed To7a';
    // final email = 'Oh_Devolper@AGMADTo9a.COM ';
    // final urlImage =
    //     'https://firebasestorage.googleapis.com/v0/b/dominos-811a3.appspot.com/o/WhatsApp%20Image%202022-02-15%20at%209.26.35%20PM.jpeg?alt=media&token=d8f36b2d-aac9-467c-a797-51d5b2653d6c';

    return Drawer(
      child: Material(
        color:AppColor.Home,
        child: GetBuilder<ProfileViewModel>(
          init: Get.put(ProfileViewModel()),
          builder: (controller)=>ListView(
            children: <Widget>[
              buildHeader(
                pic: "${controller.currentUser?.pic}",
                name: "${controller.currentUser?.name}",
                email: "${controller.currentUser?.email}",
                onClicked: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => UserPage(
                    name: "${controller.currentUser?.name}",
                    urlImage: "${controller.currentUser?.pic}",
                  ),
                )),
              ),
              Container(
                padding: padding,
                child: AnimationLimiter(
                  child:Column(
                    children: AnimationConfiguration.toStaggeredList(
                    duration: const Duration(milliseconds: 1030),
                    childAnimationBuilder: (widget) => SlideAnimation(
                      horizontalOffset: 50.0,
                      child: SlideAnimation(
                        child: widget,
                      ),
                    ),
                    children: [
                      const SizedBox(height: 14),
                         Stack(
                          children: [
                             ItemAccount(
                              // onPressed:()=> Switch(value: _light,onChanged: (toggle{}),),
                              text: 'Dark mode',
                              icon: Icons.dark_mode_rounded,
                              colorIcon: Color(0xff051E2F),
                              iconn: Icons.wifi_protected_setup_rounded,
                                onPressed: () => selectedItem(context, 0),

                              // Switch(value: ,onChanged: (){}),

                            ),

                          ],
                        ),

                      const SizedBox(height: 14),
                      const Padding(
                        padding: EdgeInsets.all(12.0),
                        child: Divider(thickness: 1.5, color: AppColor.primary),
                      ),
                      ItemAccount(
                        text: 'Profile setting',
                        icon: Icons.person,
                        colorIcon: const Color(0xff01C58C),
                        onPressed: () => selectedItem(context, 1), iconn:   Icons.navigate_next_rounded
                        ,
                      ),
                      const SizedBox(height: 14),
                      // buildMenuItem(
                      //   text: 'Favourites',
                      //   icon: Icons.favorite_border,
                      //   onClicked: () => selectedItem(context, 1),
                      // ),
                      ItemAccount(
                        iconn: Icons.wifi_protected_setup_rounded,
                        text: 'My Favourites',
                        icon: Icons.favorite,
                        colorIcon: Colors.redAccent,
                        onPressed: () => selectedItem(context, 2),
                      ),
                      const SizedBox(height: 14),
                      // buildMenuItem(
                      //   text: 'About US',
                      //   icon: Icons.category,
                      //   onClicked: () => selectedItem(context, 2),
                      // ),
                      ItemAccount(
                        iconn:   Icons.navigate_next_rounded,
                        text: 'About US',
                        icon: Icons.description_outlined,
                        colorIcon: const Color(0xff4772e6),
                        onPressed: ()=>selectedItem(context, 3),
                      ),
                      const SizedBox(height: 14),
                      // buildMenuItem(
                      //   text: 'Setting',
                      //   icon: Icons.settings,
                      //   onClicked: () => selectedItem(context, 3),
                      // ),

                      const SizedBox(height: 14),
                      ItemAccount(

                        text: 'Who Developed ',
                        icon: Icons.help_outline,
                        colorIcon: Colors.lightBlueAccent,
                        onPressed: ()=>{}, iconn:   Icons.navigate_next_rounded,
                      ),

                      /// Log OUT Button////////////////////////////////////
                      /// /// Log OUT Button////////////////////////////////////
                      /// /// Log OUT Button////////////////////////////////////
                      const SizedBox(height: 20),
                      const Divider(thickness: 1.5, color: AppColor.primary),
                      const SizedBox(height: 46),
                      GetBuilder<AuthViweModel>(
                        init: AuthViweModel(),
                        builder: (controller)=>
                            Padding(
                              padding:  EdgeInsets.only(bottom: 11.0.sp,top: 2.sp),
                              child: ItemAccount(
                                iconn:  Icons.outbond_outlined,
                                text: 'Sign Out',
                                icon: Icons.power_settings_new_sharp,
                                colorIcon: const Color(0xffF02849),
                                 onPressed:  () => controller.signOut(),
                        ),
                            ),
                      ),
                    ],
                  ),
                ),
              ),
              ),
          ],
          ),
        ),
      ),
    );
  }

  Widget buildHeader({
    required String pic,
    required String name,
    required String email,
    required VoidCallback onClicked,
  }) =>
      GetBuilder<ProfileViewModel>(
        init: ProfileViewModel(),
        builder:(controller)=> InkWell(
          onTap: onClicked,
          child: Container(
            padding: padding.add(const EdgeInsets.symmetric(vertical: 40)),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(radius: 30.sp, backgroundImage:

                  NetworkImage("${controller.currentUser?.pic.toString()}"),
                  ),
                  SizedBox(height: 17.sp),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: TextStyle(fontSize: 17.sp, color:  Colors.black,fontWeight: FontWeight.w600,),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        email,
                        style: TextStyle(fontSize: 11.4.sp, color: Colors.black,fontWeight: FontWeight.w600,),
                      ),
                    ],
                  ),

                  // CircleAvatar(
                  //   radius: 24.sp,
                  //   backgroundColor: AppColor.primary,
                  //   child: Icon(Icons.add_comment_outlined, color: AppColor.secondary),
                  // )
                ],
              ),
            ),
          ),
        ),
      );


  Widget buildMenuItem({
    required String text,
    required IconData icon,
    VoidCallback? onClicked,
  }) {
    const color = AppColor.primary;
    const hoverColor = Colors.black;

    return Container(
      height: 40.sp,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.sp),
        border: Border.all(color: AppColor.primary),
      ),
      child: ListTile(
        leading: Icon(icon, color: color,size: 24.sp,),
        title: Text(text, style: TextStyle(color: color,fontSize: 16.sp)),
        hoverColor: hoverColor,
        onTap: onClicked,
      ),
    );
  }

  Widget ColumnnSVG() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          "assets/undraw_male_avatar_323b.svg",
          width: 200,
          height: 200,
        ),
        const SizedBox(
          height: 20,
        ),
        const Text(
          "Cart Empty",
          style: TextStyle(fontSize: 30),
        ),
      ],
    );
  }


  void selectedItem(BuildContext context, int index) {
    Navigator.of(context).pop();

    switch (index) {
      case 0:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) =>  Container(color:AppColor.primary,child: GetSnackBar(backgroundColor: Colors.white,borderRadius: 70,messageText: Text("يااالهوي Dark mode \n قريب , استنونا ",style: TextStyle(color: Colors.black,fontSize: 60.sp),) ,)),
        ));
        break;
      case 1:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => ProfilScreen(),
        ));
        break;
      case 2:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) =>  FavouritesPage(),
              //Container(color:AppColor.primary,child: GetSnackBar(backgroundColor: Colors.white,borderRadius: 70,messageText: Text("يااالهوي حتي انتي قريب , استنونا ",style: TextStyle(color: Colors.red,fontSize: 60.sp),) ,)),
        ));
        break;
      case 3:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => AboutScreen(),
        ));
        break;

      // case 4:
      //   Navigator.of(context).push(MaterialPageRoute(
      //     builder: (context) => AboutMe(),
      //   ));
      //   break;

    }
  }

}

