import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
class AppColor {
   // static const primary = Color(0xFFfddc3f);
  // static const primary = Color(0xFF3a7abe);
   static const primary = Colors.deepOrangeAccent;

  static const secondary = Colors.black87;
   static const meal = Colors.black12;
  // static const textHomeColor = Color(0xFF3a7abe);
  static const textHomeColor = Colors.deepOrangeAccent;
    static const  Boxshadow = Color(0xFFA8A8A8);

  //static const Home = Color(0xFFFAF9FA);
   static const Home = Color(0xFFe9e8ec);
   // static const NavigationBar = Color(0xFFFAF9FA);
   static const NavigationBar = Color(0xFFe9e8ec);

  //static const Color activeColor = Color(0xFF09126C);
}


class Palette {
  static const Color iconColor = Color(0xFF3a7abe);
  static const Color activeColor = Color(0xFF09126C);
  static const Color textLoginColor1 = Colors.grey;
  static const Color facebookColor = Color(0xFF3B5999);
}
// Form Error
final RegExp emailValidatorRegExp =
RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
const String kEmailNullError = "Please Enter your email";
const String kInvalidEmailError = "Please Enter Valid Email";
const String kPassNullError = "Please Enter your password";
const String kShortPassError = "Password is too short";
const String kMatchPassError = "Passwords don't match";
const String kNamelNullError = "Please Enter your name";
const String kPhoneNumberNullError = "Please Enter your phone number";
const String kAddressNullError = "Please Enter your address";


final otpInputDecoration = InputDecoration(
  contentPadding:
  EdgeInsets.symmetric(vertical:15),
  border: outlineInputBorder(),
  focusedBorder: outlineInputBorder(),
  enabledBorder: outlineInputBorder(),
);

class SizeConfig {
  static late MediaQueryData _mediaQueryData;
  static late double screenWidth;
  static late double screenHeight;
  static double? defaultSize;
  static Orientation? orientation;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    orientation = _mediaQueryData.orientation;
  }
}



OutlineInputBorder outlineInputBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(15),
    borderSide: BorderSide(color: Colors.pink),
  );
}