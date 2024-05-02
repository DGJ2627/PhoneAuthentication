import 'dart:ffi';

import 'package:astro/screens/HomeScreen.dart';
import 'package:astro/screens/loginsystem/loginscreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';

class AuthenticationRepo extends GetxController {

  static AuthenticationRepo get instance => Get.find();

  final _auth = FirebaseAuth.instance;
  late final Rx<User?> firebaseUser;
  var verificationId = ''.obs;

  @override
  void onReady() {
    firebaseUser = Rx<User?>(_auth.currentUser);
    firebaseUser.bindStream(_auth.userChanges());
    ever(firebaseUser, _setInitialScreen );
  }

  _setInitialScreen(User? user){
    user == null ? Get.offAll(()=> const LoginScreen()) : Get.offAll(const HomeScreen());
  }

  Future<void> phoneAuthentication(String phoneNo) async{
   await _auth.verifyPhoneNumber(
        phoneNumber: phoneNo,
        verificationCompleted: (credentials) async {
          await _auth.signInWithCredential(credentials);
        },
        verificationFailed: (e){
          if(e.code == 'invalid-phone-number'){
            Get.snackbar('Error', 'The Provide phone number is not valid');
          }
          else {
            Get.snackbar('Error', 'Something went wrong');
          }
        },
        codeSent: (verificationId,resendToken){
          this.verificationId.value = verificationId;
        },
        codeAutoRetrievalTimeout: (verificationId){});
  }


  Future<bool> verifyOTP (String otp) async{
    var credentials = await _auth.signInWithCredential(PhoneAuthProvider.credential(verificationId: this.verificationId.value, smsCode: otp),
    );
    return credentials.user != null ? true : false;
  }
}