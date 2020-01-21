import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Footer extends StatelessWidget {
  static const String logoUrl =
      "https://static.chorus.ai/images/chorus-logo.svg";

  const Footer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Container(
      height: 40.0,
      color: Colors.white,
      child: SvgPicture.network(
        Footer.logoUrl,
        semanticsLabel: 'ChorusAI logo',
        placeholderBuilder: (context) => Icon(Icons.error),
      ),
    );
  }
}
