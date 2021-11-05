// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:animate_do/animate_do.dart' as animatedo;
import 'package:flutter/material.dart';
import 'package:portfolio/src/models/persona.dart';
import 'package:portfolio/src/state/provider_class.dart';
import 'package:portfolio/src/utils/constants/constansts.dart';
import 'package:portfolio/src/utils/constants/palette.dart';
import 'package:portfolio/src/utils/sizeconfig.dart';
import 'package:portfolio/src/view/global_widgets/custom_text.dart';
import 'package:portfolio/src/view/global_widgets/section_header.dart';
import 'package:provider/src/provider.dart';

import 'local_widgets/location_button.dart';

class AboutMeSection extends StatelessWidget {
  final Persona myPersona;
  const AboutMeSection({Key? key, required this.myPersona}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const SectionHeader _headerWidget = SectionHeader(
        upperText: 'ABOUT ME',
        lowerText:  'Who is Ahmed?', //'Allow me to introduce myself', //'Who I am?',
        upperFontSize: 30,
        lowerFontSize: 24);
    return SingleChildScrollView(
      controller: context.read<ProviderClass>().getScrollController,
      child: Padding(
        padding: const EdgeInsets.only(left: 30, top: 20, right: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _headerWidget,
            const SizedBox(height: 50),
            SizeConfig.isDesktop()
            ? const SizedBox.shrink()
            : animatedo.FadeInUp(
              duration: const Duration(milliseconds: 300),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.fromLTRB(30, 20, 0, 0),
                    decoration: BoxDecoration(
                      color: kwhite,
                      boxShadow: [
                        const BoxShadow(
                          offset: Offset(10, 10),
                          blurRadius: 0,
                          color: Color(0x55FFFFFF)
                        )
                      ]
                    ),
                    child: Image.asset(kMeWithGlasses, height: 300),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            animatedo.FadeInUp(
              duration: const Duration(milliseconds: 400),
              child: Txt(
                  txt: myPersona.fullname
                  ?.split(' ')
                  .map((String part) => 
                  // part.toLowerCase().trim() == 'ahmed' 
                  // ? part.substring(0, 1).toUpperCase().trim() + part.substring(1).toLowerCase().trim() + '\n'
                  // : 
                  part.substring(0, 1).toUpperCase().trim() + part.substring(1).toLowerCase().trim())
                  .join(' ') ??
              '',
                  size: SizeConfig.isDesktop() ? 40 : 35,
                  height: 1.1,
                  fontFam: 'boldPoppins',
                  isOverflow: true),
            ),
            const SizedBox(height: 5),
            Row(
              children: [
                Expanded(
                  flex: SizeConfig.isDesktop() ? 2 : 1,
                  child: animatedo.FadeInUp(
                    duration: const Duration(milliseconds: 500),
                    child: Txt(
                      txt: myPersona.biography ?? '',
                      fontFam: 'regPoppins',
                      alignment: TextAlign.left,
                      size: 18,
                    ),
                  ),
                ),
                SizeConfig.isDesktop()
                    ? const Spacer()
                    : const SizedBox.shrink()
              ],
            ),
            const SizedBox(height: 20),
            animatedo.FadeInUp(
              duration: const Duration(milliseconds: 600),
              child: _buildPersonalInfoTable()),
            // const SizedBox(height: 40),
            // const LocationMapButton(),
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
