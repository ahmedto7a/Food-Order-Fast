import 'package:dominos/const/colors.dart';
import 'package:dominos/core/service/firestore_user.dart';
import 'package:dominos/core/service/local_storge_user.dart';
import 'package:dominos/model/user_model.dart';
import 'package:dominos/viwe/control_viwe.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:twitter_login/twitter_login.dart';

class AuthViweModel extends GetxController {

  // final LocalStorageUser =Get.find();

 final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ["email"]);

  String? email, password, name;
  RxBool isSignupScreen = true.obs;


  RxBool isMale = true.obs;

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final Rxn<User>? _user = Rxn<User>();

  /// هل اليوزر ليه قيمه و اميل فعلا ولا لاا ///////////////////
  String? get user => _user?.value?.email;

  // final LocalStorageUser localStorageData = Get.put(LocalStorageUser());



  void signUpWithEmailAndPassword() async {
    try {
      await _auth
          .createUserWithEmailAndPassword(email: email!, password: password!)
          .then((user) {
        saveUser(user);
      });
      Get.offAll( ControlView());
    } catch (error) {
      String errorMessage =
      error.toString().substring(error.toString().indexOf(' ') + 1);
      Get.snackbar(
        'Try correct to login..',
        errorMessage,
        backgroundColor: AppColor.Home,
        colorText: AppColor.primary,
        snackPosition: SnackPosition.TOP,
        borderWidth: 5,
        borderColor: AppColor.primary,
      );
    }
  }


  @override
  void onInit() {
    super.onInit();

    /// بيتغير فيها يكون عندي_auth/// عشان كل مره ال
    _user!.bindStream(_auth.authStateChanges());
    if(_auth.currentUser!=null){
      getCurentUserData(_auth.currentUser!.uid);
    }
  }

  void GoogleSignInMethod() async {
    //sigin with google with out firebase from app
    final GoogleSignInAccount? _googleUser = await _googleSignIn.signIn();


    //------------to acses google sigin in authentication to add credinteal-----------
    GoogleSignInAuthentication googleSignInAuthentication =
    await _googleUser!.authentication;

    // to get credentil that exist in googleUserAuth
    //-------------get the creadentil------------------//
    final AuthCredential credential = GoogleAuthProvider.credential(
      idToken: googleSignInAuthentication.idToken,
      //exist in GoogleSiginAuthentcation
      accessToken: googleSignInAuthentication
          .accessToken, //exist in GoogleSiginAuthentcation
    );

//To signin firebase Athu With Credential
    await _auth.signInWithCredential(credential).then((user) => saveUser(user));
    Get.offAll(ControlView());
  }
  /// FaceBook Auth//////////////////////////////////
  void signInWithFacebookAccount() async {
    try {
      final _facebookSignIn = await FacebookAuth.instance.login();

      final _facebookAuthCredential =
      FacebookAuthProvider.credential(_facebookSignIn.accessToken!.token);

      await _auth.signInWithCredential(_facebookAuthCredential).then((user) {
        saveUser(user);
      });
      Get.offAll(ControlView());
    } catch (error) {
      Get.snackbar(
        'Failed to login..',
        "Go and Try With Sign Up",
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  /// Save data for User//////////////////////////////////

  void saveUser(UserCredential user) async {
    UserModel _userModel = UserModel(
      userId: user.user!.uid,
      email: user.user!.email!.toString(),
      name: name == null ? user.user!.displayName: name!,
      pic: user.user!.photoURL == null
          ? 'https://firebasestorage.googleapis.com/v0/b/dominos-811a3.appspot.com/o/405-4050774_avatar-icon-flat-icon-shop-download-free-icons-for-avatar-icon-flat.png?alt=media&token=10c0dc8e-c547-4938-9005-edcc993ffe6d'
          : user.user!.photoURL! + "?width=400",
    );
    await FirestoreUser().addUserDataToFirestore(_userModel);
    saveUserLocal(_userModel);
  }

  void saveUserLocal(UserModel userModel) async {
    await LocalStorageUser.setUserData(userModel);
  }

  /// Save data for User//////////////////////////////////
  void signInWithEmailAndPassword() async {
    try {
      await _auth
          .signInWithEmailAndPassword(email: email!, password: password!).then((value) async {
        getCurentUserData(value.user!.uid);
      });

      /// to save user data////////////////////////////////////////////////////////
      /// to save user data////////////////////////////////////////////////////////

      Get.offAll( ControlView());
    } catch (error) {
      String errorMessage =
      error.toString().substring(error.toString().indexOf(' ') + 1);
      Get.snackbar(
        'Error Login account',
        errorMessage,
        backgroundColor: AppColor.Home,
        colorText: AppColor.primary,
        snackPosition: SnackPosition.TOP,
        borderWidth: 5,
        borderColor: AppColor.primary,
      );
    }
  }




  // void TwitterWithLogin() async {
  //   final twitetrLogin = TwitterLogin(apiKey: "MQCCMFpa2hQGiHEx8IhGTvpJP",
  //       apiSecretKey: "zsHGWoauc0FDXdaHfpv0ZmlP2RgvR9ztqxeHGXT7xoulnGy7l4",
  //       redirectURI: "dominos://");
  //
  //   final authResult = await twitetrLogin.login();
  //
  //
  //     if(authResult.status == TwitterLoginStatus.loggedIn){
  //       final AuthCredential credential = TwitterAuthProvider.credential(
  //           accessToken: authResult .authToken!,
  //           secret: authResult .authTokenSecret!);
  //       await _auth.signInWithCredential(credential)
  //           .then((user) {
  //         saveUser(user);
  //         Get.offAll( ControlView());
  //       });
  //   }else {
  //     }
  //
  // }

  Future<void> signOut() async {
    try {
      await _auth.signOut();
       LocalStorageUser.clearUserData();
    } catch (error) {
    }
  }

  void getCurentUserData(String uid)async{
    await FirestoreUser().getUserDataFromFirestore(uid).then((value) {
      saveUserLocal(UserModel.fromJson(value.data()! as Map<String,dynamic>));
    });
  }
}