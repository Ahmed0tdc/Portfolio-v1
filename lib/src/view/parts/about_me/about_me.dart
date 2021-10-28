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
                size: 30,
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
            SizedBox(height: 60.h),
            SectionHeader.onePartOnly(upperText: 'Some more info about me:', upperFontSize: 35.sp),
            SizedBox(height: 30.h),
            Stack(
              clipBehavior: Clip.none,
              children: [
                _buildPersonalInfoTable(),
                Align(
                  alignment: Alignment(0.8 ,1),
                  child: LocationMapButton())
              ],
            ),
            SizedBox(height: 30.h),
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

        columnWidths: {0: FlexColumnWidth(0.2), 1: FlexColumnWidth(1),},
        children: _myPersonalInfo.keys
            .map((String info) => TableRow(children: [
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
            ).toList());
  }
}

class LocationMapButton extends StatefulWidget {
  const LocationMapButton({
    Key? key,
  }) : super(key: key);

  @override
  State<LocationMapButton> createState() => _LocationMapButtonState();
}

class _LocationMapButtonState extends State<LocationMapButton> {
  bool _isButtonHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) {
        setState(
          () {
            _isButtonHovered = true;
          },
        );
      },
      onExit: (event) {
        setState(
          () {
            _isButtonHovered = false;
          },
        );
      },
      child: Transform.scale(
        scale: _isButtonHovered ? 1.2 : 1,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          height: !_isButtonHovered ? 60 : 100,
          width: !_isButtonHovered ? 200 : 250,
          decoration: BoxDecoration(
            boxShadow: [BoxShadow(
              blurRadius: 0,
              spreadRadius: 0,
              color: const Color(0xAA00FF00),
              offset: Offset(30.w, 30.w)
            )],
          color: Theme.of(context).primaryColor,
          ),
          child: !_isButtonHovered
              ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(width: 10.w),
                    Icon(
                      Icons.location_pin,
                      color: kwhite,
                    ),
                    SizedBox(width: 30.w),
                    Txt(clr: kwhite, size: 16, txt: 'Find me'),
                    SizedBox(width: 30.w),
                  ],
                )
              : Container(
                  width: 100,
                  height: 200,
                  decoration: BoxDecoration(
                    border: Border.all(color: Theme.of(context).primaryColor),
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage('assets/images/map.jpg')
                        ),
                  ),
                ),
        ),
      ),
    );
  }
}
