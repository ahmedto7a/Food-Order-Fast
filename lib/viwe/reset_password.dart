// import 'package:dominos/const/colors.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
//
// class ForgotPasswordScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Forgot Password"),
//       ),
//       body: SizedBox(
//         width: double.infinity,
//         child: SingleChildScrollView(
//           child: Padding(
//             padding: EdgeInsets.symmetric(horizontal: 20),
//             child: Column(
//               children: [
//                 SizedBox(height: 8),
//                 Text(
//                   "Forgot Password",
//                   style: TextStyle(
//                     fontSize: 28,
//                     color: Colors.black,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 Text(
//                   "Please enter your email and we will send \nyou a link to return to your account",
//                   textAlign: TextAlign.center,
//                 ),
//                 SizedBox(height: 5),
//                 ForgotPassForm(),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// class ForgotPassForm extends StatefulWidget {
//   @override
//   _ForgotPassFormState createState() => _ForgotPassFormState();
// }
//
// class _ForgotPassFormState extends State<ForgotPassForm> {
//   final _formKey = GlobalKey<FormState>();
//   List<String> errors = [];
//   String? email;
//
//   @override
//   Widget build(BuildContext context) {
//     return Form(
//       key: _formKey,
//       child: Column(
//         children: [
//           TextFormField(
//             keyboardType: TextInputType.emailAddress,
//             onSaved: (newValue) => email = newValue,
//             onChanged: (value) {
//               if (value.isNotEmpty && errors.contains(kEmailNullError)) {
//                 setState(() {
//                   errors.remove(kEmailNullError);
//                 });
//               } else if (emailValidatorRegExp.hasMatch(value) &&
//                   errors.contains(kInvalidEmailError)) {
//                 setState(() {
//                   errors.remove(kInvalidEmailError);
//                 });
//               }
//               return null;
//             },
//             validator: (value) {
//               if (value!.isEmpty && !errors.contains(kEmailNullError)) {
//                 setState(() {
//                   errors.add(kEmailNullError);
//                 });
//               } else if (!emailValidatorRegExp.hasMatch(value) &&
//                   !errors.contains(kInvalidEmailError)) {
//                 setState(() {
//                   errors.add(kInvalidEmailError);
//                 });
//               }
//               return null;
//             },
//             decoration: InputDecoration(
//               labelText: "Email",
//               hintText: "Enter your email",
//               // If  you are using latest version of flutter then lable text and hint text shown like this
//               // if you r using flutter less then 1.20.* then maybe this is not working properly
//               floatingLabelBehavior: FloatingLabelBehavior.always,
//               suffixIcon: Icon(Icons.account_circle_rounded),
//             ),
//           ),
//           SizedBox(height: 30),
//           FormError(errors: errors),
//           SizedBox(height: 7),
//           CustomButton(
//             onPressed: () {
//               if (_formKey.currentState!.validate()) {
//                 // Get.to(VerificationScreen2());
//                 // Do what you want to do
//               }
//             },
//
//             title: "Continue",
//             color: AppColor.primary,
//             textStyle:TextStyle( color: Colors.black,fontSize: 24,fontWeight: FontWeight.w500,),
//             ),
//           NoAccountText(),
//         ],
//       ),
//     );
//   }
// }
//
// class FormError extends StatelessWidget {
//   const FormError({
//     Key? key,
//     required this.errors,
//   }) : super(key: key);
//
//   final List<String?> errors;
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: List.generate(
//           errors.length, (index) => formErrorText(error: errors[index]!)),
//     );
//   }
//
//   Row formErrorText({required String error}) {
//     return Row(
//       children: [
//         Container(
//           height: 30,
//           width: 30,
//           child: Icon(Icons.info_outline),
//         ),
//         SizedBox(
//           width: 10,
//         ),
//         Text(error),
//       ],
//     );
//   }
// }
//
// class NoAccountText extends StatelessWidget {
//   const NoAccountText({
//     Key? key,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         Text(
//           "Don’t have an account? ",
//           style: TextStyle(fontSize: 16),
//         ),
//         GestureDetector(
//           onTap: () {},
//           child: Text(
//             "Sign Up",
//             style: TextStyle(fontSize: 16, color: AppColor.primary),
//           ),
//         ),
//       ],
//     );
//   }
// }
//
// class DefaultButton extends StatelessWidget {
//   const DefaultButton({
//     Key? key,
//     this.text,
//     this.press,
//   }) : super(key: key);
//   final String? text;
//   final Function? press;
//
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       width: double.infinity,
//       height: 44,
//       child: TextButton(
//         style: TextButton.styleFrom(
//           shape:
//               RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
//           primary: Colors.white,
//           backgroundColor: Colors.red,
//         ),
//         onPressed: press as void Function()?,
//         child: Text(
//           text!,
//           style: TextStyle(
//             fontSize: 10,
//             color: Colors.white,
//           ),
//         ),
//       ),
//     );
//   }
// }
//
//
//
//
//
// const Color primaryColor = Color(0xFF121212);
// const Color accentPurpleColor = Color(0xFF6A53A1);
// const Color accentPinkColor = Color(0xFFF99BBD);
// const Color accentDarkGreenColor = Color(0xFF115C49);
// const Color accentYellowColor = Color(0xFFFFB612);
// const Color accentOrangeColor = Color(0xFFEA7A3B);
//
//
// class VerificationScreen2 extends StatefulWidget {
//   @override
//   _VerificationScreen2State createState() => _VerificationScreen2State();
// }
//
// class _VerificationScreen2State extends State<VerificationScreen2> {
//   late List<TextStyle?> otpTextStyles;
//   @override
//   Widget build(BuildContext context) {
//     ThemeData theme = Theme.of(context);
//     otpTextStyles = [
//       createStyle(AppColor.primary),
//       createStyle(accentYellowColor),
//       createStyle(accentDarkGreenColor),
//       createStyle(accentOrangeColor),
//       createStyle(accentPinkColor),
//       createStyle(AppColor.primary),
//     ];
//     return Scaffold(
//       appBar: AppBar(
//         elevation: 0,
//         backgroundColor: Colors.white,
//       ),
//       body: Container(
//         padding: const EdgeInsets.only(left: 24),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               "Verification Code",
//               style: theme.textTheme.headline4,
//             ),
//             SizedBox(height: 16),
//             Text(
//               "We texted you a code",
//               style: theme.textTheme.headline6,
//             ),
//             Text("Please enter it below", style: theme.textTheme.headline6),
//             Spacer(flex: 2),
//             OtpTextField(
//               numberOfFields: 6,
//               borderColor: accentPurpleColor,
//               focusedBorderColor: accentPurpleColor,
//               styles: otpTextStyles,
//               showFieldAsBox: false,
//               borderWidth: 4.0,
//               onCodeChanged: (String code) {},
//               onSubmit: (String verificationCode) {}, // end onSubmit
//             ),
//             Spacer(),
//             Center(
//               child: Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Text(
//                   "This helps us verify every user in our market place",
//                   textAlign: TextAlign.center,
//                   style: theme.textTheme.bodyText1,
//                 ),
//               ),
//             ),
//             Center(
//               child: Text(
//                 "Didn't get code?",
//                 style: theme.textTheme.subtitle1,
//               ),
//             ),
//             Spacer(flex: 3),
//             CustomButton(
//               onPressed: () {},
//               title: "Confirm",
//               color: AppColor.primary,
//               textStyle: theme.textTheme.subtitle1?.copyWith(
//                 color: Colors.black,fontSize: 27,fontWeight: FontWeight.w500,
//               ),
//             ),
//             Spacer(flex: 2),
//           ],
//         ),
//       ),
//     );
//   }
//
//   TextStyle? createStyle(Color color) {
//     ThemeData theme = Theme.of(context);
//     return theme.textTheme.headline3?.copyWith(color: color);
//   }
// }
//
// class CustomButton extends StatelessWidget {
//   CustomButton({
//     required this.title,
//     this.onPressed,
//     this.height = 60,
//     this.elevation = 1,
//     this.color = primaryColor,
//     this.textStyle,
//   });
//
//   final VoidCallback? onPressed;
//   final double height;
//   final double elevation;
//   final String title;
//   final Color color;
//   // final BorderSide borderSide;
//   final TextStyle? textStyle;
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialButton(
//       onPressed: onPressed,
//       elevation: elevation,
//       shape: RoundedRectangleBorder(
//         borderRadius: const BorderRadius.only(
//           topLeft: const Radius.circular(30.0),
//           bottomLeft: const Radius.circular(30.0),
//         ),
//       ),
//       height: height,
//       color: color,
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Text(
//             title,
//             style: textStyle,
//           )
//         ],
//       ),
//     );
//   }
// }