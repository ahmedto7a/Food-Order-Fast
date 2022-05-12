import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dominos/core/service/firestore_home.dart';
import 'package:dominos/model/categorie_model.dart';
import 'package:dominos/model/proudect_model.dart';
import 'package:dominos/viwe/cart_screen.dart';
import 'package:dominos/viwe/home_screen.dart';
import 'package:dominos/viwe/notifcation_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class HomeViewModel extends GetxController {

  // late final List<ProductModel> favMeals;

  ValueNotifier<bool> get loading => _loaging;
  final ValueNotifier<bool> _loaging = ValueNotifier(false);

  int _navigatorValue = 0;

  int _currentIndex = 0;

  Widget _currentScreen = HomeScreen();

  Widget get currentScreen => _currentScreen;

  get navigatorValue => _navigatorValue;


  void changeSelectedValue(int selectedValue) {
    _navigatorValue = selectedValue;
    switch (selectedValue) {
      case 0:
        _currentScreen = HomeScreen();
        break;
      case 1:
        _currentScreen = NotificationScreen();
        break;
      case 2:
        _currentScreen = CartScreen();
        break;
    }
    update();
  }

  get currentIndex => _currentIndex;

  /// make proudect and catigory Related///////////////////////////////////
  /// /// make proudect and catigory Related///////////////////////////////////
  /// /// make proudect and catigory Related///////////////////////////////////

  void changeSelectedCategory(int index) {
    _currentIndex = index;
    update();
  }


  List<CategoryModel> get categories => _categories;
  final List<CategoryModel> _categories = [];

  List<ProductModel> get products => _products;

  final List<ProductModel> _products = [];


  final double _totalPrice = 0.0;

  double get totalPrice => _totalPrice;


  @override
  void onInit() {
    super.onInit();
    _getCategoriesFromFireStore();
    _getProductsFromFireStore();

    // getCartProducts();
  }

  // _addFavMeal()async{
  //   if(favMeals.isEmpty)
  //
  // }
  _getCategoriesFromFireStore() async {
    _loaging.value = true;
    List<QueryDocumentSnapshot> categoriesSnapshot =
    await FirestoreHome().getCategoriesFromFirestore();
    for (var category in categoriesSnapshot) {
      _categories
          .add(CategoryModel.fromJson(category.data() as Map<String, dynamic>));
      //print(_categoreModel.length);
    }
    _loaging.value = false;
    update();
  }

  _getProductsFromFireStore() async {
    _loaging.value = true;
    List<QueryDocumentSnapshot> productsSnapshot =
    await FirestoreHome().getProductsFromFirestore();
    for (var product in productsSnapshot) {
      _products
          .add(ProductModel.fromJson(product.data() as Map<String, dynamic>));
    }
    _loaging.value = false;
    update();
  }

}
