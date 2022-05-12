import 'package:dominos/const/colors.dart';
import 'package:flutter/material.dart';

Widget buildTextField(

    IconData icon, String hintText,bool isPassword, bool isEmail,String? Function(String?) validatorFn,Function(String?) onSavedFn) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 8.0),
    child: TextFormField(
      obscureText: isPassword,
      keyboardType: isEmail ? TextInputType.emailAddress : TextInputType.text,
      decoration: InputDecoration(
        prefixIcon: Icon(
          icon,
          color: AppColor.primary,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Palette.textLoginColor1),
          borderRadius: BorderRadius.all(Radius.circular(35.0)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Palette.textLoginColor1),
          borderRadius: BorderRadius.all(Radius.circular(35.0)),
        ),
        contentPadding: EdgeInsets.all(10),
        hintText: hintText,
        hintStyle: TextStyle(fontSize: 14, color: Palette.textLoginColor1),

      ),
      validator: validatorFn,
      onSaved: onSavedFn,
    ),
  );
}


