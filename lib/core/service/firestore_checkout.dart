import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dominos/model/caart_mode.dart';
import 'package:dominos/model/delevery_model.dart';
import 'package:dominos/model/domina_model.dart';
import 'package:dominos/model/takeaway_model.dart';
import 'package:firebase_auth/firebase_auth.dart';


class FirestoreCheckout {
  /// To Read Data in firebase (( information from every user by uid from Decoment - and show every order fo every user ))
  final CollectionReference _ordersCollection = FirebaseFirestore.instance
      .collection('users')
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .collection('orders');

  Future<List<QueryDocumentSnapshot>> getOrdersFromFirestore() async {
    var _orders =
    await _ordersCollection.orderBy('date', descending: true).get();
    return _orders.docs;
  }

  // addOrderToFirestore(CheckoutModel checkoutModel) async {
  //   return await _ordersCollection.doc().set(checkoutModel.toJson());
  // }
  addOrderDeleveryToFirestore(DeleveryModel deleveryModel) async {
    return await _ordersCollection.doc().set(deleveryModel.toJson());
  }
  // addOrderInDominaToFirestore(DominaModel dominaModel) async {
  //   return await _ordersCollection.doc().set(dominaModel.toJson());
  // }
  // addOrderTakeawayToFirestore(TakeawayModel takeawayModel) async {
  //   return await _ordersCollection.doc().set(takeawayModel.toJson());
  // }
//////////////////////////////////////////////////////////////////////////////////////////

}