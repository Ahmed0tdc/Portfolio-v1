// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:portfolio/src/models/persona.dart';
import 'package:portfolio/src/utils/constants/constansts.dart';
import 'package:portfolio/src/utils/constants/palette.dart';
import 'package:portfolio/src/utils/sizeconfig.dart';
import 'package:portfolio/src/view/global_widgets/custom_text.dart';
import 'package:portfolio/src/view/global_widgets/section_header.dart';

class AboutMeSection extends StatelessWidget {
  final Persona myPersona;
  const AboutMeSection({Key? key, required this.myPersona}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,                
      children: [
         Padding(
           padding: EdgeInsets.only(left: 60.w, top: 20.h, right: 60.w),
           child: SectionHeader(
             upperText: 'ABOUT ME',
             lowerText: 'Allow me to introduce myself', //'Who I am?',
             upperFontSize: 40.sp,
             lowerFontSize: 35.sp,
           ),
         ),
        Container(
          padding: EdgeInsets.only(left: 60.w, top: 25.h, right: 60.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            // mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Txt(
                      txt: myPersona.biography?.substring(0, 200) ?? '',
                      // clr: kblack,
                      alignment: TextAlign.left,
                      size: 20,
                    ),
                  ),
                  Spacer()
                ],
              ),
             SizedBox(height: 30.h),
             SectionHeader.onePartOnly(upperText: 'Some more info about me:', upperFontSize: 35.sp),
             SizedBox(height: 60.h),
            // Spacer(),
             _buildPersonalInfoTable(),
             SizedBox(height: 30.h),
            ],
          ),
        )
      ],
    );
  }

  Widget _buildPersonalInfoTable(){
    final _myPersonalInfo = {
      "Age" : myPersona.age,
      "Civil status" : myPersona.civilStatus,
      "Hobies" : myPersona.hobies?.join(", "),
      // "Years of experience" : myPersona.yearsOfExperience,
      "Adress" : myPersona.adress,
    };
    return Table(
      columnWidths: {
        0 : FlexColumnWidth(0.5),
        1 : FlexColumnWidth(0.25)
        },
      children: _myPersonalInfo.keys.map((info) => TableRow(
          children: [
            Txt(txt: info, clr: kgreen.withOpacity(0.6), size: 15),
            Txt(txt: ":", clr: kwhite, size: 15),
            Txt(txt: _myPersonalInfo[info]?.toString() ?? '', clr: kwhite, size: 15),
            info.toLowerCase() == 'adress'
            ? ElevatedButton(onPressed: (){}, child: Txt(txt: 'Find me'))
            : Container(),
          ]
        ),
      ).toList()    
    );
  }
}
