import 'package:permission_handler/permission_handler.dart';

class PermissionHelper {
  static Future<void> requestPermissions() async {
    if (await Permission.camera.request().isGranted &&
        await Permission.photos.request().isGranted) {
      // Permissions granted
    } else {
      // Handle permissions denied
    }
  }
}
