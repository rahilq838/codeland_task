import 'package:codeland_task/ui/auth/auth_wrapper.dart';
import 'package:codeland_task/ui/auth/login_page.dart';
import 'package:codeland_task/ui/image_view_page.dart';
import 'package:codeland_task/ui/splash_screen_page.dart';
import 'package:codeland_task/ui/upload_image_page.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';


const routeStart = '/';
const routeUploadImage = '/uploadImage';
const routeSplashScreen = '/splashScreen';
const routeImageView = '/imageView';
const routeAuthWrapper = '/authWrapper';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {

      case routeStart:
        return PageTransition(
          type: PageTransitionType.fade,
          child:  AuthWrapper(),
        );

      case routeUploadImage:
        return PageTransition(
          type: PageTransitionType.fade,
          child:   UploadImagePage(),
        );


      case routeSplashScreen:
        return PageTransition(
          type: PageTransitionType.fade,
          child: const SplashScreenPage(),
        );

      case routeImageView:
        return PageTransition(
          type: PageTransitionType.fade,
          child:  ImageViewPage(),
        );

      case routeAuthWrapper:
        return PageTransition(
          type: PageTransitionType.fade,
          child: AuthWrapper(),
        );

      default:
        return PageTransition(
          type: PageTransitionType.fade,
          child: const SplashScreenPage(),
        );
    }
  }
}
