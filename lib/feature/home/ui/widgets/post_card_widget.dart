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

class PostCardWidget extends StatefulWidget {
  const PostCardWidget({
    super.key,
    this.posts,
    required this.likeToggle,
    required this.commentCount,
  });

  final Function(bool likeStatus) likeToggle;
  final Function(int count) commentCount;
  final Posts? posts;

  @override
  State<PostCardWidget> createState() => _PostCardWidgetState();
}

class _PostCardWidgetState extends State<PostCardWidget> {
  TextEditingController commentTEController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

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
                  color: Colors.grey.shade50,
                  borderRadius: BorderRadius.circular(40),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(
                    '${Urls.baseUrl}/${widget.posts!.avater}',
                    errorBuilder: (context, error, stackTrace) {
                      return Image.asset(AssetsPath.avater);
                    },
                  ),
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.posts?.fullName ?? '',
                      style: GoogleFonts.getFont(
                        'Inter',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      widget.posts?.createdAt ?? '',
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
          SizedBox(height: 4),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.posts?.title ?? "",
                style: GoogleFonts.getFont(
                  'Inter',
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  height: 1.3,
                ),
              ),
              SizedBox(height: 4),
              if (widget.posts?.image != '') SizedBox(height: 4),
              if (widget.posts?.image != '')
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    '${Urls.baseUrl}/${widget.posts?.image}',
                    errorBuilder: (context, error, stackTrace) {
                      return Icon(Icons.error);
                    },
                  ),
                ),
              if (widget.posts?.image != '') SizedBox(height: 12),
              ReadMoreText(
                widget.posts!.content ?? '',
                style: GoogleFonts.getFont('Inter', fontSize: 13, height: 1.3),
                trimMode: TrimMode.Line,
                trimLines: 4,
                colorClickableText: Colors.grey,
                trimCollapsedText: '...Show more',
                trimExpandedText: '...Show less',
                moreStyle: TextStyle(fontSize: 12, color: Colors.grey),
              ),
            ],
          ),
          SizedBox(height: 12),
          Text(
            '${widget.posts?.totalLikes ?? 0} Like . ${widget.posts?.totalComments ?? 0} Comment . ${widget.posts?.totalShares ?? 0} Share',
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
                  widget.likeToggle(
                    widget.posts!.isLiked == true ? false : true,
                  );
                },
                type: 'Like',
                icon:
                    widget.posts?.isLiked == true
                        ? Icon(Icons.favorite, color: Colors.red)
                        : Icon(Icons.favorite_border, color: Colors.black),
              ),
              LikeCommentShareButton(
                onTab: () {},
                type: 'Comment',
                icon: Icon(Icons.messenger_outline, color: Colors.black),
              ),
              LikeCommentShareButton(
                onTab: () async {
                  bool isSuccess = await showBottomSheetShareWindow(
                    context,
                    widget.posts,
                  );
                  if (isSuccess) {}
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
              showBottomSheetCommentBar(
                context,
                widget.posts,
                widget.posts?.title ?? '',
              );
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
                      title,
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
      widget.commentCount(1);
      commentTEController.clear();
    } else {
      showSnackBarMessage(context, 'Comment false', true);
    }
  }
}
