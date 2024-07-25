import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:permission_handler/permission_handler.dart';

class CommonFun {
  /// Handles permission requests for storage, allowing the user
  /// to access files, including PDFs.
  static Future<bool> requestPermission(BuildContext context) async {
    final deviceInfoPlugin = DeviceInfoPlugin();
    final deviceInfo = await deviceInfoPlugin.androidInfo;
    final androidVersion = deviceInfo.data['version']['release'];

    /// Check the current status of storage permission
    final statusStorage = Platform.isAndroid && int.parse(androidVersion) >= 13
        ? await Permission.photos.status
        : await Permission.storage.status;

    /// If permission is permission is denied, request  permissions
    if (statusStorage.isDenied) {
      final resultStorage =
          Platform.isAndroid && int.parse(androidVersion) >= 13
              ? await Permission.photos.request()
              : await Permission.storage.request();

      /// If  permission is granted, continue with file access
      if (resultStorage.isGranted) {
        // Permission granted, continue with file access
        return true;
      }

      /// If permission is permission is permanently denied, show error message
      else if (resultStorage.isPermanentlyDenied) {
        return false;
        // Permission denied forever, show error message
        // showToast(
        //   msg: AppConst.storagePermissionPermanentlyDenied,
        //   context: context,
        //   isSuccess: false,
        // );
      }

      /// If permission is permission is denied, show error message
      else {
        // Permission denied, show error message
        // showToast(
        //   msg: AppConst.storagePermissionDenied,
        //   context: context,
        //   isSuccess: false,
        // );
        return false;
      }
    }

    /// If  permission is already granted, continue with file access
    else if (statusStorage.isGranted) {
      // Permission already granted, continue with file access
      return true;
    }

    /// If permission is permission is restricted, show error message
    else if (statusStorage.isRestricted) {
      // Permission is restricted, show error message
      // showToast(
      //   msg: AppConst.storagePermissionRestricted,
      //   context: context,
      //   isSuccess: false,
      // );
    }

    /// If permission is permission is limited, show error message
    else if (statusStorage.isLimited) {
      // Permission is limited, show error message
      // showToast(
      //   msg: AppConst.storagePermissionLimited,
      //   context: context,
      //   isSuccess: false,
      // );
    }

    return false;
  }
  // // Request Permission
  // static Future<bool> requestPermission(Permission permission) async {
  //   if (await permission.isGranted) {
  //     return true;
  //   } else {
  //     var result = await permission.request();
  //     if (result == PermissionStatus.granted) {
  //       return true;
  //     } else if (result == PermissionStatus.permanentlyDenied) {
  //       await openAppSettings();
  //     }else{
  //       await openAppSettings();
  //     }
  //   }
  //   return false;
  // }

  // Future<bool> _onBackPressed() {
  //   if (_lastPressedAt == null || DateTime.now().difference(_lastPressedAt!) > const Duration(seconds: 2)) {
  //     // Show a toast message to the user
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(
  //         backgroundColor: kaanaAppColorsExtension.secondary,
  //         content: Text(
  //           "Press back again to exit",
  //           style: TextStyle(
  //             color: kaanaAppColorsExtension.white,
  //           ),
  //         ),
  //       ),
  //     );
  //     // Update the time of the last back button press
  //     _lastPressedAt = DateTime.now();
  //     // Don't exit the app yet
  //     return Future.value(false);
  //   }
  //   // Exit the app
  //   SystemNavigator.pop();
  //   return Future.value(true);
  // }
}
