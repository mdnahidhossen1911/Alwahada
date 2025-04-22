import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LikeCommentShareButton extends StatelessWidget {
  final VoidCallback? onTab;
  final String type;
  final Icon icon;

  const LikeCommentShareButton({
    super.key,
    this.onTab,
    required this.type,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTab,
      style: TextButton.styleFrom(foregroundColor: type=="Like"?Colors.redAccent:Colors.grey),
      child: Row(
        children: [
          icon,
          SizedBox(width: 8),
          Text(type, style: GoogleFonts.getFont('Inter', color: Colors.black)),
        ],
      ),
    );
  }
}
