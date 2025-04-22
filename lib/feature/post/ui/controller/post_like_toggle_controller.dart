import 'package:alwahda/app/urls.dart';
import 'package:alwahda/core/network_caller/network_caller.dart';
import 'package:get/get.dart';

class PostLikeToggleController extends GetxController {
  String? _errorMessage;

  String? get errorMessage => _errorMessage;

  Future<bool> likeToggle(String pid) async {
    bool isSuccess = false;
    NetworkResponse response = await NetWorkCaller().postRequest(
      Urls.likeToggle,
      {'pid': pid},
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
