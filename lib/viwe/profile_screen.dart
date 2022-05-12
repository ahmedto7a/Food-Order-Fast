
import 'package:dominos/const/colors.dart';
import 'package:dominos/core/view_model/profile_viwe_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class ProfilScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: AppColor.primary,
      ),
      body: GetBuilder<ProfileViewModel>(
        init: Get.put(ProfileViewModel()),
        builder: (controller)=> SingleChildScrollView(
          child: Stack(
            children: [
              CustomPaint(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  // child: Image.asset("assets/login_bg.png"),
                ),
                painter: HeaderCurvedContainer(),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  children: [

                    SizedBox(
                      height: 50.sp,
                    ),
                    ClipOval(
                      child: Stack(
                        children: [
                          ///
                          /// /// This image for user///////////////////////////////////////
                          /// This image for user///////////////////////////////////////
                          Container(
                            height: 160.sp,
                            width: 160.sp,
                            child: Image.network(
                              "${controller.currentUser!.pic}",
                              fit: BoxFit.cover,
                            ),
                          ),
                          /// This image for user///////////////////////////////////////
                          /// This image for user///////////////////////////////////////

                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.edit,color: AppColor.secondary,),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          "My information",
                          style: TextStyle(color: AppColor.secondary),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Hi ${controller.currentUser!.name}",
                      style: TextStyle(
                        color: AppColor.secondary,
                        fontSize: 14.sp,
                      ),
                    ),

                    SizedBox(
                      height: 30.sp,
                    ),

                    SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                        CustomFormImput(
                          icon: Icons.account_circle_rounded,
                          label: "${controller.currentUser!.name}",
                           value: "${controller.currentUser!.name}",
                        ),
                        SizedBox(
                          height: 17.sp,
                        ),
                        CustomFormImput(

                          icon: Icons.email_outlined,

                          label: "${controller.currentUser!.email}",
                          value: "${controller.currentUser!.email}",
                        ),
                        SizedBox(
                          height: 13.sp,
                        ),
                        // CustomFormImput(
                        //   icon: Icons.phone,
                        //   label: "Mobile No",
                        //   value: "emiliaclarke@email.com",
                        // ),
                        // SizedBox(
                        //   height: 13.sp,
                        // ),
                        // CustomFormImput(
                        //   icon: Icons.home,
                        //   label: "Address",
                        //   value: "No 23, 6th Lane, Colombo 03",
                        // ),
                        // SizedBox(
                        //   height: 13.sp,
                        // ),
                        // CustomFormImput(
                        //   icon: Icons.password,
                        //   label: "Password",
                        //   value: "Emilia Clarke",
                        // ),
                        // SizedBox(
                        //   height: 13.sp,
                        // ),
                        // CustomFormImput(
                        //   icon: Icons.password,
                        //   label: "Confirm Password",
                        //   value: "Emilia Cla0rke",
                        // ),
                        // SizedBox(
                        //   height: 13.sp,
                        // ),
                        // SizedBox(
                        //   height: 55.sp,
                        //   width: double.infinity,
                        //   child: GestureDetector(
                        //     onTap: (){},
                        //     child: Padding(
                        //       padding: const EdgeInsets.all(10.0),
                        //       child:  Container(
                        //         width: double.infinity,
                        //         height: 40.sp,
                        //         decoration: ShapeDecoration(
                        //           shape: StadiumBorder(),
                        //           color: AppColor.primary,
                        //         ),
                        //         child: Center(child: Text("Save",style: TextStyle(color: AppColor.Home,fontSize: 20.sp),)),
                        //       ),
                        //     ),
                        //   ),
                        // )
                      ],),
                    ),

                  ],
                ),
              ),
              // Image.asset("assets/login_bg.png",fit: BoxFit.fill,),
            ],
    ),
        ),
      ),
    );
  }
}

class CustomFormImput extends StatelessWidget {

  final String label;
  final IconData icon;
  
  final String value;

   CustomFormImput({
     required this.icon,
    required this.label,
     required this.value,
  })  ;


  @override
  Widget build(BuildContext context) {
    return Container(

      child: Padding(
        padding: const EdgeInsets.only(left: 9.0,right: 9),
        child: Container(
          decoration: BoxDecoration(
              border: Border.all(color: AppColor.primary,width: 1.8),
              borderRadius: BorderRadius.circular(18.sp),
        ),
          width: double.infinity,
          height: 46.sp,
          padding: const EdgeInsets.only(left: 20),
          // decoration: ShapeDecoration(
          //   shape: StadiumBorder(),
          //   color: AppColor.Home,
          // ),
          child: TextFormField(

            decoration: InputDecoration(
              border: InputBorder.none,
              labelText: label,

              prefixIcon: IconBuild(icon),
              contentPadding: const EdgeInsets.only(
                top: 8,
                bottom: 10,
              ),
            ),
            // obscureText: isPassword,
            // initialValue: value,
            style: TextStyle(
              fontSize: 16.sp,
              color: Colors.black87,
            ),
          ),
        ),
      ),
    );
  }

  Widget IconBuild(IconData icon) {
    return Container(
      padding: EdgeInsets.only(right: 13.sp,top: 5.sp,bottom: 5.sp,left: 5.sp),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
      ),
      child: Icon(icon,size: 22.sp,),
    );
  }
}
class HeaderCurvedContainer extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = AppColor.primary;
    Path path = Path()
      ..relativeLineTo(0, 150)
      ..quadraticBezierTo(size.width / 2, 225, size.width, 150)
      ..relativeLineTo(0, -150)
      ..close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
