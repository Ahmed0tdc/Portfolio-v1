// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:animate_do/animate_do.dart' as animatedo;
import 'package:flutter/material.dart';
import 'package:portfolio/src/models/persona.dart';
import 'package:portfolio/src/utils/constants/constansts.dart';
import 'package:portfolio/src/utils/constants/palette.dart';
import 'package:portfolio/src/utils/sizeconfig.dart';
import 'package:portfolio/src/view/global_widgets/custom_text.dart';
import 'package:portfolio/src/view/global_widgets/section_header.dart';

import 'local_widgets/location_button.dart';

class AboutMeSection extends StatelessWidget {
  final Persona myPersona;
  const AboutMeSection({Key? key, required this.myPersona}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final SectionHeader _headerWidget = SectionHeader(
        upperText: 'ABOUT ME',
        lowerText:  'Who is Ahmed?', //'Allow me to introduce myself', //'Who I am?',
        upperFontSize: 30,
        lowerFontSize: 24);
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(left: 30, top: 20, right: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _headerWidget,
            const SizedBox(height: 50),
            Txt(
                txt: myPersona.fullname
                        ?.split(' ')
                        .map((String part) => part.toLowerCase().trim() == 'ahmed' 
                        ? part.substring(0, 1).toUpperCase() + part.substring(1).toLowerCase() + '\n'
                        : part.substring(0, 1).toUpperCase() + part.substring(1).toLowerCase())
                        .join(' ') ??
                    '',
                size: 40,
                fontFam: 'boldPoppins',
                isOverflow: true),
            Row(
              children: [
                Expanded(
                  flex: SizeConfig.isDesktop() ? 2 : 1,
                  child: Txt(
                    txt: myPersona.biography ?? '',
                    fontFam: 'regPoppins',
                    alignment: TextAlign.left,
                    size: 18,
                  ),
                ),
                SizeConfig.isDesktop()
                    ? const Spacer()
                    : const SizedBox.shrink()
              ],
            ),
            const SizedBox(height: 30),
            _buildPersonalInfoTable(),
            const SizedBox(height: 40),
            const LocationMapButton(),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget _buildPersonalInfoTable() {
    final Map<String, dynamic> _myPersonalInfo = {
      "Age": myPersona.age,
      "Civil status": myPersona.civilStatus,
      "Hobies": (myPersona.hobies != null)
          ? myPersona.hobies!
                  .sublist(0, myPersona.hobies!.length - 1)
                  .join(", ") +
              ' and ${myPersona.hobies!.last}'
          : 'No hobbies',
      // "Years of experience" : myPersona.yearsOfExperience,
      "Address": myPersona.address,
    };
    return Table(
        columnWidths: {
          0 : FlexColumnWidth(SizeConfig.isDesktop() ? 0.2 : 0.5),
          1 : FlexColumnWidth(1),
        },
        children: _myPersonalInfo.keys
            .map(
              (String info) => TableRow(
                children: [
                  Txt(
                      txt: info,
                      clr: kgreen.withOpacity(0.8),
                      size: 15,
                      fontFam: 'boldPoppins',
                  ),
                  Txt(
                      txt: _myPersonalInfo[info]?.toString() ?? '',
                      clr: kwhite,
                      size: 15,
                  ),
                ],
              ),
            )
            .toList());
  }
}
