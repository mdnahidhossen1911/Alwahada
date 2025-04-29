import 'package:alwahda/app/urls.dart';
import 'package:alwahda/core/network_caller/network_caller.dart';
import 'package:alwahda/feature/home/data/model/post_model.dart';
import 'package:get/get.dart';

class ProductDetailsController extends GetxController {
  bool _inProgress = false;
  bool _paginationInProgress = false;
  String _errorMassage = '';

  List<Comments> _commentsList = [];
  int _totalLikes = 0;
  int _totalComments = 0;
  int _totalShares = 0;

  int? _nextPage = 1;
  int _getDataCount = 10;

  bool get inProgress => _inProgress;

  bool get paginationInProgress => _paginationInProgress;

  String get errorMassage => _errorMassage;

  List<Comments> get commentsList => _commentsList;

  int get totalLikes => _totalLikes;

  int get totalComments => _totalComments;

  int get totalShares => _totalShares;

  Future<bool> getPostDetails(String pid) async {
    bool isSuccess = false;

    if (_nextPage == null || _nextPage == 0) {
      return false;
    }
    if (_paginationInProgress) {
      return true;
    }
    if (_nextPage != null && _nextPage == 1) {
      _inProgress = true;
    } else {
      _paginationInProgress = true;
    }
    update();

    NetworkResponse response = await NetWorkCaller().postRequest(
      Urls.postDetails,
      {"pid": pid, "page": _nextPage, "limit": _getDataCount},
    );
    if (response.statusCode == 200) {
      isSuccess = true;
      _errorMassage = '';
      _commentsList.addAll(
        (response.responseData!['posts']['comments'] as List)
            .map((json) => Comments.fromJson(json))
            .toList(),
      );
      _nextPage = response.responseData!['posts']['pagination']['next_page'];
      _totalLikes = response.responseData!['posts']['total_likes'];
      _totalComments = response.responseData!['posts']['total_comments'];
      _totalShares = response.responseData!['posts']['total_shares'];
    } else {
      _errorMassage = response.errorMessage;
      isSuccess = false;
    }

    await Future.delayed(Duration(seconds: 2));
    _inProgress = false;
    _paginationInProgress = false;
    update();
    return isSuccess;
  }

  void refrash(String pid){
    _nextPage = 1;
    _commentsList.clear();
    getPostDetails(pid);
  }
}
