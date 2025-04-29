import 'package:alwahda/feature/auth/ui/controller/auth_controller.dart';
import 'package:alwahda/feature/auth/ui/screens/sign_in_with_google_screen.dart';
import 'package:alwahda/feature/common/screens/main_bottom_nav_screen.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
    bool isLogin = await AuthController.islogIn();
    await Future.delayed(Duration(seconds: 4));
    if(isLogin){
         Navigator.popAndPushNamed(context, MainBottomNavScreen.name);
    }else
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
