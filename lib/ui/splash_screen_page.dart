import 'package:codeland_task/route.dart';
import 'package:codeland_task/ui/auth/auth_wrapper.dart';
import 'package:codeland_task/utils/constants.dart';
import 'package:codeland_task/utils/functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';


class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({super.key});
  @override
  State<SplashScreenPage> createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    Future.delayed(const Duration(seconds: 2), (){
      Get.offAllNamed(routeAuthWrapper);
    });
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: SystemUiOverlay.values);
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: focusColor,
      body: Center(
        child: Padding(
          padding: getLRTBPadding( left: 68.0, right: 68.0),
          child: Container(
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(63.0)),
                boxShadow: [
                  BoxShadow(
                    color: Color(0x99000000),
                    blurRadius: 4.0,
                    offset: Offset(1.0, 10.0,),
                  )
                ]
            ),
            child:   Padding(
              padding: getLRTBPadding(),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: getLRTBPadding(top: 30.0, left: 0.0, right: 0.0, bottom: 0.0),
                    child: Center(
                      child: Image.asset(
                        codeLandLogoPath,
                      ),
                    ),
                  ),
                  Center(
                    child: Image.asset(
                      codeLandTextLogoPath,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

