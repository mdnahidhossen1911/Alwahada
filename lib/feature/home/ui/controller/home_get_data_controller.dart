import 'package:alwahda/app/urls.dart';
import 'package:alwahda/core/network_caller/network_caller.dart';
import 'package:alwahda/feature/home/data/model/post_model.dart';
import 'package:get/get.dart';

class HomeGetDataController extends GetxController {
  bool _inProgress = false;
  bool get inProgress => _inProgress;

  PostModel? _postModel;
  List<Posts>? get postList => _postModel?.posts;

  String _errorMessage = '';
  String get errorMessage => _errorMessage;

  Future<bool> homeAPi()async{
    bool isSuccess = false;
    _inProgress = true;
    update();
    NetworkResponse response = await NetWorkCaller().getRequest(Urls.getPost);
    if(response.statusCode ==200){
      isSuccess = true;
      _errorMessage = '';
      _postModel = PostModel.fromJson(response.responseData!);
      print(_postModel?.posts?.length);
    }else{
      _errorMessage = response.errorMessage;
      isSuccess = false;
    }

    _inProgress = false;
    update();
    return isSuccess;
  }
}
