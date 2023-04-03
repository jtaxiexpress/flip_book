import 'package:ffmpeg_kit_flutter/ffmpeg_kit.dart';
import 'package:ffmpeg_kit_flutter/ffmpeg_session.dart';
import 'package:ffmpeg_kit_flutter/return_code.dart';

class VideoCreator {
  final List<String> imagePaths;
  final String outputPath;

  VideoCreator({required this.imagePaths, required this.outputPath});

  Future<void> createVideo() async {
    final int width = 1280;
    final int height = 720;
    final int fps = 30;

    final String filter = buildFilter();

    final String command = "-y "
        "-r $fps "
        "-f image2 "
        "-s ${width}x$height "
        "-start_number 0 "
        "-i ${imagePaths[0]} "
        "-filter_complex \"$filter\" "
        "-vcodec libx264 "
        "-crf 25 "
        "-pix_fmt yuv420p "
        "$outputPath";

    final FFmpegSession response = await FFmpegKit.executeAsync(command);

    if (ReturnCode.isSuccess(await response.getReturnCode())) {
      print('Video created successfully at $outputPath');
    } else {
      print('Error creating video: ${await response.getFailStackTrace()}');
      throw Exception('Video creation failed');
    }
  }

  String buildFilter() {
    String filter = "";

    for (int i = 1; i < imagePaths.length; i++) {
      filter +=
          "[$i:v]trim=duration=3,setsar=1:1,fifo[$i];[0:v][${i}]overlay=eof_action=pass[$i];";
    }

    filter += "concat=n=${imagePaths.length}:v=1:a=0,format=yuv420p[v]";

    return filter;
  }
}
