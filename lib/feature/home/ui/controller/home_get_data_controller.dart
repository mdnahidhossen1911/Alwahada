import 'package:alwahda/app/urls.dart';
import 'package:alwahda/core/network_caller/network_caller.dart';
import 'package:alwahda/feature/home/data/model/post_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';

class HomeGetDataController extends GetxController {
  bool _inProgress = false;
  bool _paginationInProgress = false;
  String _errorMessage = '';
  List<Posts>? _posts = [];
  final int _getDataCount = 15;
  int? _nextPage = 1;

  bool get inProgress => _inProgress;
  bool get paginationInProgress => _paginationInProgress;
  List<Posts>? get postList => _posts;
  String get errorMessage => _errorMessage;

  Future<bool> homeAPi()async{
    bool isSuccess = false;

    if(_nextPage ==null || _nextPage ==0){
      return false;
    }
    if(_paginationInProgress){
      return true;
    }
    if(_nextPage !=null && _nextPage ==1){
      _inProgress = true;
    }else{
      _paginationInProgress = true;
    }
    update();


    NetworkResponse response = await NetWorkCaller().getRequest("${Urls.getPost}?page=$_nextPage&limit=$_getDataCount");
    if(response.statusCode ==200){
      isSuccess = true;
      _errorMessage = '';
      _posts!.addAll((response.responseData!['posts'] as List)
          .map((json) => Posts.fromJson(json))
          .toList());
      _nextPage = response.responseData!['next_page'];
    }else{
      _errorMessage = response.errorMessage;
      isSuccess = false;
    }

    _inProgress = false;
    _paginationInProgress = false;
    update();
    return isSuccess;
  }

  void likeToggleAndCountUpdate(Posts post,bool likeStatus){
    post.updateLikeCount(likeStatus);
    update();
  }

   Future<void> commentNumberUpdate(Posts post,int count)async{
    await post.updateCommentCunt();
    update();
   }

  void refrash(){
    _nextPage = 1;
    _posts!.clear();
    homeAPi();
  }
}
