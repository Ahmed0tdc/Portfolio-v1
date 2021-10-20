import 'package:flutter/material.dart';
import 'package:portfolio/src/utils/constants/constansts.dart';
import 'package:portfolio/src/utils/constants/palette.dart';
import 'package:portfolio/src/utils/sizeconfig.dart';
import 'package:portfolio/src/view/global_widgets/section_header.dart';

class AboutMeSection extends StatelessWidget {
  const AboutMeSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kwhite,
      child: Row(
        children: [
          Expanded(
            child: Container(
              child: Image.asset(kMeUnderSky),
            ),
          ),
          Expanded(
            flex: 2,
            child: Column(children: const [
              SectionHeader(
                upperText: 'ABOUT ME',
                lowerText: 'Who I am?',
              )
            ],),
          ),
        ],
      ),
    );
  }
}
