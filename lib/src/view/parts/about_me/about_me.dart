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
                    alignment: Alignment.topLeft,
                    padding: EdgeInsets.only(left: 60.w, top: 20.h),
                    child: Txt(
                      txt: myPersona.fullname?.toUpperCase() ?? '', //.split(' ').map((txt) => txt.substring(0,1).toUpperCase()+txt.substring(1).toLowerCase()).join(' ') ?? '',
                      clr: kblack,
                      alignment: TextAlign.left,
                      size: 50.sp,
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
                 Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Padding(
                          padding: EdgeInsets.only(left: 60.w, top: 20.h, right: 60.w),
                          child: SectionHeader(
                            upperText: 'ABOUT ME',
                            lowerText: 'Who I am?',
                            upperFontSize: 40.sp,
                            lowerFontSize: 35.sp,
                          ),
                        ),
                      ),
                      const Spacer()
                    ],
                  ),
                Container(
                  padding: EdgeInsets.only(left: 60.w, top: 20.h, right: 60.w),
                  child: Column(
                    children: [
                      Txt(
                        txt: myPersona.biography?.substring(40) ?? '',
                        clr: kblack,
                        alignment: TextAlign.left,
                        size: 20.sp,
                      ),
                     SizedBox(height: 10.h),
                     _buildPersonalInfoTable(),
                    //  const Spacer()
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
    return Table(
      children: <TableRow>[
        TableRow(
          children: [
            Txt(txt: "Age", clr: kgreen.withOpacity(0.6), size: 30.sp),
            Txt(txt: ":", clr: kblack, size: 30.sp),
            Txt(txt: myPersona.age.toString(), clr: kblack, size: 30.sp),
            Container()
          ]
        ),
        TableRow(
          children: [
            Txt(txt: "Adress", clr: kgreen.withOpacity(0.6), size: 30.sp),
            Txt(txt: ":", clr: kblack, size: 30.sp),
            Txt(txt: myPersona.adress ?? '', clr: kblack, size: 30.sp),
            ElevatedButton(onPressed: (){}, child: Txt(txt: 'Find me'))
          ]
        ),
      ],      
    );
  }
}
