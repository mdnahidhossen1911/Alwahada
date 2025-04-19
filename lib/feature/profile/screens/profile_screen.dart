import 'dart:math' as math;
import 'package:alwahda/feature/search/screens/search_post_section.dart';
import 'package:alwahda/feature/setting/screens/setting_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen>
    with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Profile',
          style: GoogleFonts.inter(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: Colors.black,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, SettingScreen.name);
            },
            icon: Transform.rotate(
                  angle: 180 * math.pi / 180,
                child: const Icon(Icons.menu_open_sharp, color: Colors.black)),
          ),
        ],
        forceMaterialTransparency: true,
      ),
      body: NestedScrollView(
        physics: BouncingScrollPhysics(),
        headerSliverBuilder: (_, __) {
          return [
            SliverToBoxAdapter(child: _buildProfileHeader()),
            SliverAppBar(
              pinned: true,
              floating: true,
              toolbarHeight: 0,
              backgroundColor: Colors.white,
              surfaceTintColor: Colors.white,
              forceMaterialTransparency: false,
              bottom: TabBar(
                controller: _tabController,
                indicatorColor: Colors.black,
                indicatorSize: TabBarIndicatorSize.tab,
                dividerColor: Colors.grey.shade200,
                overlayColor: WidgetStateProperty.all<Color>(
                  Colors.transparent,
                ),
                labelColor: Colors.black,
                unselectedLabelColor: Colors.grey,
                tabs: const [Tab(text: 'Post'), Tab(text: 'About')],
              ),
            ),
          ];
        },
        body: TabBarView(
          controller: _tabController,
          children:  [
            SearchPostSection(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                spacing: 8,
                children: [
                  SizedBox(height: 12),
                  Row(
                    children: [
                      Icon(Icons.calendar_month,color: Colors.grey.shade800,),
                      SizedBox(width: 8),
                      Text('Joined 23 April 2025')
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.work,color: Colors.grey.shade800),
                      SizedBox(width: 8),
                      Text('Founder of AL Wahada')
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.school,color: Colors.grey.shade800),
                      SizedBox(width: 8),
                      Text('Computer Science andTechnology')
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.location_history_rounded,color: Colors.grey.shade800),
                      SizedBox(width: 8),
                      Text('Santosh, Tangail 1902')
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileHeader() {
    return Column(
      children: [
        Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 170,
                  width: double.infinity,
                  child: Image.network(
                    'https://siratinitiative.net/images/f02c9473f9e0167349d9dab654bff76b.jpg',
                    fit: BoxFit.fitWidth,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16, left: 16, right: 148),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'MD Nahid Hossen',
                        style: GoogleFonts.inter(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        '@mdnahidhossen',
                        style: GoogleFonts.inter(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      ),
                      SizedBox(height: 6),
                      Text(
                        '1K followers • 500 following',
                        style: TextStyle(
                          fontSize: 12.5,
                          color: Colors.grey.shade700,
                        ),
                      ),
                      SizedBox(height: 4),
                      RichText(
                        text: TextSpan(
                          style: GoogleFonts.inter(
                            fontSize: 13,
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                          ),
                          children: [
                            WidgetSpan(
                              child: Icon(Icons.edit_rounded, size: 14),
                            ),
                            TextSpan(
                              text:
                                  " Self-motivated problem solver with experience in Android development using GitHub and....",
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Positioned(
              top: 118,
              right: 24,
              child: CircleAvatar(
                radius: 56,
                backgroundColor: Colors.white,
                child: CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.blue.shade100,
                  backgroundImage: NetworkImage(
                    'https://scontent.fbzl5-1.fna.fbcdn.net/v/t39.30808-6/461430012_122191430114074736_7096328490961749264_n.jpg?_nc_cat=102&ccb=1-7&_nc_sid=a5f93a&_nc_ohc=bFZJseYIIf4Q7kNvwG5r7Lf&_nc_oc=AdmHujnNWUOY_nhKr4K1upS9_OMFgQ_PHQGubuiqQhjnFLGXuP2XOrw9a_6os9274VI&_nc_zt=23&_nc_ht=scontent.fbzl5-1.fna&_nc_gid=azPEIbcoXmH6bysSntJdKg&oh=00_AfFhAYNyg1ajg_rRWdyWK54ukJOsHVhbgczHCx0o74dp7g&oe=6808466B',
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey.shade100,
                    foregroundColor: Colors.grey,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    fixedSize: const Size(double.maxFinite, 40),
                  ),
                  child: const Text(
                    'Edit profile',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 16),
        Divider(height: 3, thickness: 3, color: Color(0x35aeaeae)),
        SizedBox(height: 4),
      ],
    );
  }
}
