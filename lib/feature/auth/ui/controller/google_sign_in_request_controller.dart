import 'package:alwahda/app/urls.dart';
import 'package:alwahda/core/network_caller/network_caller.dart';
import 'package:alwahda/feature/auth/data/model/sign_in_user_model.dart';
import 'package:alwahda/feature/auth/ui/controller/auth_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:logger/logger.dart';

class GoogleSignInRequestController extends GetxController {
  User? user;
  bool _inProgress = false;

  bool get inProgress => _inProgress;

  Future<bool> signIn() async {
    bool isSuccess = false;
    _inProgress = true;
    update();
    bool getData = await getGoogleUserdata();
    if (getData) {
      final NetWorkCaller netWorkCaller = NetWorkCaller();
      NetworkResponse response = await netWorkCaller.postRequest(
        Urls.signInWithGoogle,
        {
          'full_name': user?.displayName,
          'gmail': user?.email
        },
      );
      if (response.isSuccess) {
        isSuccess = true;
        SignInUserModel userModel = SignInUserModel.fromJson(
          response.responseData!['user'],
        );
        await AuthController.saveData(userModel.id??'',userModel);
      } else {
        isSuccess = false;
        Logger().i(response.errorMessage);
      }
    }
    _inProgress = false;
    update();
    return isSuccess;
  }

  Future<bool> getGoogleUserdata() async {
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
