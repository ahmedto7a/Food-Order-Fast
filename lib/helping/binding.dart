import 'package:dominos/core/service/local_storge_user.dart';
import 'package:dominos/core/view_model/auth_viwe_model.dart';
import 'package:dominos/core/view_model/cart_viwe_model.dart';
import 'package:dominos/core/view_model/checkout_viwe_model.dart';
import 'package:dominos/core/view_model/fav_viwe_model.dart';
import 'package:dominos/core/view_model/home_viwe_model.dart';
import 'package:dominos/core/view_model/profile_viwe_model.dart';
import 'package:get/get.dart';


class Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthViweModel());
    Get.lazyPut(() => HomeViewModel());
    Get.lazyPut( ()=> CartViewModel());
    // Get.lazyPut( ()=> FavViewModel());
    Get.lazyPut(() => LocalStorageUser());
    Get.lazyPut(() => CheckoutViewModel());
    Get.lazyPut(() => ProfileViewModel());



  }
}
