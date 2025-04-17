import 'package:alwahda/app/assets_path.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PostDetailsScreen extends StatefulWidget {
  const PostDetailsScreen({super.key, this.commentScrolling});

  final bool? commentScrolling;
  static String name = '/PostDetails';

  @override
  State<PostDetailsScreen> createState() => _PostDetailsScreenState();
}

class _PostDetailsScreenState extends State<PostDetailsScreen> {
  final GlobalKey _commentsKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final context = _commentsKey.currentContext;
      if (context != null && widget.commentScrolling == true) {
        Scrollable.ensureVisible(
          context,
          duration: Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      }
    });
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(color: Colors.grey.shade400, blurRadius: 1),
                              ],
                              image: DecorationImage(
                                image: AssetImage(AssetsPath.manAvater),
                              ),
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
                                  '23 sep 2024',
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
                          IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.more_horiz, color: Colors.black),
                          ),
                        ],
                      ),
                      SizedBox(height: 4),
                      Text(
                        'Al-Aqsa Mosque is one of the holiest sites in Islam.',
                        style: GoogleFonts.getFont(
                          'Inter',
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          height: 1.3,
                        ),
                      ),
                      SizedBox(height: 8),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.network(
                          'https://muslimhands.org.uk/_ui/images/d58861348753.png',
                        ),
                      ),
                      SizedBox(height: 12),
                      Text(
                        '''উদাহরণের ব্যাখ্যা:
                  
                  MarkdownEditorController: এই ক্লাসটি একটি TextEditingController ধারণ করে, যা এডিটর ট্যাবের টেক্সট ফিল্ডের সাথে সংযুক্ত থাকে।​
                  
                  PreviewTab: এই ক্লাসটি GetView থেকে উত্তরাধিকারী, এবং এটি MarkdownEditorController এর সাথে কাজ করে। এখানে Obx উইজেট ব্যবহার করা হয়েছে, যা GetX এর রিঅ্যাক্টিভ স্টেট ম্যানেজমেন্ট সিস্টেমের অংশ। এটি নিশ্চিত করে যে যখনই টেক্সট পরিবর্তিত হয়, প্রিভিউ স্বয়ংক্রিয়ভাবে আপডেট হয়।​
                  
                  MarkdownBody: এই উইজেটটি Markdown টেক্সটকে রেন্ডার করে প্রদর্শন করে। data প্রোপার্টিতে এডিটর থেকে প্রাপ্ত টেক্সট পাস করা হয়।​
                  
                  এইভাবে, প্রিভিউ ট্যাবটি এডিটর ট্যাবে লেখা Markdown টেক্সটের রিয়েল-টাইম রেন্ডারিং প্রদর্শন করে, যা ব্যবহারকারীদের তাদের কন্টেন্টের ফাইনাল আউটপুট কেমন হবে তা দেখতে সহায়তা করে।
                  উদাহরণের ব্যাখ্যা:
                  
                  MarkdownEditorController: এই ক্লাসটি একটি TextEditingController ধারণ করে, যা এডিটর ট্যাবের টেক্সট ফিল্ডের সাথে সংযুক্ত থাকে।​
                  
                  PreviewTab: এই ক্লাসটি GetView থেকে উত্তরাধিকারী, এবং এটি MarkdownEditorController এর সাথে কাজ করে। এখানে Obx উইজেট ব্যবহার করা হয়েছে, যা GetX এর রিঅ্যাক্টিভ স্টেট ম্যানেজমেন্ট সিস্টেমের অংশ। এটি নিশ্চিত করে যে যখনই টেক্সট পরিবর্তিত হয়, প্রিভিউ স্বয়ংক্রিয়ভাবে আপডেট হয়।​
                  
                  MarkdownBody: এই উইজেটটি Markdown টেক্সটকে রেন্ডার করে প্রদর্শন করে। data প্রোপার্টিতে এডিটর থেকে প্রাপ্ত টেক্সট পাস করা হয়।​
                  
                  এইভাবে, প্রিভিউ ট্যাবটি এডিটর ট্যাবে লেখা Markdown টেক্সটের রিয়েল-টাইম রেন্ডারিং প্রদর্শন করে, যা ব্যবহারকারীদের তাদের কন্টেন্টের ফাইনাল আউটপুট কেমন হবে তা দেখতে সহায়তা করে।''',
                        style: GoogleFonts.getFont(
                          'Inter',
                          fontSize: 14,
                          height: 1.3,
                          color: Colors.grey.shade900,
                        ),
                      ),
                      SizedBox(height: 12),
                      Text(
                        '1 Like . 1 Comment . 1 Share',
                        style: GoogleFonts.getFont(
                          'Inter',
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      ),
                      SizedBox(height: 10),
                      Divider(height: 1, color: Colors.grey.shade100),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              TextButton(
                                onPressed: () {},
                                child: Row(
                                  children: [
                                    Icon(Icons.favorite_border, color: Colors.black),
                                    SizedBox(width: 8),
                                    Text(
                                      'Like',
                                      style: GoogleFonts.getFont(
                                        'Inter',
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(width: 16),
                              TextButton(
                                onPressed: () {},
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.mode_comment_outlined,
                                      color: Colors.black,
                                    ),
                                    SizedBox(width: 8),
                                    Text(
                                      'Comment',
                                      style: GoogleFonts.getFont(
                                        'Inter',
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          TextButton(
                            onPressed: () {},
                            child: Row(
                              children: [
                                Icon(Icons.share, color: Colors.black),
                                SizedBox(width: 8),
                                Text(
                                  'Share',
                                  style: GoogleFonts.getFont(
                                    'Inter',
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Divider(height: 1, color: Colors.grey.shade100),
                      SizedBox(height: 14),
                      Container(
                        key: _commentsKey,
                        child: Text(
                          'All Comment',
                          style: GoogleFonts.getFont(
                            'Inter',
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      ListView.builder(
                        itemCount: 10,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return ListTile(
                            leading: CircleAvatar(),
                              title: Text('data'),
                              subtitle: Text('data'),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Column(
              children: [
                Divider(height: 1,color: Colors.grey.shade200,),
                Container(
                  margin: EdgeInsets.all(10),
                  padding: EdgeInsets.only(right: 12,left: 8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    color: Color(0xfff6f6f6),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(child:
                      TextField(
                        maxLines: 6,
                        minLines: 1,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(vertical: 4,horizontal: 8),
                          hintText: 'Comment',
                          filled: true,
                          fillColor: Colors.transparent,
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide.none
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide.none
                          ),
                        ),
                      ),),
                      Icon(Icons.send, color: Color(0xc29d9d9d)),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(Icons.arrow_back_ios_new_outlined),
      ),
      forceMaterialTransparency: true,
      title: Text('Post details'),
    );
  }
}
