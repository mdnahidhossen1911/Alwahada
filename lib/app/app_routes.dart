import 'package:alwahda/feature/auth/screens/sign_in_with_google_screen.dart';
import 'package:alwahda/feature/auth/screens/splash_screen.dart';
import 'package:alwahda/feature/common/screens/main_bottom_nav_screen.dart';
import 'package:alwahda/feature/post/screens/new_post_screen.dart';
import 'package:alwahda/feature/post/screens/post_details_screen.dart';
import 'package:alwahda/feature/profile/screens/followers_list_screen.dart';
import 'package:alwahda/feature/profile/screens/following_list_screen.dart';
import 'package:alwahda/feature/setting/screens/setting_screen.dart';
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
      bool commentScrolling = settings.arguments as bool;
      screen =  PostDetailsScreen(commentScrolling: commentScrolling ,);
    }else if (settings.name == SettingScreen.name) {
      screen = const SettingScreen();
    }else if (settings.name == FollowersListScreen.name) {
      screen = const FollowersListScreen();
    }else if (settings.name == FollowingListScreen.name) {
      screen = const FollowingListScreen();
    }
    return MaterialPageRoute(
      builder: (context) {
        return screen;
      },
    );
  }
}
