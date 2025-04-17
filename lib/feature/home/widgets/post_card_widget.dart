import 'package:alwahda/app/assets_path.dart';
import 'package:alwahda/feature/home/widgets/show_bottom_sheet_share_window.dart';
import 'package:alwahda/feature/home/widgets/show_bottom_slider_comment_bar.dart';
import 'package:alwahda/feature/post/screens/post_details_screen.dart';
import 'package:alwahda/feature/post/widget/like_comment_share_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PostCardWidget extends StatefulWidget {
  const PostCardWidget({super.key});

  @override
  State<PostCardWidget> createState() => _PostCardWidgetState();
}

class _PostCardWidgetState extends State<PostCardWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 3),
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
                      'Md Nahid Hossen',
                      style: GoogleFonts.getFont(
                        'Inter',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      '23 sep 2024',
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
              children: [
                Text(
                  'Al-Aqsa Mosque is one of the holiest sites in Islam.',
                  style: GoogleFonts.getFont(
                    'Inter',
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    height: 1.3,
                  ),
                ),
                SizedBox(height: 8),
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    'https://muslimhands.org.uk/_ui/images/d58861348753.png',
                  ),
                ),
                SizedBox(height: 12),
                Text(
                  'Al-Aqsa Mosque is one of the holiest sites in Islam, located in the Old City of Jerusalem. It is part of the larger Al-Haram al-Sharif (the Noble Sanctuary), which also includes the Dome of the Rock.',
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
            '1 Like . 1 Comment . 1 Share',
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
                    icon: Icon(Icons.favorite_border, color: Colors.black),
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
