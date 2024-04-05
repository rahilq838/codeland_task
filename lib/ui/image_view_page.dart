import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/image_picker_controller.dart';
class ImageViewPage extends StatelessWidget {
   ImageViewPage({super.key});

  final ImagePickerController imagePickerController =
      Get.find<ImagePickerController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Center(
          child: Image.file(
              imagePickerController.selectedImage.value!),
        ),
      ),
    );
  }
}
