// import 'package:common/common.dart';
// import 'package:file_picker/file_picker.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:image_cropper/image_cropper.dart';
// import 'package:image_picker/image_picker.dart';
// import "package:image_picker_platform_interface/src/types/image_options.dart";
// import 'package:image_picker_platform_interface/src/types/multi_image_picker_options.dart';
//
// class CameraGalleryPicker {
//   final BuildContext context;
//   ZigLeadsColors? color;
//   final Function(String) onImagePick;
//   final Function(List<String>) onImageListPick;
//   final Function(XFile)? getImageFile;
//   final Function(PlatformFile?)? getFile;
//   final bool? isOpenOnlyCamera;
//   final bool? isOpenOnlyGallery;
//   final bool? isForAccount;
//   final bool selectMultiple;
//   final bool isVideo;
//
//   CameraGalleryPicker(
//     this.context, {
//     required this.onImageListPick,
//     required this.onImagePick,
//     this.getImageFile,
//     this.isForAccount,
//     this.isOpenOnlyCamera,
//     this.isOpenOnlyGallery,
//     this.selectMultiple = true,
//     this.isVideo = false,
//     this.getFile,
//   }) {
//     color = Theme.of(context).zigLeadsColors;
//     if (isOpenOnlyCamera ?? false) {
//       _openCameraForPickImage();
//     } else if (isOpenOnlyGallery ?? false) {
//       _openGalleryForPickImage();
//     } else {}
//   }
//
//   void _openGalleryForPickImage() async {
//     if (kIsWeb) {
//       pickFiles();
//     } else {
//       if (selectMultiple) {
//         List<String> pickedImageList = await getMultipleImageFromGallery();
//         onImageListPick(pickedImageList);
//       } else {
//         String pickImage = await getSingleImageFromGallery();
//         onImagePick(pickImage);
//       }
//     }
//   }
//
//   void _openCameraForPickImage() async {
//     if (kIsWeb) {
//       pickFiles();
//     } else {
//       String pickImage = await getImageFromCamera();
//       onImagePick(pickImage);
//     }
//   }
//
//   Future<String> getImageFromCamera() async {
//     XFile? image = await ImagePicker.platform.getImageFromSource(
//         source: ImageSource.camera, options: const ImagePickerOptions(imageQuality: 75));
//     if (image != null) {
//       /*  CroppedFile? croppedFile = await ImageCropper().cropImage(
//         sourcePath: image.path,
//         cropStyle: CropStyle.rectangle,
//         uiSettings: _uiSetting(),
//       );
//       return croppedFile != null ? croppedFile.path : ''; */
//       // }
//
//       return image.path;
//     } else {
//       return '';
//     }
//   }
//
//   void pickFiles() async {
//     try {
//       var _paths = (await FilePicker.platform.pickFiles(
//         type: FileType.custom,
//         allowMultiple: false,
//         onFileLoading: (FilePickerStatus status) => print(status),
//         allowedExtensions: [
//           'png',
//           'jpg',
//           'jpeg', /* 'heic' */
//         ],
//       ))
//           ?.files;
//       var file = _paths?.first;
//       getFile!(_paths?.first);
//     } on PlatformException catch (e) {
//       print(e);
//     } catch (e) {
//       print(e);
//     }
//   }
//
//   //Image from gallery
//   Future<List<String>> getMultipleImageFromGallery() async {
//     // var image =
//     // await ImagePicker.platform.getImageFromSource(source: ImageSource.gallery);
//     List<String> CroppedImageList = [];
//     var imageList = await ImagePicker.platform.getMultiImageWithOptions(
//       options: const MultiImagePickerOptions(
//         imageOptions: ImageOptions(imageQuality: 75),
//       ),
//     );
//     List<String> imagePathList = [];
//     print(imageList.length);
//     for (var file in imageList) {
//       print('file is ${file}');
//       imagePathList.add(file.path);
//     }
//     print(imagePathList);
//     return imagePathList;
//     // if (image != null) {
//     //   getImageFile!(image);
//     //   if (!(isForAccount ?? false)) {
//     //     return image.path;
//     //   } else {
//     //     final ratio = 1.w;
//     //     CroppedFile? croppedFile = await ImageCropper().cropImage(
//     //       sourcePath: image.path,
//     //       aspectRatio: CropAspectRatio(
//     //         ratioX: ratio,
//     //         ratioY: ratio,
//     //       ),
//     //       cropStyle: CropStyle.circle,
//     //       uiSettings: _uiSetting(),
//     //     );
//     //
//     //     return croppedFile != null ? croppedFile.path : '';
//     //   }
//     // } else {
//     //   return '';
//     // }
//   }
//
//   Future<String> getSingleImageFromGallery() async {
//     var image = await ImagePicker.platform.getImageFromSource(
//         source: ImageSource.gallery, options: const ImagePickerOptions(imageQuality: 75));
//     if (image != null) {
//       //  getImageFile!(image);
//       /* CroppedFile? croppedFile = await ImageCropper().cropImage(
//         sourcePath: image.path,
//         cropStyle: CropStyle.rectangle,
//         uiSettings: _uiSetting(),
//       );
//       return croppedFile != null ? croppedFile.path : ''; */
//       return image.path!;
//     } else {
//       return '';
//     }
//   }
//
//   List<PlatformUiSettings> _uiSetting() {
//     const String title = "Crop Your Image";
//
//     return [
//       AndroidUiSettings(
//         toolbarTitle: title,
//         toolbarColor: color?.black,
//         toolbarWidgetColor: color?.white,
//         initAspectRatio: CropAspectRatioPreset.original,
//         hideBottomControls: false,
//         lockAspectRatio: false,
//       ),
//       IOSUiSettings(
//         resetAspectRatioEnabled: false,
//         rotateButtonsHidden: true,
//         aspectRatioLockDimensionSwapEnabled: true,
//         aspectRatioPickerButtonHidden: true,
//         rotateClockwiseButtonHidden: true,
//         resetButtonHidden: true,
//         hidesNavigationBar: true,
//         title: title,
//       ),
//     ];
//   }
// }
import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class CameraGalleryPicker {
  final BuildContext context;
  MonixColors? color;
  final Function(String) onImagePick;
  final bool? isOpenOnlyCamera;
  final bool? isOpenOnlyGallery;
  final bool? isForAccount;
  final bool isVideo;

  CameraGalleryPicker(
      this.context,
      this.onImagePick, {
        this.isForAccount,
        this.isOpenOnlyCamera,
        this.isOpenOnlyGallery,
        this.isVideo = false,
      }) {
    color = Theme.of(context).monixColors;
    if (isOpenOnlyCamera ?? false) {
      _openCameraForPickImage();
    } else if (isOpenOnlyGallery ?? false) {
      _openGalleryForPickImage();
    } else {
    }
  }

  void _openGalleryForPickImage() async {
    String pickImage = await getImageFromGallery();
    onImagePick(pickImage);
  }

  void _openCameraForPickImage() async {
    String pickImage = await getImageFromCamera();
    onImagePick(pickImage);
  }


  Future<String> getImageFromCamera() async {
    var image = isVideo
        ? await ImagePicker.platform.pickVideo(
      source: ImageSource.camera,
    )
        : await ImagePicker.platform.pickImage(
      source: ImageSource.camera,
    );
    if (image != null) {
      if (!(isForAccount ?? false)) {
        return image.path;
      } else {
        final ratio = 1.w;

        CroppedFile? croppedFile = await ImageCropper().cropImage(
          sourcePath: image.path,
          aspectRatio: CropAspectRatio(
            ratioX: ratio,
            ratioY: ratio,
          ),
          cropStyle: CropStyle.circle,
          uiSettings: _uiSetting(),
        );

        return croppedFile != null ? croppedFile.path : '';
      }
    } else {
      return '';
    }
  }

  //Image from gallery
  Future<String> getImageFromGallery() async {
    var image =
    await ImagePicker.platform.pickImage(source: ImageSource.gallery);

    if (image != null) {
      if (!(isForAccount ?? false)) {
        return image.path;
      } else {
        final ratio = 1.w;
        CroppedFile? croppedFile = await ImageCropper().cropImage(
          sourcePath: image.path,
          aspectRatio: CropAspectRatio(
            ratioX: ratio,
            ratioY: ratio,
          ),
          cropStyle: CropStyle.circle,
          uiSettings: _uiSetting(),
        );

        return croppedFile != null ? croppedFile.path : '';
      }
    } else {
      return '';
    }
  }

  List<PlatformUiSettings> _uiSetting() {
    const String title = "Crop Your Image";

    return [
      AndroidUiSettings(
        toolbarTitle: title,
        toolbarColor: color?.black,
        toolbarWidgetColor: color?.white,
        initAspectRatio: CropAspectRatioPreset.original,
        hideBottomControls: true,
        lockAspectRatio: true,
      ),
      IOSUiSettings(
        resetAspectRatioEnabled: false,
        rotateButtonsHidden: true,
        aspectRatioLockDimensionSwapEnabled: true,
        aspectRatioPickerButtonHidden: true,
        rotateClockwiseButtonHidden: true,
        resetButtonHidden: true,
        hidesNavigationBar: true,
        title: title,
      ),
    ];
  }
}
