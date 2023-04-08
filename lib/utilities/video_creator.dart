import 'package:ffmpeg_kit_flutter_full_gpl/ffmpeg_kit.dart';
import 'package:ffmpeg_kit_flutter_full_gpl/ffmpeg_session.dart';
import 'package:ffmpeg_kit_flutter_full_gpl/return_code.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:path_provider/path_provider.dart';

class VideoCreator {
  Future<void> createVideo(List<String> images, String outputFileName,
      {int frameRate = 10}) async {
    int width = 1280;
    int height = 720;
    int fps = frameRate;
    final extension = images.first.substring(images.first.lastIndexOf('.') + 1);
    print("Extension: $extension, first image: ${images.first}");
    final base = await getApplicationDocumentsDirectory();
    final baseDir = base.path;
    print("basidir: $baseDir.path/image_%03d.png");
    // print("${baseDir}image%0${countDigits(images.length)}d.png");
    // final baseDir = "/storage/emulated/0/DCIM/Camera/";
    // print("${baseDir}imag%03d.png");
    final String command = "-y "
        "-framerate $fps "
        "-f image2 "
        "-s ${width}x$height "
        "-start_number 0 "
        "-i ${"$baseDir/image_%03d.$extension"} "
        // "-i ${baseDir}image%03d.png "
        "-vcodec libx264 "
        "-crf 25 "
        "-pix_fmt yuv420p "
        "-v error "
        "$outputFileName";

    final FFmpegSession response = await FFmpegKit.execute(command);
    print("Logs: ");
    (await response.getLogs()).forEach((element) {
      print(element.getMessage());
    });

    if (ReturnCode.isSuccess(await response.getReturnCode())) {
      print('Video created successfully at $outputFileName');
      Fluttertoast.showToast(msg: "Video created at $outputFileName");
    } else {
      print('Error creating video: ${await response.getFailStackTrace()}');
      print('Video creation failed');
    }
  }
}
