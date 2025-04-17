import 'package:alwahda/feature/auth/screens/sign_in_with_google_screen.dart';
import 'package:alwahda/feature/auth/screens/splash_screen.dart';
import 'package:alwahda/feature/common/screens/main_bottom_nav_screen.dart';
import 'package:alwahda/feature/post/screens/new_post_screen.dart';
import 'package:alwahda/feature/post/screens/post_details_screen.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static Route<dynamic> onGenerateRoute(RouteSettings settings)  {
    late Widget screen;
    if (settings.name == SplashScreen.name) {
      screen = const SplashScreen();
    } else if (settings.name == SignInWithGoogleScreen.name) {
      screen = const SignInWithGoogleScreen();
    }else if (settings.name == MainBottomNavScreen.name) {
      screen = const MainBottomNavScreen();
    }else if (settings.name == NewPostScreen.name) {
      screen = const NewPostScreen();
    }else if (settings.name == PostDetailsScreen.name) {
      screen = const PostDetailsScreen();
    }
    return MaterialPageRoute(
      builder: (context) {
        return screen;
      },
    );
  }
}
