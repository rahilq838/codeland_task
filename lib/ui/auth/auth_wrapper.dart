import 'package:codeland_task/ui/auth/login_page.dart';
import 'package:codeland_task/ui/upload_image_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/auth_controller.dart';

class AuthWrapper extends StatelessWidget {
   AuthWrapper({super.key});

  final AuthController authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() =>
        authController.isLogin.value ? UploadImagePage() : LoginPage());
  }
}
