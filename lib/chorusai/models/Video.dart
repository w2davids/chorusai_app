import 'package:chorusai_app/chorusai/models/Transcript.dart';

class Video {
  final String id;
  final String url;
  final List<Transcript> transcripts;

  Video({this.id, this.url, this.transcripts});

  Map<String, dynamic> toJSON() =>
      {"id": id, "url": url, "transcripts": transcripts};
}
