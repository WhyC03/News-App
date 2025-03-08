import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:news_app/models/user_model.dart';

class AuthController extends GetxController {
  final auth = FirebaseAuth.instance;
  final db = FirebaseFirestore.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  RxBool isLoading1 = false.obs;
  RxBool isLoading2 = false.obs;

  Future<void> signUp(
    String email,
    String password,
  ) async {
    isLoading1.value == true;
    try {
      await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      await initUser(email);
      log("Account Created");
      log(email);
      log(auth.currentUser!.uid);

      Get.offAllNamed('/home-screen');
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        log("The password provided is too weak");
      } else if (e.code == 'email-already-in-use') {
        log("User with this email exist!!");
      }
    } catch (e) {
      log(e.toString());
    }
    isLoading1.value == false;
  }

  Future<void> signIn(String email, String password) async {
    try {
      isLoading1.value = true;
      await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      isLoading1.value = false;
      Get.offAllNamed('/home-screen');
    } on FirebaseAuthException catch (e) {
      isLoading1.value = false;
      Get.snackbar(
        'Error',
        e.message ?? 'An error occurred',
        snackPosition: SnackPosition.BOTTOM,
      );
    } catch (e) {
      log(e.toString());
    }
  }

  Future<void> initUser(
    String email,
  ) async {
    var newUser = UserModel(
      email: email,
      id: auth.currentUser!.uid,
    );

    try {
      await db
          .collection("users")
          .doc(auth.currentUser!.uid)
          .set(newUser.toJson());
    } catch (e) {
      log(e.toString());
    }
  }

  Future<void> signOut() async {
    await auth.signOut();
    Get.offAllNamed('/auth-screen');
  }

  Future<void> signInWithGoogle() async {
    try {
      isLoading2.value = true;

      // Trigger the Google Sign In process
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

      if (googleUser == null) {
        isLoading2.value = false;
        return;
      }

      // Obtain auth details from request
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      // Create credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      // Sign in to Firebase with the Google credential
      final UserCredential userCredential =
          await auth.signInWithCredential(credential);

      // Initialize user in Firestore if it's a new user
      if (userCredential.additionalUserInfo?.isNewUser ?? false) {
        await initUser(googleUser.email);
      }

      isLoading2.value = false;
      Get.offAllNamed('/home-screen');
    } on FirebaseAuthException catch (e) {
      isLoading2.value = false;
      Get.snackbar(
        'Error',
        e.message ?? 'An error occurred during Google sign in',
        snackPosition: SnackPosition.BOTTOM,
      );
    } catch (e) {
      isLoading2.value = false;
      log('Google sign in error: ${e.toString()}');
    }
  }

  Future<void> googleSignOut() async {
    try {
      await _googleSignIn.signOut();
      await signOut();
    } catch (e) {
      log('Google sign out error: ${e.toString()}');
    }
  }
}
