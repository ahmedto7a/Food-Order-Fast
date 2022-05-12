import 'package:dominos/core/service/local_fav.dart';
import 'package:dominos/model/fav_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavViewModel extends GetxController {

  ValueNotifier<bool> get loading => _loaging;
  ValueNotifier<bool> _loaging = ValueNotifier(false);
 bool isfav =true;
  List<FavModel> _favProudect = [];

  List<FavModel> get favProudect => _favProudect;


  @override
  void onInit() {
    super.onInit();
    getFavtProducts();
  }

  getFavtProducts() async {
    _loaging.value = true;
    _favProudect = await LocalDatabaseFavourit.db.getAllProducts();
    _loaging.value = false;
    update();
  }

  addProduct(FavModel favModel) async {
    bool _isExist = false;
    _favProudect.forEach((element) {
      if (element.productId == favModel.productId) {
        _isExist = true;
      }
    });
    if (!_isExist) {
      await LocalDatabaseFavourit.db.insertProduct(favModel);
      getFavtProducts();
    }
  }

  removeProduct(String productId) async {
    await LocalDatabaseFavourit.db.deleteProduct(productId);
    getFavtProducts();
  }


}