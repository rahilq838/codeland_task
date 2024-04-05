import 'package:codeland_task/controller/image_picker_controller.dart';
import 'package:codeland_task/utils/functions.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UploadImagePage extends StatelessWidget {
  UploadImagePage({super.key});

  final String codeLandLogoPath = "assets/codeland_logo.png";
  final ImagePickerController imagePickerController =
      Get.put(ImagePickerController());

  onViewImagePressed() {
    // print("View Image Pressed");
    imagePickerController.toggleViewImage();
  }

  onUploadPressed() {
    // print("Upload Pressed");
    imagePickerController.pickImageFromGallery();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: getLRTBPadding(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Flexible(
                  child: Padding(
                    padding: getLRTBPadding(),
                    child: Center(
                      child: Text(
                        "Upload Image",
                        style: getTextStyle(fs: 16, fw: FontWeight.w500),
                      ),
                    ),
                  ),
                ),
                Flexible(
                  child: Row(mainAxisSize: MainAxisSize.min, children: [
                    Expanded(
                      child: Padding(
                        padding: getLRTBPadding(left: 10.0, right: 10.0),
                        child: Obx(
                            ()=> DottedBorder(
                            dashPattern: const [
                              8.0,
                              5.0,
                            ],
                            child: imagePickerController.selectedImage.value !=
                                    null
                                ? Image.file(
                                    imagePickerController.selectedImage.value!)
                                : SizedBox(
                                    height: height * 0.75,
                                    child: Center(
                                      child: Icon(
                                        Icons.image_outlined,
                                        size: height * 0.1,
                                      ),
                                    ),
                                  ),
                          ),
                        ),
                      ),
                    ),
                  ]),
                ),
                Flexible(
                    child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                      Flexible(
                        child: ElevatedButton(
                          onPressed: onUploadPressed,
                          style: getElevatedButtonStyle(),
                          child: Text(
                            "Upload",
                            style: getTextStyle(fs: 14, fc: Colors.white),
                          ),
                        ),
                      ),
                      Flexible(
                        child: ElevatedButton(
                          onPressed: onViewImagePressed,
                          style: getElevatedButtonStyle(
                              color: const Color(0xFFD3D3D6)),
                          child: Text(
                              "View",
                              style: getTextStyle(fs: 12, fc: Colors.black),
                            ),

                        ),
                      ),
                    ])),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
