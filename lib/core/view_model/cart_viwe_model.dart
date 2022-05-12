
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dominos/core/service/database_local_cart.dart';
import 'package:dominos/core/service/firestore_cart.dart';
import 'package:dominos/model/caart_mode.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../service/firestore_checkout.dart';


class CartViewModel extends GetxController {



  ValueNotifier<bool> get loading => _loaging;
  final ValueNotifier<bool> _loaging = ValueNotifier(false);


  List<CartModel> _cartProducts = [];

  List<CartModel> get cartProducts => _cartProducts;

  double _totalPrice = 0.0;

  double get totalPrice => _totalPrice;

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  @override
  void onInit() {
    super.onInit();
    getCartProducts();
    // getCartFromFireStore();
  }

  getCartProducts() async {
    _loaging.value=true;
    _cartProducts = await LocalDatabaseCart.db.getAllProducts();
    getTotalPrice();
    _loaging.value=false;
    update();

  }




  addProduct(CartModel cartModel) async {
    bool _isExist = false;
    _cartProducts.forEach((element) {
      if (element.productId == cartModel.productId) {
        _isExist = true;
      }
    });
    if (!_isExist) {
      await LocalDatabaseCart.db.insertProduct(cartModel);
      getCartProducts();

    }
  }

  removeProduct(String productId) async {
    await LocalDatabaseCart.db.deleteProduct(productId);
    getCartProducts();
  }

  removeAllProducts() async {
    await LocalDatabaseCart.db.deleteAllProducts();
    getCartProducts();
  }

  getTotalPrice() {
    _totalPrice = 0;
    _cartProducts.forEach((cartProduct) {
      _totalPrice += (double.parse(cartProduct.price) *
          cartProduct.quantity);
    });
  }

  increaseQuantity(int index) async {
    if (_cartProducts[index].quantity != 55){
      _cartProducts[index].quantity++;
      getTotalPrice();
      await LocalDatabaseCart.db.update(_cartProducts[index]);
      update();
    }

  }

  decreaseQuantity(int index) async {
    if (_cartProducts[index].quantity != 1) {
      _cartProducts[index].quantity--;
      getTotalPrice();
      await LocalDatabaseCart.db.update(_cartProducts[index]);
      update();
    }
  }



  getCartFromFireStore() async {
    _isLoading = true;
    _cartProducts = [];
    List<QueryDocumentSnapshot> _CartSnapshot =
    await FirestoreCart().getCartFromFirestore();
    for (var cart in _CartSnapshot) {
      _cartProducts
          .add(CartModel.fromJson(cart.data() as Map<String, dynamic>));
    }
    _isLoading = false;
    getCartProducts();
    update();
  }

  addCartDeleveryToFireStore() async {
    await FirestoreCart().addCartDeleveryToFirestore(
        CartModel(
          name: "mm",
          productId:"jj" ,
          image:"jj" ,
          price: "jj",

        ),

    );
    getCartFromFireStore();
  }
}
