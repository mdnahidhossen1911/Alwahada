import 'package:alwahda/feature/auth/ui/screens/sign_in_with_google_screen.dart';
import 'package:alwahda/feature/auth/ui/screens/splash_screen.dart';
import 'package:alwahda/feature/common/screens/main_bottom_nav_screen.dart';
import 'package:alwahda/feature/post/ui/screens/new_post_screen.dart';
import 'package:alwahda/feature/profile/screens/followers_list_screen.dart';
import 'package:alwahda/feature/profile/screens/following_list_screen.dart';
import 'package:alwahda/feature/profile/screens/edit_profile_screen.dart';
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
    }else if (settings.name == SettingScreen.name) {
      screen = const SettingScreen();
    }else if (settings.name == FollowersListScreen.name) {
      screen = const FollowersListScreen();
    }else if (settings.name == FollowingListScreen.name) {
      screen = const FollowingListScreen();
    }else if (settings.name == EditProfileScreen.name) {
      screen = const EditProfileScreen();
    }
    return MaterialPageRoute(
      builder: (context) {
        return screen;
      },
    );
  }
}
