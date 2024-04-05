import 'dart:io';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../route.dart';

class ImagePickerController extends GetxController {
  Rx<File?> selectedImage = Rx<File?>(null);

  Future pickImageFromGallery() async {
    try {
      final XFile? returnedImage =
          await ImagePicker().pickImage(source: ImageSource.gallery);

      if (returnedImage != null) {
        selectedImage.value = File(returnedImage.path);
      } else {
        Get.defaultDialog(
            title: "No Image Selected",
            middleText: "Please select image from gallery");
      }
    } catch (e) {
      Get.defaultDialog(title: "Error", middleText: e.toString());
    }
  }

  toggleViewImage() {
    if (selectedImage.value == null) {
      Get.defaultDialog(
          title: "No Image Selected",
          middleText: "Please select image from gallery",
      );
      GetUtils.printFunction("selectedImage", selectedImage.value == null,
          "image picker controller",
          isError: true);
    } else {
      Get.toNamed(routeImageView);
    }
    }


  }

