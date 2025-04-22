import 'dart:convert';
import 'package:alwahda/feature/auth/data/model/sign_in_user_model.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController extends GetxController{
  String? uid;
  SignInUserModel? userModel;

  final String _uidKey = 'uidKey';
  final String _modelKey = 'modelKey';

  Future<void> saveData(SignInUserModel signInModel) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(_uidKey, signInModel.id ?? '');
    await prefs.setString(_modelKey, jsonEncode(signInModel));
    uid = signInModel.uid;
    userModel = SignInUserModel.fromJson(signInModel.toJson());
    update();
  }

  Future<void> getData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userDataModel = prefs.getString(_modelKey);
    if (userDataModel != null) {
      userModel = SignInUserModel.fromJson(jsonDecode(userDataModel));
      uid = userModel?.id;
    }
    update();
  }

  Future<void> updateData(SignInUserModel userModel) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(_uidKey, userModel.id ?? '');
    await prefs.setString(_modelKey, jsonEncode(userModel));
    uid = userModel.id;
    this.userModel = userModel;
    update();
  }

  Future<bool> islogIn()async{
    final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? userid = sharedPreferences.getString(_uidKey);
    if(userid !=null){
      getData();
      return true;
    }else{
      return false;
    }
  }

  Future<void> logOut() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    sharedPreferences.clear();
    uid = null;
    userModel = null;
    update();
  }
}
