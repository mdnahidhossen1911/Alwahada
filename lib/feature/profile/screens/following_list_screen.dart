import 'package:alwahda/app/assets_path.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FollowingListScreen extends StatefulWidget {
  const FollowingListScreen({super.key});

  static String name= '/followingListScreen';

  @override
  State<FollowingListScreen> createState() => _FollowingListScreenState();
}

class _FollowingListScreenState extends State<FollowingListScreen> {
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
                'Following',
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
        child: ListView.builder(
          padding: EdgeInsets.symmetric(vertical: 8),
          itemBuilder: (context, index) {
            return Center(
              child: ListTile(
                contentPadding: EdgeInsets.symmetric(vertical: 2,horizontal: 16,),
                leading: CircleAvatar(
                  backgroundImage: AssetImage(AssetsPath.avater),
                  backgroundColor: Colors.grey.shade100,
                ),
                title: Text('MD Nahid Hossen'),
                subtitle: Text('0 followers'),
                trailing: ElevatedButton(onPressed: () {
                },
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    backgroundColor: Colors.grey.shade100,
                    foregroundColor: Colors.grey,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                    side: BorderSide.none
                  ), child: Text('Following',style: TextStyle(color: Colors.black,),),
                ),
              ),
            );
          },),
      ),
    );
  }
}
