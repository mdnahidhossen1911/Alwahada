import 'package:alwahda/feature/home/data/model/post_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CommentWidget extends StatelessWidget {
  final Comments? comments;
  const CommentWidget({
    super.key,  required this.comments,
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
                    Text(comments?.name??'',style: GoogleFonts.getFont('Inter',fontSize: 13,fontWeight: FontWeight.w600,),),
                    Text('  • ${comments?.createdAt}',style: GoogleFonts.getFont('Inter',fontSize: 11,),),
                  ],
                ),
                Text('${comments?.comment}',style: GoogleFonts.getFont('Inter',fontSize: 13,),),
              ],
            ),
          )
        ],
      ),
    );
  }
}
