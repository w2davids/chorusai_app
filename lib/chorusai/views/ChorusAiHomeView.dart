import 'package:chorusai_app/chorusai/models/Video.dart';
import 'package:chorusai_app/chorusai/services/ChorusAiApiService.dart';
import 'package:flutter/material.dart';

import 'Footer.dart';
import 'VideoPage.dart';

class ChorusAiHomePage extends StatefulWidget {
  ChorusAiHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _ChorusAiHomePageState createState() => _ChorusAiHomePageState();
}

class _ChorusAiHomePageState extends State<ChorusAiHomePage> {
  // Needs to come from API-service call.
  String videoId = "4d79041e-f25f-421d-9e5f-3462459b9934";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ChorusAI Demo"),
      ),
      body: HomePageView(videoId: videoId),
      bottomNavigationBar: Footer(),
    );
  }
}

class HomePageView extends StatelessWidget {
  final String videoId;

  const HomePageView({
    Key key,
    @required this.videoId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ChorusAiApiService.instance.fetchTranscript(videoId),
      builder: (context, snapshot) {
        final transcripts = snapshot.data;

        if (snapshot.connectionState == snapshot.error) {
          debugPrint("Error: Failed to connect to API server");
        }

        switch (snapshot.connectionState) {
          case ConnectionState.done:
            return VideoPage(
                video: new Video(
                    id: videoId,
                    url: ChorusAiApiService.instance.createVideoUrl(videoId),
                    transcripts: transcripts));
            break;
          case ConnectionState.active:
            debugPrint("Status: Active connection to API server");
            break;
          case ConnectionState.waiting:
            debugPrint("Status: Awaiting connection to API server");
            break;
          case ConnectionState.none:
            debugPrint("Status: Idle - No connection to API server");
            break;
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
