import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dominos/core/service/firestore_checkout.dart';
import 'package:dominos/model/delevery_model.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../model/caart_mode.dart';
import 'cart_viwe_model.dart';


  class CheckoutViewModel extends GetxController {


  var currentStepDo =0.obs;
  var currentStepDl=0.obs;
  var currentStepDelevery=0.obs;

  String? street, city, state, country, phone;

  String? stutsOrderDelevery;
  bool? indelevery;

  String? stutsOrderDomina;
  bool? inDomina;

  String? stutsOrderTakeway;
  bool? takeway;


  List<DeleveryModel> _checkouts = [];

  List<DeleveryModel> get checkouts => _checkouts;

  // List<CartModel> _cartdetail = [];
  //
  // List<CartModel> get cartdetail => _cartdetail;

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  @override
  void onInit() {
  super.onInit();
  _getCheckoutsFromFireStore();
   // _getCartFromFireStore();
  }

  _getCheckoutsFromFireStore() async {
  _isLoading = true;
  _checkouts = [];
  List<QueryDocumentSnapshot> _checkoutsSnapshot =
  await FirestoreCheckout().getOrdersFromFirestore();
  for (var order in _checkoutsSnapshot) {
  _checkouts
      .add(DeleveryModel.fromJson(order.data() as Map<String, dynamic>));
  }
  _isLoading = false;
  update();
  }



  // _getCartFromFireStore() async {
  //   _isLoading = true;
  //   _cartdetail = [];
  //   List<QueryDocumentSnapshot> _cartSnapshot =
  //   await FirestoreCheckout().getCartFromFirestore();
  //   for (var cart in _cartSnapshot) {
  //     _cartdetail
  //         .add(CartModel.fromJson(cart.data() as Map<String, dynamic>));
  //   }
  //   _isLoading = false;
  //   update();
  // }
  /// This code to mmange my order and send this in my admin panle/////////////////////////

  addCheckoutDeleveryToFireStore() async {
  await FirestoreCheckout().addOrderDeleveryToFirestore(
      DeleveryModel(
        // items: Get.find<CartViewModel>().cartProducts,
   indeleveryValue: stutsOrderDelevery.toString(),
  street: street!,
  city: city!,
  state: state!,
  country: country!,
  phone: phone!,
  totalPrice: Get.find<CartViewModel>().totalPrice.toString(),
  date: DateFormat.yMMMd().add_jm().format(DateTime.now()),
  )

  );
  Get.find<CartViewModel>().removeAllProducts();
  Get.back();
  _getCheckoutsFromFireStore();
  }

  /// This code to mmange my order and send this in my admin panle/////////////////////////


  // addCheckoutInDominaToFireStore() async {
  //   await FirestoreCheckout().addOrderInDominaToFirestore(
  //       DominaModel(
  //         inDominaValue: '',
  //         quntity: '',
  //         proudect: '',
  //         userTime: '',
  //         totalPrice: Get.find<CartViewModel>().totalPrice.toString(),
  //         date: DateFormat.yMMMd().add_jm().format(DateTime.now()),
  //       )
  //   );
  //   Get.find<CartViewModel>().removeAllProducts();
  //   Get.back();
  //   _getCheckoutsFromFireStore();
  // }
  // addCheckoutTakeawayToFireStore() async {
  //   await FirestoreCheckout().addOrderTakeawayToFirestore(
  //       TakeawayModel(
  //           TakewayValue: '',
  //         quntity: '',
  //         proudect: '',
  //         userTime: '',
  //         totalPrice: Get.find<CartViewModel>().totalPrice.toString(),
  //         date: DateFormat.yMMMd().add_jm().format(DateTime.now()),
  //       ));
  //   Get.find<CartViewModel>().removeAllProducts();
  //   Get.back();
  //   _getCheckoutsFromFireStore();
  // }

  }
