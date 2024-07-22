import 'package:permission_handler/permission_handler.dart';

class CommonFun{
  // Request Permission
  static Future<bool> requestPermission(Permission permission) async {
    if (await permission.isGranted) {
      return true;
    } else {
      var result = await permission.request();
      if (result == PermissionStatus.granted) {
        return true;
      } else if (result == PermissionStatus.permanentlyDenied) {
        await openAppSettings();
      }else{
        await openAppSettings();
      }
    }
    return false;
  }

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