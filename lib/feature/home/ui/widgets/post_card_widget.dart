import 'package:alwahda/app/assets_path.dart';
import 'package:alwahda/feature/home/data/model/post_model.dart';
import 'package:alwahda/feature/home/ui/widgets/show_bottom_sheet_share_window.dart';
import 'package:alwahda/feature/home/ui/widgets/show_bottom_slider_comment_bar.dart';
import 'package:alwahda/feature/post/screens/post_details_screen.dart';
import 'package:alwahda/feature/post/widget/like_comment_share_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PostCardWidget extends StatefulWidget {
  const PostCardWidget({super.key, this.posts});

  final Posts? posts;

  @override
  State<PostCardWidget> createState() => _PostCardWidgetState();
}

class _PostCardWidgetState extends State<PostCardWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 5),
      padding: EdgeInsets.all(14),
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
                  image: DecorationImage(
                    image: AssetImage(AssetsPath.manAvater),
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
                      widget.posts?.fullName??'',
                      style: GoogleFonts.getFont(
                        'Inter',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      widget.posts?.createdAt??'',
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
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(
                context,
                PostDetailsScreen.name,
                arguments: false,
              );
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.posts?.title??"",
                  style: GoogleFonts.getFont(
                    'Inter',
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    height: 1.3,
                  ),
                ),
                if(widget.posts?.image != '')
                  SizedBox(height: 8),
                if(widget.posts?.image != '')
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    'http://192.168.0.102/al_wahada/${widget.posts?.image}',
                  ),
                ),
                if(widget.posts?.image != '')
                  SizedBox(height: 12),
                Text(
                  widget.posts?.content??"",
                  maxLines: 4,
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
          ),
          SizedBox(height: 12),
          Text(
            '${widget.posts?.totalLikes??0} Like . ${widget.posts?.totalComments??0} Comment . ${widget.posts?.totalComments??0} Share',
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
              Row(
                children: [
                  LikeCommentShareButton(
                    onTab: () {},
                    type: 'Like',
                    icon: widget.posts?.isLiked ==true?
                    Icon(Icons.favorite, color: Colors.red):
                    Icon(Icons.favorite_border, color: Colors.black),
                  ),
                  SizedBox(width: 24),
                  LikeCommentShareButton(
                    onTab: () {
                      Navigator.pushNamed(
                        context,
                        PostDetailsScreen.name,
                        arguments: true,
                      );
                    },
                    type: 'Comment',
                    icon: Icon(Icons.messenger_outline, color: Colors.black),
                  ),
                ],
              ),
              LikeCommentShareButton(
                onTab: () {
                  showBottomSheetShareWindow(context);
                },
                type: 'Share',
                icon: Icon(Icons.share, color: Colors.black),
              ),
            ],
          ),
          Divider(height: 1, color: Colors.grey.shade100),
          SizedBox(height: 14),
          GestureDetector(
            onTap: () {
              showBottomSheetCommentBar(context);
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

}
