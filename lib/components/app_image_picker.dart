import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class AppImagePicker {
  ImagePicker imagePicker = ImagePicker();

  ImagePickerController imagePickerController =
      Get.put(ImagePickerController());

  AppImagePicker();

  browseImage(ImageSource source) async {
    PickedFile pickedFile =
        await imagePicker.getImage(source: source, imageQuality: 50);
    if (pickedFile != null) {
      File file = await ImageCropper.cropImage(
        sourcePath: pickedFile.path,
        aspectRatio: CropAspectRatio(ratioX: 1, ratioY: 1),
        compressQuality: 100,
        maxHeight: 700,
        maxWidth: 700,
        compressFormat: ImageCompressFormat.jpg,
        androidUiSettings: AndroidUiSettings(
          toolbarColor: Colors.white,
          toolbarTitle: "Image Cropper",
        ),
      );
      imagePickerController.image = file;
    }
  }

  void showBottomSheet() {
    Get.bottomSheet(
        Container(
          child: Wrap(
            children: [
              ListTile(
                leading: Icon(Icons.photo_library),
                title: Text('Photo Library'),
                tileColor: Colors.white,
                onTap: () {
                  browseImage(ImageSource.gallery);
                  Get.back();
                },
              ),
              Divider(
                height: 0.5,
              ),
              ListTile(
                leading: Icon(Icons.photo_camera),
                title: Text('Camera'),
                tileColor: Colors.white,
                onTap: () {
                  browseImage(ImageSource.camera);
                  Get.back();
                },
              ),
            ],
          ),
        ),
        barrierColor: Colors.black.withOpacity(0.8));
  }
}

class ImagePickerController extends GetxController {
  File _image;

  set image(File value) {
    _image = value;
    update();
  }

  File get image => _image;
}
