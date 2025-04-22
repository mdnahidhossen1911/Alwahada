import 'dart:math' as math;

import 'package:alwahda/app/assets_path.dart';
import 'package:alwahda/feature/auth/data/model/sign_in_user_model.dart';
import 'package:alwahda/feature/auth/ui/controller/auth_controller.dart';
import 'package:alwahda/feature/profile/screens/edit_profile_screen.dart';
import 'package:alwahda/feature/profile/screens/followers_list_screen.dart';
import 'package:alwahda/feature/profile/screens/following_list_screen.dart';
import 'package:alwahda/feature/search/screens/search_post_section.dart';
import 'package:alwahda/feature/setting/screens/setting_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen>
    with TickerProviderStateMixin {
  late TabController _tabController;

  SignInUserModel? userModel;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    userModel = Get.find<AuthController>().userModel;
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
              child: const Icon(Icons.menu_open_sharp, color: Colors.black),
            ),
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
          children: [
            SearchPostSection(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                spacing: 8,
                children: [
                  SizedBox(height: 12),
                  Row(
                    children: [
                      Icon(Icons.calendar_month, color: Colors.grey.shade800),
                      SizedBox(width: 8),
                      Text('Joined 23 April 2025'),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.work, color: Colors.grey.shade800),
                      SizedBox(width: 8),
                      Text('Founder of AL Wahada'),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.school, color: Colors.grey.shade800),
                      SizedBox(width: 8),
                      Text('Computer Science andTechnology'),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.location_history_rounded,
                        color: Colors.grey.shade800,
                      ),
                      SizedBox(width: 8),
                      Text('Santosh, Tangail 1902'),
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
                      GetBuilder<AuthController>(
                        builder: (controller) {
                          return RichText(
                            text: TextSpan(
                              style: GoogleFonts.inter(
                                fontSize: 17,
                                color: Colors.black,
                                fontWeight: FontWeight.w700,
                              ),
                              children: [
                                TextSpan(text: "${controller.userModel?.fullName}  "),
                                WidgetSpan(
                                  child: Image.asset(
                                    AssetsPath.verifyWriter,
                                    width: 20,
                                  ),
                                ),
                              ],
                            ),
                          );
                        }
                      ),
                      GetBuilder<AuthController>(
                        builder: (controller) {
                          return Text(
                            '@${controller.userModel?.uid}',
                            style: GoogleFonts.inter(
                              fontSize: 12,
                              color: Colors.grey,
                            ),
                          );
                        }
                      ),
                      SizedBox(height: 6),
                      Row(
                        children: [
                          for (int i = 0; i < 2; i++)
                            Align(
                              widthFactor: 0.7,
                              child: CircleAvatar(
                                radius: 9,
                                backgroundColor: Colors.white,
                                child: CircleAvatar(
                                  radius: 8,
                                  backgroundColor: Colors.grey.shade100,
                                  backgroundImage: NetworkImage(
                                    'https://scontent.fbzl5-1.fna.fbcdn.net/v/t39.30808-1/488259833_122221468874074736_6951742490121162663_n.jpg?stp=cp0_dst-jpg_s40x40_tt6&_nc_cat=110&ccb=1-7&_nc_sid=1d2534&_nc_ohc=nCewAkcCWCMQ7kNvwFGMobO&_nc_oc=Adk8b_wgMCQNaUYXzCBjzCUWHVeyQ-b_s9cYmsq9tNSGiqbw-Mok3xjWIddRM19pVNE&_nc_zt=24&_nc_ht=scontent.fbzl5-1.fna&_nc_gid=oaXZS5vp3mdsIIAU-JkWQg&oh=00_AfFwWMR6h554DK73PzFD4a-mu2MEf55e1-6MvKIjK54XvA&oe=68091E50',
                                  ),
                                ),
                              ),
                            ),
                          SizedBox(width: 8),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, FollowersListScreen.name);
                            },
                            child: Text(
                              '1K followers •',
                              style: TextStyle(
                                fontSize: 12.5,
                                color: Colors.grey.shade700,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, FollowingListScreen.name);
                            },
                            child: Text(
                              ' 500 following',
                              style: TextStyle(
                                fontSize: 12.5,
                                color: Colors.grey.shade700,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
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
                child: GetBuilder<AuthController>(
                  builder: (controller) {
                    return CircleAvatar(
                      radius: 50,
                      backgroundColor: Colors.grey.shade100,
                      backgroundImage: NetworkImage(
                        'http://192.168.0.102/al_wahada/${controller.userModel?.highImage}',
                      ),
                    );
                  }
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
                  onPressed: () {
                    Navigator.pushNamed(context, EditProfileScreen.name);
                  },
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
