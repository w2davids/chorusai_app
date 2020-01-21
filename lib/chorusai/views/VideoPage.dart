import 'package:chorusai_app/chorusai/models/Video.dart';
import 'package:chorusai_app/chorusai/views/TranscriptListView.dart';
import 'package:chorusai_app/chorusai/views/VideoView.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class VideoPage extends StatelessWidget {
  final Video video;

  const VideoPage({@required this.video}) : super();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        VideoView(
          video: this.video,
        ),
        Expanded(
          child: TranscriptListView(transcripts: video.transcripts),
        )
      ],
    );
  }
}
