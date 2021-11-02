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
      lowerText: 'Allow me to introduce myself', //'Who I am?',
      upperFontSize: 40.sp,
      lowerFontSize: 35.sp,
    );
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(left: 60.w, top: 20.h, right: 60.w),
        child: Column(
          // mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _headerWidget,
            SizedBox(height: 40.h),
            Txt(
                txt: myPersona.fullname
                        ?.split(' ')
                        .map((String part) =>
                            part.substring(0, 1).toUpperCase() +
                            part.substring(1).toLowerCase())
                        .join(' ') ??
                    '',
                size: 40,
                fontFam: 'boldPoppins',
                isOverflow: true),
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Txt(
                    txt: myPersona.biography ?? '',
                    fontFam: 'regPoppins',
                    alignment: TextAlign.left,
                    size: 18,
                  ),
                ),
                Spacer()
              ],
            ),
            // SizedBox(height: 60.h),
            // SectionHeader.onePartOnly(upperText: 'Some more info about me:', upperFontSize: 35.sp),
            SizedBox(height: 30.h),
            _buildPersonalInfoTable(),
            SizedBox(height: 30.h),
            LocationMapButton()
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
          0: FlexColumnWidth(0.2),
          1: FlexColumnWidth(1),
        },
        children: _myPersonalInfo.keys
            .map(
              (String info) => TableRow(children: [
                Txt(
                    txt: info,
                    clr: kgreen.withOpacity(0.8),
                    size: 15,
                    fontFam: 'boldPoppins'),
                // Txt(txt: ":", clr: kwhite, size: 15),
                Txt(
                    txt: _myPersonalInfo[info]?.toString() ?? '',
                    clr: kwhite,
                    size: 15),
              ]),
            )
            .toList());
  }
}
