import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeShareKnowlageBar extends StatelessWidget {
  final VoidCallback? ontab;
  const HomeShareKnowlageBar({
    super.key,
    this.ontab,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 68,
      padding: EdgeInsets.all(13),
      margin: EdgeInsets.symmetric(vertical: 2),
      color: Colors.white,
      child: GestureDetector(
        onTap: ontab,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40),
            color: Color(0xfff6f6f6),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'share Knowlage........',
                style: GoogleFonts.getFont(
                  'Poppins',
                  fontWeight: FontWeight.w300,
                  fontSize: 12,
                  color: Color(0xff9d9d9d),
                ),
              ),
              Icon(Icons.image_outlined, color: Color(0xc29d9d9d)),
            ],
          ),
        ),
      ),
    );
  }
}
