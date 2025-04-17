import 'package:alwahda/app/assets_path.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Future<dynamic> showBottomSheetShareWindow(BuildContext context) {
  return showModalBottomSheet(
    backgroundColor: Colors.white,
    isScrollControlled: true,
    context: context,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(8)),
    ),
    builder: (context) {
      return SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.all(14),
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
                            BoxShadow(
                              color: Colors.grey.shade400,
                              blurRadius: 1,
                            ),
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
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blueAccent,
                          elevation: 0,
                        ),
                        child: Text(
                          'Share',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                  TextField(
                    minLines: 1,
                    maxLines: 5,
                    decoration: InputDecoration(
                      hintText: 'Write Samthing.........',
                      hintStyle: TextStyle(color: Colors.grey.shade500),
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
                  SizedBox(height: 8),
                  Container(
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.grey.shade300),
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.shade400,
                                    blurRadius: 1,
                                  ),
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
                          ],
                        ),
                        SizedBox(height: 4),
                        Column(
                          children: [
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
                              'Al-Aqsa Mosque is one of the holiest sites in Islam, located in the Old City of Jerusalem. It is part of the larger Al-Haram al-Sharif (the Noble Sanctuary), which also includes the Dome of the Rock.',
                              style: GoogleFonts.getFont(
                                'Inter',
                                fontSize: 14,
                                height: 1.3,
                                color: Colors.grey.shade900,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    },
  );
}
