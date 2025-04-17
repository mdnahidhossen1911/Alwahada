import 'package:alwahda/app/assets_path.dart';
import 'package:alwahda/feature/post/screens/post_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PostCardWidget extends StatelessWidget {
  const PostCardWidget({super.key});

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
                  TextButton(
                    onPressed: () {},
                    child: Row(
                      children: [
                        Icon(Icons.favorite_border, color: Colors.black),
                        SizedBox(width: 8),
                        Text(
                          'Like',
                          style: GoogleFonts.getFont(
                            'Inter',
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 16),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, PostDetailsScreen.name);
                    },
                    child: Row(
                      children: [
                        Icon(Icons.mode_comment_outlined, color: Colors.black),
                        SizedBox(width: 8),
                        Text(
                          'Comment',
                          style: GoogleFonts.getFont(
                            'Inter',
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              TextButton(
                onPressed: () {},
                child: Row(
                  children: [
                    Icon(Icons.share, color: Colors.black),
                    SizedBox(width: 8),
                    Text(
                      'Share',
                      style: GoogleFonts.getFont('Inter', color: Colors.black),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Divider(height: 1, color: Colors.grey.shade100),
          SizedBox(height: 14),
          GestureDetector(
            onTap: () {},
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
