import 'package:alwahda/app/assets_path.dart';
import 'package:alwahda/feature/auth/ui/controller/google_sign_in_request_controller.dart';
import 'package:alwahda/feature/common/screens/main_bottom_nav_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class SignInWithGoogleScreen extends StatefulWidget {
  const SignInWithGoogleScreen({super.key});

  static String name = '/SignInWithGoogle';

  @override
  State<SignInWithGoogleScreen> createState() => _SignInWithGoogleScreenState();
}

class _SignInWithGoogleScreenState extends State<SignInWithGoogleScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(toolbarHeight: 0),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Align(
                alignment: Alignment.topCenter,
                child: Image.asset(
                  AssetsPath.splashBanner,
                  width: double.maxFinite,
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Text(
                    'We provide an Islamic environment for gaining knowledge',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.getFont(
                      'Inter',
                      fontSize: 20,
                      height: 1.3,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 24),
                  _buildSignInButton(),
                  SizedBox(height: 24),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  OutlinedButton _buildSignInButton() {
    return OutlinedButton(
      onPressed: () async {
        bool isSuccess =
            await Get.find<GoogleSignInRequestController>().signIn();
        if (isSuccess) {
          Navigator.popAndPushNamed(context, MainBottomNavScreen.name);
        }
      },
      style: OutlinedButton.styleFrom(
        fixedSize: Size(double.maxFinite, 55),
        foregroundColor: Colors.grey,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(AssetsPath.googleIcon, width: 24),
          SizedBox(width: 8),
          Text(
            'Sign in with Google',
            style: GoogleFonts.getFont(
              'Inter',
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
