
import 'package:dominos/const/colors.dart';
import 'package:dominos/core/view_model/auth_viwe_model.dart';
import 'package:dominos/viwe/cart_screen.dart';
import 'package:dominos/viwe/reset_password.dart';
import 'package:dominos/widget/Text_filed.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';

import 'package:get/get_core/src/get_main.dart';
import 'package:sizer/sizer.dart';

import 'home_screen.dart';

class LoginSignupScreen extends GetWidget<AuthViweModel> {
  final GlobalKey<FormState> _formKey =GlobalKey();
  final GlobalKey<FormState> _formKeyy = GlobalKey();


  final controller =Get.put(AuthViweModel());

  @override
  Widget build(BuildContext context) {
    return Obx(()=>Scaffold(
      backgroundColor:AppColor.Home,
      body: Stack(
        children: [
          Positioned(
            top: 0,
            right: 0,
            left: 0,

            child: Container(
              height: 360,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/vector4.png",),
                      fit: BoxFit.fitWidth)),
              child: Container(
                padding: EdgeInsets.only(top: 59, left: 20),
                color: AppColor.primary.withOpacity(.85),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: TextSpan(
                          text: "Hi,",
                          style: TextStyle(
                            fontSize: 39,
                            letterSpacing: .2,
                            color: Colors.white,
                          ),
                          children: [
                            TextSpan(
                              text: controller.isSignupScreen.value ? " In our fast food" : " Ready to Go",
                              style: TextStyle(
                                fontSize: 33,
                                fontWeight: FontWeight.bold,
                                color:Colors.white,
                              ),
                            )
                          ]),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      controller.isSignupScreen.value
                          ? "Signup to Continue"
                          : "Login now",
                      style: TextStyle(
                        fontSize: 21 ,
                        letterSpacing: 1,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          // Trick to add the shadow for the submit button
          buildBottomHalfContainer(true),
          //Main Contianer for Login and Signup
          AnimatedPositioned(
            duration: Duration(milliseconds: 1000),
            curve: Curves.bounceInOut,
            top: controller.isSignupScreen.value ? 173 : 200,

            // top: controller.isSignupScreen.value ? 200 : 230,
            child: AnimatedContainer(
              duration: Duration(milliseconds: 1100),
              curve: Curves.bounceInOut,
              height: controller.isSignupScreen.value ? 300 : 266,

              // height: controller.isSignupScreen.value ? 380 : 250,
              padding: EdgeInsets.all(20),
              width: MediaQuery.of(context).size.width - 40,
              margin: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        blurRadius: 15,
                        spreadRadius: 5),
                  ]),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        GestureDetector(
                          onTap: () {
                            controller.isSignupScreen.value = false;
                          },
                          child: Column(
                            children: [
                              Text(
                                "LOGIN",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: !controller.isSignupScreen.value
                                        ? Palette.activeColor
                                        : Palette.textLoginColor1),
                              ),
                              if (!controller.isSignupScreen.value)
                                Container(
                                  margin: EdgeInsets.only(top: 3),
                                  height: 2,
                                  width: 55,
                                  color: AppColor.primary,
                                )
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            controller.isSignupScreen.value = true;

                          },
                          child: Column(
                            children: [
                              Text(
                                "SIGNUP",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: controller.isSignupScreen.value
                                        ? Palette.activeColor
                                        : Palette.textLoginColor1),
                              ),
                              if (controller.isSignupScreen.value)
                                Container(
                                  margin: EdgeInsets.only(top: 3),
                                  height: 2,
                                  width: 55,
                                  color: AppColor.primary,
                                )
                            ],
                          ),
                        )
                      ],
                    ),
                    if (controller.isSignupScreen.value) buildSignupSection(),
                    if (!controller.isSignupScreen.value) buildSigninSection(),
                  ],
                ),
              ),
            ),
          ),
          // Trick to add the submit button
          buildBottomHalfContainer(false),
          Positioned(
            top: MediaQuery.of(context).size.height - 93,
            right: 0,
            left: 0,
            child: Column(
              children: [
                Text(controller.isSignupScreen.value ? "" : "Or Signin with",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.only(  top: 15,bottom: 27),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      buildTextButton(Icons.facebook,
                          "Facebook", Palette.facebookColor,()=>
                              controller.signInWithFacebookAccount(),
                      ),
                      TextButton(
                        onPressed: () {
                          controller.GoogleSignInMethod();
                          },
                        style: TextButton.styleFrom(
                            side: BorderSide(width: 1, color: Colors.grey),
                            minimumSize: Size(145, 40),
                            shape:
                            RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                            primary: Colors.deepOrangeAccent,
                            backgroundColor: Colors.white  ),
                        child: Row(
                          children: [
                            ImageIcon(AssetImage("assets/google-logo-png-webinar-optimizing-for-success-google-business-webinar-13.png",),size: 30,),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Google",style: TextStyle(fontSize: 19),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    ),
    );
  }
/// ////////////////// Sign in section////////////////////////
  Container buildSigninSection() {
    return Container(
      margin: EdgeInsets.only(top: 20),
      child: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              buildTextField(Icons.mail_outline, "info@demouri.com", false, true, (value){if(value!.isEmpty){return "Please Enter Your Email";}return null;}, (value){ controller.email=value!;}),
              SizedBox(height: 8,),
              buildTextField(Icons.lock_outline, "**********", true, false ,(value){if(value!.isEmpty){return "Please Enter Your password";}return null;}, (value){ controller.password=value!;}),
              /// /////////Cheack Box///////////////////////////////
              /// /// ///////// Forget Pass /// Forget Pass ///////////////////////////////
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.start,
              //   children: [
              //     // Row(
              //     //   children: [
              //     //     Checkbox(
              //     //       value: isRememberMe,
              //     //       activeColor: AppColor.primary,
              //     //       onChanged: (value) {
              //     //         setState(() {
              //     //           isRememberMe = !isRememberMe;
              //     //         });
              //     //       },
              //     //     ),
              //     //     Text("Remember me",
              //     //         style: TextStyle(fontSize: 12, color: Palette.textColor1))
              //     //   ],
              //     // ),
              //
              //     // TextButton(
              //     //   onPressed: () {
              //     //     // Get.to(ForgotPasswordScreen());
              //     //   },
              //     //   child: Text("",
              //     //       style: TextStyle(fontSize: 17, color: AppColor.primary)),
              //     // )
              //   ],
              // ),
            ],

          ),
        ),
      ),
    );
  }
  /// ///////////////////////////////////

  /// /////////////Sign uo section ////////////////////////

  Container buildSignupSection() {
    return Container(
      margin: EdgeInsets.only(top: 20),
      child: Form(
        key: _formKeyy,
        child: SingleChildScrollView(
          child: Column(
            children: [
              buildTextField(Icons.person_outline_sharp, "User Name",
                  false, false ,(value){if(value!.isEmpty){return "Please Enter Your name";}return null;}, (value){controller.name=value!;},),
              buildTextField(Icons.email_outlined, "email", false, true ,(value){if(value!.isEmpty){return "Please Enter Your Email";}return null;}, (value){controller.email=value!;},),

              buildTextField(Icons.lock_outline, "password", true, false,(value){if(value!.isEmpty){return "Please Enter Your password";}return null;}, (value){controller.password=value!;},),

              Padding(
                padding: const EdgeInsets.only(top: 3, left: 10),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                          controller.isMale.value = true ;
                      },
                      child: Row(
                        children: [
                          Container(
                            width: 30,
                            height: 30,
                            margin: EdgeInsets.only(right: 8),
                            decoration: BoxDecoration(
                                color: controller.isMale.value
                                    ? AppColor.primary
                                    : Colors.transparent,
                                border: Border.all(
                                    width: 1,
                                    color: controller.isMale.value
                                        ? Colors.transparent
                                        : Palette.textLoginColor1),
                                borderRadius: BorderRadius.circular(15)),
                            child: Icon(
                              Icons.male,
                              color: controller.isMale.value ? Colors.white : AppColor.primary,
                            ),
                          ),
                          Text(
                            "Male",
                            style: TextStyle(color: Palette.textLoginColor1),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    GestureDetector(
                      onTap: () {

                        controller.isMale.value = false;
                      },
                      child: Row(
                        children: [
                          Container(
                            width: 30,
                            height: 30,
                            margin: EdgeInsets.only(right: 8),
                            decoration: BoxDecoration(
                                color: controller.isMale.value
                                    ? Colors.transparent
                                    : AppColor.primary,
                                border: Border.all(
                                    width: 1,
                                    color: controller.isMale.value
                                        ? Palette.textLoginColor1
                                        : Colors.transparent),
                                borderRadius: BorderRadius.circular(15)),
                            child: Icon(
                              Icons.female,
                              color: controller.isMale.value ? AppColor.primary : Colors.white,
                            ),
                          ),
                          Text(
                            "Female",
                            style: TextStyle(color: Palette.textLoginColor1),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  TextButton buildTextButton(
      IconData icon, String title, Color backgroundColor, Function() Function ) {
    return TextButton(
      onPressed: Function,
      style: TextButton.styleFrom(
          side: const BorderSide(width: 1, color: Colors.grey),
          minimumSize: const Size(145, 40),
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          primary: Colors.white,
          backgroundColor: backgroundColor),
      child: Row(
        children: [
          Icon(
            icon,size: 24.sp,
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            title,style: TextStyle(fontSize: 14.sp),
          )
        ],
      ),
    );
  }

  Widget buildBottomHalfContainer(bool showShadow) {
    return AnimatedPositioned(
      duration: const Duration(milliseconds: 890),
      curve: Curves.bounceInOut,
      top: controller.isSignupScreen.value ? 436 : 405,
      right: 0,
      left: 0,
      child: Center(
        child: Container(
          height: 90,
          width: 90,
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(50),
              boxShadow: [
                if (showShadow)
                  BoxShadow(
                    color: Colors.black.withOpacity(.3),
                    spreadRadius: 1.5,
                    blurRadius: 10,
                  )
              ]),
          child: !showShadow
          ///send data user ////////////////////////////////////////////////
              ? GestureDetector(
               onTap: (){
                 if(controller.isSignupScreen.value==true){
                   _formKeyy.currentState!.save();
                   if (_formKeyy.currentState!.validate()) {
                     controller.signUpWithEmailAndPassword();
                   }

                   }
                else if(controller.isSignupScreen.value == false) {
                   _formKey.currentState!.save();
                   if (_formKey.currentState!.validate()) {
                     controller.signInWithEmailAndPassword();
                   }
                 }
               },
                child: Container(
            decoration: BoxDecoration(
                  gradient: const LinearGradient(
                      colors: [Colors.blueGrey, AppColor.primary],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight),
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(.5),
                        spreadRadius: 1,
                        blurRadius: 2,
                        offset: const Offset(0, 1))
                  ]),
            child: const Icon(
                Icons.arrow_forward,
                color: Colors.white,
            ),
          ),
              )
          /// //////////////////////////////////////////////////////
              : const Center(),
        ),
      ),
    );
  }


}
