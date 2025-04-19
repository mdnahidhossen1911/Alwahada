import 'package:alwahda/app/assets_path.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  static String name = '/setting';

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios_new_outlined),
        ),
        forceMaterialTransparency: true,
        title: Row(
          children: [
            Expanded(
              child: Text(
                'Setting',
                style: GoogleFonts.getFont(
                  'Inter',
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(width: 24),
          ],
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            ListTile(
              leading: CircleAvatar(
                radius: 22,
                backgroundColor: Colors.grey.shade100,
                backgroundImage: AssetImage(AssetsPath.manAvater),
              ),
              title: Text(
                'MD Nahid Hossen',
                style: GoogleFonts.getFont(
                  'Inter',
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
              subtitle: Text(
                'md.nahidhossen1911@gmail.com',
                style: GoogleFonts.getFont(
                  'Inter',
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: Colors.grey,
                ),
              ),
            ),
            Divider(color: Colors.grey.shade200),
            ListTile(
              leading: Icon(CupertinoIcons.person_alt_circle),
              title: Text('Personal information'),
            ),
            ListTile(
              leading: Icon(Icons.light_mode),
              title: Text('Theme Mode'),
            ),
            ListTile(
              leading: Icon(CupertinoIcons.lock),
              title: Text('Privacy policy'),
            ),
            ListTile(
              leading: Icon(Icons.library_books_outlined),
              title: Text('Terms & Conditions'),
            ),
            ListTile(
              leading: Icon(Icons.messenger_outline),
              title: Text('Report Inbox'),
            ),
            ListTile(leading: Icon(CupertinoIcons.info), title: Text('About')),
            ListTile(leading: Icon(Icons.logout), title: Text('LogOut')),
            Spacer(),
            Text(
              'alwahada',
              style: GoogleFonts.getFont(
                'Lily Script One',
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              '''
Alwahada — A platform for gain knowlage.
Powered by Nahid Hossen | © 2025
              ''',
              textAlign: TextAlign.center,
              style: GoogleFonts.getFont(
                'Inter',
                fontSize: 14,
                fontWeight: FontWeight.w300,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
