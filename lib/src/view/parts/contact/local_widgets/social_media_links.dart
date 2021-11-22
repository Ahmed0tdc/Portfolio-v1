import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio/src/utils/constants/palette.dart';
import 'package:url_launcher/url_launcher.dart';

class SocialMediaLinks extends StatefulWidget {
  final Map socialMediaData;
  const SocialMediaLinks({Key? key, required this.socialMediaData})
      : super(key: key);

  @override
  _SocialMediaLinksState createState() => _SocialMediaLinksState();
}

class _SocialMediaLinksState extends State<SocialMediaLinks> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) => setState.call(() => isHovered = true),
      onExit: (event) => setState.call(() => isHovered = false),
      child: GestureDetector(
        onTap: () async {
          if (await canLaunch(widget.socialMediaData['link'])) {
            launch(widget.socialMediaData['link']);
          }
        },
        child: FaIcon(
          widget.socialMediaData['icon'],
           
          color: isHovered ? kwhite : kblack,
        ),
      ),
    );
  }
}
