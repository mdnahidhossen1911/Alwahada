import 'package:alwahda/app/assets_path.dart';
import 'package:alwahda/app/urls.dart';
import 'package:alwahda/core/show_snack_bar.dart';
import 'package:alwahda/feature/home/data/model/post_model.dart';
import 'package:alwahda/feature/home/ui/widgets/show_bottom_sheet_share_window.dart';
import 'package:alwahda/feature/post/ui/controller/post_comment_controller.dart';
import 'package:alwahda/feature/post/ui/widget/like_comment_share_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:readmore/readmore.dart';

class SharePostCardWidget extends StatelessWidget {
  SharePostCardWidget({
    super.key,
    this.posts,
    required this.likeToggle,
    required this.commentCount,
  });

  final Function(bool likeStatus) likeToggle;
  final Function(int count) commentCount;
  final Posts? posts;

  final TextEditingController commentTEController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 5),
      padding: EdgeInsets.only(top: 14, left: 14, right: 14, bottom: 12),
      color: Colors.white,
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
                    BoxShadow(color: Colors.grey.shade400, blurRadius: 1),
                  ],

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
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.more_horiz, color: Colors.black),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 4),
              if (posts?.image != '') SizedBox(height: 4),
              if (posts?.image != '')
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network('${Urls.baseUrl}/${posts?.image}'),
                ),
              if (posts?.image != '') SizedBox(height: 12),
              ReadMoreText(
                posts!.content ?? '',
                style: GoogleFonts.getFont('Inter', fontSize: 13, height: 1.3),
                trimMode: TrimMode.Line,
                trimLines: 4,
                colorClickableText: Colors.grey,
                trimCollapsedText: '...Show more',
                trimExpandedText: '...Show less',
                moreStyle: TextStyle(fontSize: 14, color: Colors.black),
              ),
              SizedBox(height: 8),
              _buildShareSection(),
            ],
          ),
          SizedBox(height: 4),
          Text(
            '${posts?.totalLikes ?? 0} Like . ${posts?.totalComments ?? 0} Comment . ${posts?.totalShares ?? 0} Share',
            style: GoogleFonts.getFont(
              'Inter',
              fontSize: 12,
              color: Colors.grey,
            ),
          ),
          SizedBox(height: 10),
          Divider(height: 1, color: Colors.grey.shade100),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              LikeCommentShareButton(
                onTab: () {
                  likeToggle(posts!.isLiked == true ? false : true);
                },
                type: 'Like',
                icon:
                    posts?.isLiked == true
                        ? Icon(Icons.favorite, color: Colors.red)
                        : Icon(Icons.favorite_border, color: Colors.black),
              ),
              LikeCommentShareButton(
                onTab: () {},
                type: 'Comment',
                icon: Icon(Icons.messenger_outline, color: Colors.black),
              ),
              LikeCommentShareButton(
                onTab: () {
                  showBottomSheetShareWindow(context,posts);
                },
                type: 'Share',
                icon: Icon(Icons.share, color: Colors.black),
              ),
            ],
          ),
          Divider(height: 1, color: Colors.grey.shade100),
          SizedBox(height: 12),
          GestureDetector(
            onTap: () {
              showBottomSheetCommentBar(context, posts, posts?.shareInfo?.content ?? '');
            },
            child: Container(
              height: 40,
              padding: EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                color: Color(0xfff6f6f6),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Write comment....',
                    style: GoogleFonts.getFont(
                      'Poppins',
                      fontWeight: FontWeight.w300,
                      fontSize: 12,
                      color: Color(0xff9d9d9d),
                    ),
                  ),
                  Icon(Icons.send, color: Color(0xc29d9d9d)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container _buildShareSection() {
    return Container(
      margin: EdgeInsets.only(bottom: 5),
      padding: EdgeInsets.only(top: 14, left: 14, right: 14, bottom: 14),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                height: 35,
                width: 35,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(color: Colors.grey.shade400, blurRadius: 1),
                  ],
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
                      posts?.shareInfo?.fullName ?? '',
                      style: GoogleFonts.getFont(
                        'Inter',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      posts?.shareInfo?.createdAt ?? 'no date',
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
                posts?.shareInfo?.title ?? "",
                style: GoogleFonts.getFont(
                  'Inter',
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  height: 1.3,
                ),
              ),
              SizedBox(height: 4),
              if (posts?.shareInfo?.image != '') SizedBox(height: 4),
              if (posts?.shareInfo?.image != '')
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    '${Urls.baseUrl}/${posts?.shareInfo?.image}',
                  ),
                ),
              if (posts?.shareInfo?.image != '') SizedBox(height: 12),
              Text(
                posts?.shareInfo?.content ?? '',
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 12, color: Colors.grey),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Future<dynamic> showBottomSheetCommentBar(
    BuildContext context,
    Posts? post,
    String title,
  ) {
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
                      post?.content??'',
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
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
                              controller: commentTEController,
                              maxLines: 5,
                              decoration: InputDecoration(
                                hintText: 'Comment',
                                hintStyle: TextStyle(
                                  color: Colors.grey.shade500,
                                ),
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
                              addComments(
                                context,
                                '${post?.pid}',
                                commentTEController.text.trim(),
                              );
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

  Future<void> addComments(
    BuildContext context,
    String pid,
    String comment,
  ) async {
    bool isSuccess = await Get.find<PostCommentController>().comments(
      pid,
      comment,
    );
    if (isSuccess) {
      Get.back();
      showSnackBarMessage(context, 'Commented');
      commentCount(1);
      commentTEController.clear();
    } else {
      showSnackBarMessage(context, 'Comment false', true);
    }
  }
}
