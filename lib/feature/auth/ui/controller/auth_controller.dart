import 'dart:convert';
import 'package:alwahda/feature/auth/data/model/sign_in_user_model.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController extends GetxController{
  static String? uid;
  static SignInUserModel? userModel;

  static const String _uidKey = 'uidKey';
  static const String _modelKey = 'modelKey';

  static Future<void> saveData(String id,SignInUserModel signInModel) async {
    print(signInModel.uid);
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(_uidKey, signInModel.id ?? '');
    await prefs.setString(_modelKey, jsonEncode(signInModel));
    uid = id;
    userModel = signInModel;
  }

  static Future<void> getData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userDataModel = prefs.getString(_modelKey);
    if (userDataModel != null) {
      userModel = SignInUserModel.fromJson(jsonDecode(userDataModel));
      uid = userModel?.id;
    }
  }

  static Future<void> updateData(SignInUserModel signInModel) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(_uidKey, signInModel.id ?? '');
    await prefs.setString(_modelKey, jsonEncode(signInModel));
    uid = signInModel.id;
    userModel = signInModel;
  }

  static Future<bool> islogIn()async{
    final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? userid = sharedPreferences.getString(_uidKey);
    if(userid !=null){
      getData();
      return true;
    }else{
      return false;
    }
  }

  static Future<void> logOut() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    sharedPreferences.clear();
  }
}
