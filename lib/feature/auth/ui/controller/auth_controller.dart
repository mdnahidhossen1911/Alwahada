import 'dart:convert';
import 'package:alwahda/feature/auth/data/model/sign_in_user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController {
  String? uid;
  SignInUserModel? userModel;

  final String _uidKey = 'uidKey';
  final String _modelKey = 'modelKey';

  Future<void> saveData(SignInUserModel userModel) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(_uidKey, userModel.id ?? '');
    await prefs.setString(_modelKey, jsonEncode(userModel));

    uid = userModel.id;
    this.userModel = userModel;
  }

  Future<void> getData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userDataModel = prefs.getString(_modelKey);
    if (userDataModel != null) {
      userModel = SignInUserModel.fromJson(jsonDecode(userDataModel));
      uid = userModel?.id;
    }
  }

  Future<void> updateData(SignInUserModel userModel) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(_uidKey, userModel.id ?? '');
    await prefs.setString(_modelKey, jsonEncode(userModel));
    uid = userModel.id;
    this.userModel = userModel;
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
  }
}
