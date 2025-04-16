import 'package:alwahda/feature/auth/screens/sign_in_with_google_screen.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  static String name = '/';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    moveNextScreen();
  }

  Future<void> moveNextScreen()async{
   await Future.delayed(Duration(seconds: 4));
   Navigator.popAndPushNamed(context, SignInWithGoogleScreen.name);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(toolbarHeight: 0),
      body: Center(
        child: AnimatedTextKit(
          totalRepeatCount: 1,
          animatedTexts: [
            WavyAnimatedText(
              'alwahada',
              speed: Duration(milliseconds: 300),
              textStyle: GoogleFonts.getFont(
                'Lily Script One',
                fontSize: 40,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
