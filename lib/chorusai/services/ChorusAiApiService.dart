import 'dart:async';
import 'dart:convert';

import 'package:chorusai_app/chorusai/models/Transcript.dart';
import 'package:http/http.dart' as http;

/**
 * Should be a singleton. 2 options.
 * 1. Private constructor and factory method for getting an instance.
 * 2. Create normal class - and declare static methods.
 */
class ChorusAiApiService {
  // Service End-points.
  static const String VIDEO_ENDPOINT = "https://static.chorus.ai/api";
  static const String TRANSCRIPT_ENDPOINT = "https://static.chorus.ai/api";

  static final ChorusAiApiService instance = ChorusAiApiService._private();

  ChorusAiApiService._private();

  factory ChorusAiApiService() => instance;

  String createVideoUrl(String videoId) {
    return "$VIDEO_ENDPOINT/${videoId}.mp4";
  }

  String createTranscriptUrl(String videoId) {
    return "$TRANSCRIPT_ENDPOINT/${videoId}.json";
  }

  Future<List<Transcript>> fetchTranscript(String videoId) async {
    var response = await http.get(createTranscriptUrl(videoId));
    if (response.statusCode == 200) {
      List jsonResponse = jsonDecode(response.body);
      return jsonResponse
          .map((transcript) => new Transcript.fromJson(transcript))
          .toList();
    } else {
      throw Exception("Error: Failed to load Transcipts from API");
    }
  }
}
