import 'package:alwahda/app/urls.dart';
import 'package:alwahda/core/network_caller/network_caller.dart';
import 'package:alwahda/feature/post/data/model/add_post_model.dart';
import 'package:get/get.dart';

class AddPostController extends GetxController{
  bool _inProgress = false;
  bool get inProgress =>_inProgress;
  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  Future<bool> Addpost(AddPostModel addPostModel)async{
    bool isSuccess = false;
    _inProgress = true;
    update();
    NetworkResponse response = await NetWorkCaller().postRequest(Urls.createPost, addPostModel.tojson());
    if(response.isSuccess){
      isSuccess = true;
      _errorMessage ='';
    }else{
      isSuccess = false;
      _errorMessage = response.errorMessage;
    }
    _inProgress = false;
    update();
    return isSuccess;
  }
}