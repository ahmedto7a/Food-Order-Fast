import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dominos/model/caart_mode.dart';
import 'package:dominos/model/delevery_model.dart';
import 'package:dominos/model/domina_model.dart';
import 'package:dominos/model/takeaway_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sqflite/sqflite.dart';


class FirestoreCart {
  /// To Read Data in firebase (( information from every user by uid from Decoment - and show every order fo every user ))
  final CollectionReference _CartCollection = FirebaseFirestore.instance
      .collection('users')
  .doc(FirebaseAuth.instance.currentUser!.uid)
  .collection("cart")
  ;

  Future<List<QueryDocumentSnapshot>> getCartFromFirestore() async {
    var _cart =
    await _CartCollection.orderBy('date', descending: true).get();
    return _cart.docs;
  }

  // Future<List<CartModel>> getAllFireProducts() async {
  //   Database db = (await _CartCollection) as Database;
  //   List<Map> _maps = await db.query('cartProducts');
  //
  //   List<CartModel> _list = _maps.isNotEmpty
  //       ? _maps.map((cartProduct) => CartModel.fromJson(cartProduct)).toList()
  //       : [];
  //   return _list;
  // }


  // addOrderToFirestore(CheckoutModel checkoutModel) async {
  //   return await _ordersCollection.doc().set(checkoutModel.toJson());
  // }

  addCartDeleveryToFirestore(CartModel cartModel) async {
    return await _CartCollection.doc().set(cartModel.toJson());
  }



  // addOrderInDominaToFirestore(DominaModel dominaModel) async {
  //   return await _CartCollection.doc().set(dominaModel.toJson());
  // }
  // addOrderTakeawayToFirestore(TakeawayModel takeawayModel) async {
  //   return await _CartCollection.doc().set(takeawayModel.toJson());
  // }
//////////////////////////////////////////////////////////////////////////////////////////

}