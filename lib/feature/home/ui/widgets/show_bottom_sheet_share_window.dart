import 'package:alwahda/app/assets_path.dart';
import 'package:alwahda/app/urls.dart';
import 'package:alwahda/core/show_snack_bar.dart';
import 'package:alwahda/feature/home/data/model/post_model.dart';
import 'package:alwahda/feature/post/ui/controller/add_share_post_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

TextEditingController _content = TextEditingController();

Future<bool> showBottomSheetShareWindow(BuildContext context, Posts? posts) async {
  bool isShare = false;
  showModalBottomSheet(
    backgroundColor: Colors.white,
    isScrollControlled: true,
    context: context,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(8)),
    ),
    builder: (context) {
      return SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.all(14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.shade400,
                              blurRadius: 1,
                            ),
                          ],
                          image: DecorationImage(
                            image: AssetImage(AssetsPath.avater),
                          ),
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
                              'Share post',
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
                      ElevatedButton(
                        onPressed: () async {
                          if(_content.text.isNotEmpty){
                          isShare =  await _addSharePost(
                              context,
                              posts!.pid.toString(),
                              _content.text.trim(),
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blueAccent,
                          elevation: 0,
                        ),
                        child: Text(
                          'Share',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                  TextField(
                    minLines: 1,
                    maxLines: 5,
                    controller: _content,
                    decoration: InputDecoration(
                      hintText: 'Write Samthing.........',
                      hintStyle: TextStyle(color: Colors.grey.shade500),
                      filled: true,
                      fillColor: Colors.transparent,
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide.none,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                  SizedBox(height: 8),
                  Container(
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.grey.shade300),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.shade400,
                                    blurRadius: 1,
                                  ),
                                ],
                                image: DecorationImage(
                                  image: AssetImage(AssetsPath.avater),
                                ),
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
                                    posts?.fullName ?? '',
                                    style: GoogleFonts.getFont(
                                      'Inter',
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Text(
                                    posts?.createdAt ?? '',
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
                        ),
                        SizedBox(height: 4),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              posts?.title ?? '',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.getFont(
                                'Inter',
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                height: 1.3,
                              ),
                            ),
                            SizedBox(height: 8),
                            if (posts?.image != '') SizedBox(height: 4),
                            if (posts?.image != '')
                              AspectRatio(
                                aspectRatio: 16 / 9,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Image.network(
                                    '${Urls.baseUrl}/${posts?.image}',
                                    fit: BoxFit.fitWidth,
                                  ),
                                ),
                              ),
                            if (posts?.image != '') SizedBox(height: 12),
                            Text(
                              posts?.content ?? '',
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.getFont(
                                'Inter',
                                fontSize: 14,
                                height: 1.3,
                                color: Colors.grey.shade900,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    },
  );
  return isShare;
}

Future<bool> _addSharePost(
  BuildContext context,
  String pid,
  String content,
) async {
  bool isSuccess = await Get.find<AddSharePostController>().shared(
    pid,
    content,
  );
  if (isSuccess) {
    Get.back();
    showSnackBarMessage(context, 'Share post');
    return true;
  } else {
    showSnackBarMessage(context, 'shared false', true);
    return false;
  }
}
