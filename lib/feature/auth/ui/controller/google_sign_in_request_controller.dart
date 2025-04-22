import 'dart:convert';
import 'package:alwahda/app/assets_path.dart';
import 'package:alwahda/core/network_caller/network_caller.dart';
import 'package:alwahda/feature/auth/data/model/sign_in_user_model.dart';
import 'package:alwahda/feature/auth/ui/controller/auth_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:logger/logger.dart';

class GoogleSignInRequestController extends GetxController{

  User? user;

  Future<bool> signIn()async{
    bool isSuccess = false;
    bool getData = await getGoogleUserdata();
    if(getData){
      final NetWorkCaller netWorkCaller = NetWorkCaller();
      // Load image and convert to Base64
      ByteData bytes = await rootBundle.load(AssetsPath.manAvater);
      List<int> imageBytes = bytes.buffer.asUint8List();
      String base64Image = base64Encode(imageBytes);

        NetworkResponse response = await netWorkCaller.postRequest(
          'http://192.168.0.102/al_wahada/signInwithgoogle',
          {
            'full_name': user?.displayName,
            'gmail': user?.email,
            'image':base64Image,
          },
        );
        if(response.isSuccess){
          isSuccess = true;
          SignInUserModel userModel = SignInUserModel.fromJson(response.responseData!['user']);
          print(userModel.highImage);
          Get.find<AuthController>().saveData(userModel);
          String? image = Get.find<AuthController>().userModel?.midImage;
          print(image);
        }else{
          isSuccess = false;
          Logger().i(response.errorMessage);
        }
    }
    return isSuccess;
  }


  Future<bool>getGoogleUserdata()async{
     final logger = Logger();

    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if (googleUser == null) {
        logger.w("Login cancelled by user.");
        return false;
      }

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      // Firebase Sign-In
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithCredential(credential);

      user = userCredential.user;

      await GoogleSignIn().signOut();
      await FirebaseAuth.instance.signOut();

      // Log user info
      logger.i("👋 Logged out after fetching info.");
    } catch (e, stackTrace) {
      logger.e("❌ Error during sign-in process $e $stackTrace");
    }
    return true;
  }

}