import 'package:alwahda/app/assets_path.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
                  child: Column(
                    children: [
                      SizedBox(height: 16),
                      _buildAuthodInfo(),
                      SizedBox(height: 8),
                      TextField(
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
                        onChanged: (value) {
                          int tlenth = value.length;
                          setState(() {});
                        },
                      ),
                      TextField(
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
                        onChanged: (value) {
                          setState(() {});
                        },
                      ),
                    ],
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
            image: DecorationImage(image: AssetImage(AssetsPath.manAvater)),
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
          onPressed: () {},
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
}
