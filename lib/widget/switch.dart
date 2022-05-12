import 'package:dominos/const/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class SwichMood extends StatefulWidget {

  @override
  _SwichMoodState createState() => _SwichMoodState();
}
ThemeData _lightTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: Colors.redAccent,

  buttonTheme: ButtonThemeData(
      buttonColor: Colors.amber,
      disabledColor: Colors.black
  ),
);

ThemeData _darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: Colors.amber,

    buttonTheme: ButtonThemeData(
        buttonColor: Colors.amber,
        disabledColor: Colors.black
    ),
);
bool _light=true;
class _SwichMoodState extends State<SwichMood> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60.sp,
      height: 27.sp,
      child: Switch(
          value: _light,
          onChanged: (state){
setState(() {
  print("qaaaaaaaa${state}");
  _light= state;
});
          }),
    );
  }
}
