import 'package:dominos/helping/binding.dart';
import 'package:dominos/viwe/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:sizer/sizer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Binding().dependencies();
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return GetMaterialApp(
        theme: ThemeData(
          brightness: Brightness.light,
          primaryColor: Colors.pink,
        ),
        initialBinding: Binding(),
        debugShowCheckedModeBanner: false,
        home: const Scaffold(
          backgroundColor: Colors.lightBlueAccent,
          body: SplashScreen(),
        ),
      );

  },);
  }
}


