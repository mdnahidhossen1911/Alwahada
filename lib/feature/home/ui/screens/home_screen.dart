import 'package:alwahda/feature/home/ui/controller/home_get_data_controller.dart';
import 'package:alwahda/feature/home/ui/widgets/home_share_knowlage_bar.dart';
import 'package:alwahda/feature/home/ui/widgets/post_card_widget.dart';
import 'package:alwahda/feature/home/ui/widgets/share_post_card_widget.dart';
import 'package:alwahda/feature/post/ui/controller/post_like_toggle_controller.dart';
import 'package:alwahda/feature/post/ui/screens/new_post_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getPostData();
    _scrollController.addListener(paginationScroll);
  }

  void paginationScroll() {
    if (_scrollController.position.extentAfter < 300) {
      getPostData();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: GetBuilder<HomeGetDataController>(
        builder: (controller) {
          if (controller.inProgress) {
            return Center(
              child: CircularProgressIndicator(color: Colors.black),
            );
          }
          return RefreshIndicator(
            backgroundColor: Colors.white,
            color: Colors.black,
            onRefresh: () async {
              Get.find<HomeGetDataController>().refrash();
            },
            child: SizedBox(
              height: double.maxFinite,
              width: double.maxFinite,
              child: ColoredBox(
                color: Color(0x35aeaeae),
                child: CustomScrollView(
                  controller: _scrollController,
                  slivers: [
                    SliverToBoxAdapter(
                      child: HomeShareKnowlageBar(
                        ontab: () {
                          Navigator.pushNamed(context, NewPostScreen.name);
                        },
                      ),
                    ),
                    SliverList(
                      delegate: SliverChildBuilderDelegate(
                        childCount: controller.postList?.length ?? 0,
                        (context, index) {
                          final currentPost = controller.postList![index];
                          if (currentPost.isShare == true) {
                            return SharePostCardWidget(
                              posts: currentPost,
                              likeToggle: (likeStatus) {
                                Get.find<HomeGetDataController>()
                                    .likeToggleAndCountUpdate(
                                  currentPost,
                                  likeStatus,
                                );

                                Get.find<PostLikeToggleController>().likeToggle(
                                  currentPost.pid.toString(),
                                );
                              },
                              commentCount: (count) {
                                Get.find<HomeGetDataController>()
                                    .commentNumberUpdate(currentPost, count);
                              },
                            );
                          }
                          return PostCardWidget(
                            posts: currentPost,
                            likeToggle: (likeStatus) {
                              Get.find<HomeGetDataController>()
                                  .likeToggleAndCountUpdate(
                                    currentPost,
                                    likeStatus,
                                  );

                              Get.find<PostLikeToggleController>().likeToggle(
                                currentPost.pid.toString(),
                              );
                            },
                            commentCount: (count) {
                              Get.find<HomeGetDataController>()
                                  .commentNumberUpdate(currentPost, count);
                            },
                          );
                        },
                      ),
                    ),
                    if (controller.paginationInProgress)
                      SliverToBoxAdapter(
                        child: Center(
                          child: CircularProgressIndicator(color: Colors.black),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Future<void> getPostData() async {
    await Get.find<HomeGetDataController>().homeAPi();
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
