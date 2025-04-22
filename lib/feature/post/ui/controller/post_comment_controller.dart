import 'package:alwahda/app/urls.dart';
import 'package:alwahda/core/network_caller/network_caller.dart';
import 'package:get/get.dart';

class PostCommentController extends GetxController {
  String? _errorMessage;

  String? get errorMessage => _errorMessage;

  Future<bool> comments(String pid,String comment) async {
    bool isSuccess = false;
    NetworkResponse response = await NetWorkCaller().postRequest(
      Urls.postComment,
      {'pid': pid,'comment':comment},
    );
    if (response.isSuccess) {
      isSuccess = true;
      _errorMessage = '';
    } else {
      isSuccess = false;
      _errorMessage = response.errorMessage;
    }
    return isSuccess;
  }
}
