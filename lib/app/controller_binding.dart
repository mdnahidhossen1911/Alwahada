import 'package:alwahda/feature/auth/ui/controller/auth_controller.dart';
import 'package:alwahda/feature/auth/ui/controller/google_sign_in_request_controller.dart';
import 'package:alwahda/feature/home/ui/controller/home_get_data_controller.dart';
import 'package:alwahda/feature/post/ui/controller/add_post_controller.dart';
import 'package:alwahda/feature/post/ui/controller/post_comment_controller.dart';
import 'package:alwahda/feature/post/ui/controller/post_like_toggle_controller.dart';
import 'package:get/get.dart';

class ControllerBinder extends Bindings{
  @override
  void dependencies() {
    Get.put(AuthController());
    Get.lazyPut(()=>GoogleSignInRequestController());
    Get.lazyPut(()=>HomeGetDataController());
    Get.lazyPut(()=>AddPostController());
    Get.lazyPut(()=>PostLikeToggleController());
    Get.lazyPut(()=>PostCommentController());
  }
}
