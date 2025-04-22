import 'package:alwahda/app/assets_path.dart';
import 'package:flutter/material.dart';

class SearchPeopleSection extends StatefulWidget {
  const SearchPeopleSection({super.key});

  @override
  State<SearchPeopleSection> createState() => _SearchPeopleSectionState();
}

class _SearchPeopleSectionState extends State<SearchPeopleSection> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        padding: EdgeInsets.symmetric(vertical: 8),
        itemBuilder: (context, index) {
        return ListTile(
          contentPadding: EdgeInsets.symmetric(vertical: 2,horizontal: 14,),
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
          ), child: Text('Following',style: TextStyle(color: Colors.black,),),
          ),
        );
      },),
    );
  }
}
