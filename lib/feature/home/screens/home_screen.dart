import 'package:alwahda/feature/home/widgets/home_share_knowlage_bar.dart';
import 'package:alwahda/feature/home/widgets/post_card_widget.dart';
import 'package:alwahda/feature/post/screens/new_post_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: ColoredBox(
        color: Color(0x24aeaeae),
        child: ListView(
          children: [
            HomeShareKnowlageBar(
              ontab: () {
                Navigator.pushNamed(context, NewPostScreen.name);
              },
            ),
            PostCardWidget(),
            PostCardWidget(),
            PostCardWidget(),
          ],
        ),
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      title: Text(
        'alwahada',
        style: GoogleFonts.getFont(
          'Lily Script One',
          fontSize: 28,
          fontWeight: FontWeight.w500,
        ),
      ),
      forceMaterialTransparency: true,
      actions: [
        CircleAvatar(
          backgroundColor: Colors.grey.shade100,
          child: IconButton(
            onPressed: () {
              Navigator.pushNamed(context, NewPostScreen.name);
            },
            icon: Icon(Icons.edit_rounded, color: Colors.black),
          ),
        ),
        SizedBox(width: 12),
      ],
    );
  }
}

