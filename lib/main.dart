import 'package:codeland_task/controller/auth_controller.dart';
import 'package:codeland_task/route.dart';
import 'package:codeland_task/ui/auth/auth_wrapper.dart';
import 'package:codeland_task/ui/splash_screen_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final AuthController authController = Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "CodeLand Task",
      theme: ThemeData(
        useMaterial3: true,
      ),
      onGenerateRoute: Routes.generateRoute,
      home: const SplashScreenPage(),
      builder: (context, child) => MediaQuery(
          data: MediaQuery.of(context)
              .copyWith(textScaler: const TextScaler.linear(1.0)),
          child: child!),
    );
  }
}
