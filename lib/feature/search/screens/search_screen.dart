import 'package:alwahda/feature/search/screens/search_people_section.dart';
import 'package:alwahda/feature/search/screens/search_post_section.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen>
    with TickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Search',
          style: GoogleFonts.getFont(
            'Inter',
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 14),
            padding: EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
              color: Color(0xfff6f6f6),
            ),
            child: TextField(
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(
                  vertical: 4,
                  horizontal: 8,
                ),
                hintText: 'Search',
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

          TabBar(
            controller: _tabController,
            dividerColor: Colors.grey.shade200,
            indicatorColor: Colors.black,
            labelColor: Colors.black,
            overlayColor: MaterialStateProperty.all<Color>(
              Colors.transparent,
            ),
            onTap: (value) {
              setState(() {});
            },
            tabs: <Widget>[Tab(text: 'Post'), Tab(text: 'People')],
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: const <Widget>[
                Center(child: SearchPostSection()),
                Center(child: SearchPeopleSection()),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
