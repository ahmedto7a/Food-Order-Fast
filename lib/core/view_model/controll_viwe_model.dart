// import 'package:dominos/viwe/cart_screen.dart';
// import 'package:dominos/viwe/home_screen.dart';
// import 'package:dominos/viwe/notifcation_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
//
//
// class ControlViewModel extends GetxController {
//   Widget _currentScreen = HomeScreen();
//   int _navigatorIndex = 0;
//
//   Widget get currentScreen => _currentScreen;
//
//   int get navigatorIndex => _navigatorIndex;
//
//   changeCurrentScreen(int index){
//     _navigatorIndex = index;
//     switch(index){
//       case 0:
//         _currentScreen = HomeScreen();
//         break;
//       case 1:
//         _currentScreen = NotificationScreen();
//         break;
//       case 2:
//         _currentScreen = CartScreen();
//         break;
//     }
//     update();
//   }
// }