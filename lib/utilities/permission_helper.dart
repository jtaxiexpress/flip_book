import 'package:permission_handler/permission_handler.dart';

class PermissionHelper {
  static Future<void> requestPermission() async {
    const permission = Permission.camera;

    if (await permission.isDenied) {
      final result = await permission.request();
      if (result.isGranted) {
        // Permission is granted
      } else if (result.isDenied) {
        // Permission is denied
      } else if (result.isPermanentlyDenied) {
        // Permission is permanently denied
      }
    }
  }
}
