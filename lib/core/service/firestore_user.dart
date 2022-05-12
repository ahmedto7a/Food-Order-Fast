import 'package:cloud_firestore/cloud_firestore.dart';

import '../../model/user_model.dart';

class FirestoreUser {
  /// colection for user data refrance in firestore cloud//////////////////////////////////
  /// /// colection for user data refrance in firestore cloud//////////////////////////////////
  final CollectionReference _usersCollection =
  FirebaseFirestore.instance.collection('users');
  /// Add data for user from app to firestore //////////////////////////////////

  addUserDataToFirestore(UserModel userModel) async {
    await _usersCollection.doc(userModel.userId).set(userModel.toJson());
  }
  ///  select eache on them from uid //////////////////////////////////
  Future<DocumentSnapshot> getUserDataFromFirestore(String uid) async {
    return await _usersCollection.doc(uid).get();
  }
}