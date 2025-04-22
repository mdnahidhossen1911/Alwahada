import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CommentWidget extends StatelessWidget {
  const CommentWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(),
          SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text('MD. Nahid Hossen',style: GoogleFonts.getFont('Inter',fontSize: 13,fontWeight: FontWeight.w600,),),
                    Text('  • 23 Mar',style: GoogleFonts.getFont('Inter',fontSize: 11,),),
                  ],
                ),
                Text('The mosque is significant not only for its religious importance but also for its historical and architectural value. ',style: GoogleFonts.getFont('Inter',fontSize: 13,),),
              ],
            ),
          )
        ],
      ),
    );
  }
}
