import 'package:alwahda/core/show_snack_bar.dart';
import 'package:alwahda/feature/post/ui/controller/post_comment_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

TextEditingController commentTECotroller = TextEditingController();

Future<dynamic> showBottomSheetCommentBar(BuildContext context,String pid,String title) {
  return showModalBottomSheet(
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
                  Text(
                    'Al-Aqsa Mosque is one of the holiest sites in Islam.',
                    style: GoogleFonts.getFont(
                      'Inter',
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 14),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.grey.shade300),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Expanded(
                          child: TextField(
                            controller: commentTECotroller,
                            maxLines: 5,
                            decoration: InputDecoration(
                              hintText: 'Comment',
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
                        ),
                        IconButton(
                          onPressed: () {
                            addComments(context,pid, commentTECotroller.text.trim());
                          },
                          icon: Icon(Icons.send_rounded),
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
}

Future<void> addComments(BuildContext context,String pid,String comment)async{
  bool isSuccess = await Get.find<PostCommentController>().comments(pid, comment);
  if(isSuccess){
    Get.back();
    showSnackBarMessage(context, 'Commented');
    commentTECotroller.clear();
  }else{
    showSnackBarMessage(context, 'Comment false',true);
  }
}
