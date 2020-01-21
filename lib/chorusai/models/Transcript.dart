class Transcript {
  final String snippet;
  final String speaker;
  final double time;

  Transcript({this.snippet, this.speaker, this.time});

  factory Transcript.fromJson(Map<String, dynamic> json) => Transcript(
      snippet: json['snippet'],
      speaker: json['speaker'],
      time: json['time']
  );

  Map<String, dynamic> toJson() => {
        "snippet": snippet,
        "speaker": speaker,
        "time": time,
      };
}
