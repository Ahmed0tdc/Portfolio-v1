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
    return Container(
      color: kwhite,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Stack(
              children: [
                Image.asset(myPersona.picture ?? '', fit: BoxFit.cover),
                Positioned.fill(
                  child: Container(
                    alignment: Alignment.topCenter,
                    padding: EdgeInsets.only(top: 20.h),
                    child: Txt(
                      txt: myPersona.fullname?.toUpperCase() ?? '', //.split(' ').map((txt) => txt.substring(0,1).toUpperCase()+txt.substring(1).toLowerCase()).join(' ') ?? '',
                      clr: kblack,
                      alignment: TextAlign.left,
                      size: 60.sp,
                      fontFam: 'boldPoppins',
                    ),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: const [kwhite, ktrans],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter),
                    ),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Column(
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
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: Txt(
                              txt: myPersona.biography?.substring(40) ?? '',
                              clr: kblack,
                              alignment: TextAlign.left,
                              size: 20.sp,
                            ),
                          ),
                          const Spacer()
                        ],
                      ),
                     SizedBox(height: 30.h),
                     SectionHeader.onePartOnly(upperText: 'Some more info about me:', upperFontSize: 35.sp),
                     SizedBox(height: 10.h),
                     _buildPersonalInfoTable(),
                     SizedBox(height: 30.h),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
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
            Txt(txt: info, clr: kgreen.withOpacity(0.6), size: 20.sp),
            Txt(txt: ":", clr: kblack, size: 20.sp),
            Txt(txt: _myPersonalInfo[info]?.toString()??'', clr: kblack, size: 20.sp),
            info.toLowerCase() == 'adress'
            ? ElevatedButton(onPressed: (){}, child: Txt(txt: 'Find me'))
            : Container(),
          ]
        ),
      ).toList()    
    );
  }
}
