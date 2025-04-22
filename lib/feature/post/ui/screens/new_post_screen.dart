import 'dart:convert';

import 'package:alwahda/app/assets_path.dart';
import 'package:alwahda/core/showCircleAlertBox.dart';
import 'package:alwahda/core/show_snack_bar.dart';
import 'package:alwahda/feature/post/data/model/add_post_model.dart';
import 'package:alwahda/feature/post/ui/controller/add_post_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

class NewPostScreen extends StatefulWidget {
  const NewPostScreen({super.key});

  static String name = '/NewPost';

  @override
  State<NewPostScreen> createState() => _NewPostScreenState();
}

class _NewPostScreenState extends State<NewPostScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  final TextEditingController titleTEController = TextEditingController();
  final TextEditingController contentTEController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? _pickedImage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Form(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    key: _formKey,
                    child: Column(
                      children: [
                        SizedBox(height: 16),
                        _buildAuthodInfo(),
                        SizedBox(height: 8),
                        TextFormField(
                          controller: titleTEController,
                          maxLines: null,
                          maxLength: 100,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                          decoration: InputDecoration(
                            hintText: 'Post title ....',
                            fillColor: Colors.white,
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                          ),
                          validator: (value) {
                            if (value?.trim().isEmpty ?? true) {
                              return 'Title';
                            }
                            return null;
                          },
                        ),
                        if (_pickedImage != null) SizedBox(height: 8),
                        if (_pickedImage != null)
                          Stack(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.memory(
                                  base64Decode(_pickedImage!),
                                ),
                              ),
                              Positioned(
                                right: 4,
                                top: 4,
                                child: CircleAvatar(
                                  backgroundColor: Colors.grey.shade200
                                      .withOpacity(0.4),
                                  child: IconButton(
                                    onPressed: () {
                                      _pickedImage = null;
                                      setState(() {});
                                    },
                                    icon: Icon(
                                      Icons.close,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        TextFormField(
                          controller: contentTEController,
                          maxLines: null,
                          maxLength: 1500,
                          style: TextStyle(fontSize: 14),
                          decoration: InputDecoration(
                            hintText: 'Post content .....',
                            fillColor: Colors.white,
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                          ),
                          validator: (value) {
                            if (value?.trim().isEmpty ?? true) {
                              return 'Content';
                            }
                            return null;
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            _buildBottomBar(),
          ],
        ),
      ),
    );
  }

  SizedBox _buildBottomBar() {
    return SizedBox(
      height: 55,
      child: Column(
        children: [
          Divider(height: 1, color: Colors.grey.shade200),
          SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  _pickImage();
                },
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(width: 16),
                    Icon(Icons.image, color: Colors.grey.shade700),
                    SizedBox(width: 8),
                    Text('Add Image'),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Row _buildAuthodInfo() {
    return Row(
      children: [
        Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(
            boxShadow: [BoxShadow(color: Colors.grey.shade400, blurRadius: 1)],
            image: DecorationImage(image: AssetImage(AssetsPath.avater)),
            borderRadius: BorderRadius.circular(40),
            color: Colors.white,
          ),
        ),
        SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Md Nahid Hossen',
                style: GoogleFonts.getFont(
                  'Inter',
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                'new post',
                style: GoogleFonts.getFont(
                  'Inter',
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: Color(0xff9997a5),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(Icons.arrow_back_ios_new),
      ),
      forceMaterialTransparency: true,
      title: Row(
        children: [
          Text(
            'New Post',
            style: GoogleFonts.getFont('Inter', fontWeight: FontWeight.bold),
          ),
        ],
      ),
      actions: [
        ElevatedButton(
          onPressed: () {
            if (_formKey.currentState?.validate() ?? true) {
              addpost();
            }
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blueAccent,
            elevation: 0,
          ),
          child: Text('Post', style: TextStyle(color: Colors.white)),
        ),
        SizedBox(width: 12),
      ],
    );
  }

  Future<void> addpost() async {
    showCircleAlertBox(context);
    bool isSuccess = await Get.find<AddPostController>().Addpost(
      AddPostModel(
        title: titleTEController.text,
        content: contentTEController.text,
        imageBase64: _pickedImage,
      ),
    );
    Navigator.pop(context);
    if (isSuccess) {
      Get.back();
      showSnackBarMessage(context, 'New post uploaded successfully');
    }else{
      showSnackBarMessage(context, "The post isn't uploading properly, there's some problem.",true);
    }
  }

  Future<void> _pickImage() async {
    ImagePicker picker = ImagePicker();
    XFile? _image = await picker.pickImage(source: ImageSource.gallery);
    if (_image != null) {
      List<int> imageBytes = await _image.readAsBytes();
      _pickedImage = base64Encode(imageBytes);
      setState(() {});
    }
  }

  @override
  void dispose() {
    titleTEController.dispose();
    contentTEController.dispose();
    super.dispose();
  }
}
