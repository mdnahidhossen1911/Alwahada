import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerController extends GetxController{
  XFile? _image;
  XFile? get image => _image;

  Future<void> pick(XFile image)async{
    _image = image;
    update();
  }

}