import 'package:alwahda/app/urls.dart';
import 'package:alwahda/core/network_caller/network_caller.dart';
import 'package:get/get.dart';

class AddSharePostController extends GetxController {
  String? _errorMessage;

  String? get errorMessage => _errorMessage;

  Future<bool> shared(String pid,String content) async {
    bool isSuccess = false;
    NetworkResponse response = await NetWorkCaller().postRequest(
      Urls.createSharePost,
      {'pid': pid,'content':content},
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
