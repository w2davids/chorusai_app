import 'package:chewie/chewie.dart';
import 'package:chorusai_app/chorusai/models/Video.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoView extends StatefulWidget {
  final Video video;

  VideoView({Key key, @required this.video}) : super(key: key);

  @override
  _VideoViewState createState() => _VideoViewState(video: this.video);
}

class _VideoViewState extends State<VideoView> {
  VideoPlayerController videoPlayerController;
  ChewieController chewieController;
  Video video;

  _VideoViewState({@required this.video});

  @override
  void initState() {
    debugPrint("=> Video Url: ${video.url}");

    videoPlayerController = VideoPlayerController.network(video.url);
    chewieController = ChewieController(
      videoPlayerController: videoPlayerController,
      aspectRatio: 3 / 2,
      autoPlay: true,
      looping: true,
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Chewie(
      controller: chewieController,
    );
  }

  @override
  void dispose() {
    videoPlayerController.dispose();
    chewieController.dispose();
    super.dispose();
  }
}
