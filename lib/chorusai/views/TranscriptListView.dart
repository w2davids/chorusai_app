import 'package:chorusai_app/chorusai/models/Transcript.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'TranscriptCard.dart';

class TranscriptListView extends StatelessWidget {
  final List<Transcript> transcripts;

  const TranscriptListView({
    Key key,
    @required this.transcripts,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) {
        return Divider(
          height: 2,
          color: Colors.white,
        );
      },
      itemBuilder: (context, index) {
        return TranscriptCard(transcript: transcripts[index]);
      },
      itemCount: transcripts.length,
    );
  }
}
