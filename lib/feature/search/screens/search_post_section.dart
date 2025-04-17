import 'package:alwahda/feature/home/widgets/post_card_widget.dart';
import 'package:flutter/material.dart';

class SearchPostSection extends StatefulWidget {
  const SearchPostSection({super.key});

  @override
  State<SearchPostSection> createState() => _SearchPostSectionState();
}

class _SearchPostSectionState extends State<SearchPostSection> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0x35aeaeae),
      body: ListView.builder(itemBuilder: (context, index) {
        return PostCardWidget();
      },),
    );
  }
}
