import 'package:alwahda/feature/home/ui/controller/home_get_data_controller.dart';
import 'package:alwahda/feature/home/ui/widgets/home_share_knowlage_bar.dart';
import 'package:alwahda/feature/home/ui/widgets/post_card_widget.dart';
import 'package:alwahda/feature/post/screens/new_post_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getpostData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: GetBuilder<HomeGetDataController>(
        builder: (controller) {
          if (controller.inProgress) {
            return Center(child: CircularProgressIndicator());
          }
          return RefreshIndicator(
            backgroundColor: Colors.white,
            color: Colors.black,
            onRefresh: () {
              return Future.delayed(Duration(seconds: 2), () {
                getpostData();
              });
            },
            child: SizedBox(
              height: double.maxFinite,
              width: double.maxFinite,
              child: ColoredBox(
                color: Color(0x35aeaeae),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      HomeShareKnowlageBar(
                        ontab: () {
                          Navigator.pushNamed(context, NewPostScreen.name);
                        },
                      ),
                      ListView.builder(
                        itemCount: controller.postList?.length ?? 0,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return PostCardWidget(
                            posts: controller.postList?[index],
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Future<void> getpostData() async {
    bool isSuccess = await Get.find<HomeGetDataController>().homeAPi();
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
