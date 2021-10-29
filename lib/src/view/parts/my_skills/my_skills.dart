import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:portfolio/src/models/skill.dart';
import 'package:portfolio/src/utils/constants/palette.dart';
import 'package:portfolio/src/utils/reused_widgets.dart';
import 'package:portfolio/src/utils/sizeconfig.dart';
import 'package:portfolio/src/view/global_widgets/custom_text.dart';
import 'package:portfolio/src/view/global_widgets/section_header.dart';
import 'dart:math' as math;
class SkillsSection extends StatelessWidget {
  const SkillsSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> _skillData = [
      {
        'type': 'Programming languages',
        'skills': [
          Skill(
              name: "Python",
              icon: 'assets/icons/python.png',
              masteryLevel: 79),
          Skill(name: "Dart", icon: 'assets/icons/dart.png', masteryLevel: 88)
        ]
      },
      {
        'type': 'Frameworks',
        'skills': [
          Skill(
              name: "Flutter",
              icon: 'assets/icons/flutter.png',
              masteryLevel: 65)
        ]
      },
      {
        'type': 'Other technologies',
        'skills': [
          Skill(
              name: "Firebase",
              icon: 'assets/icons/firebase.png',
              masteryLevel: 55)
        ]
      },
    ];
    final Widget _sectionHeader = Row(
      children: [
        SectionHeader(
          upperText: "MY SKILLS",
          lowerText: "What do I have under my belt?",
          upperFontSize: 40.sp,
          lowerFontSize: 35.sp,
        ),
      ],
    );
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(left: 60.w, top: 20.h, bottom: 20.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _sectionHeader,
            SizedBox(height: 40.h),
            Container(
              // margin: EdgeInsets.only(left: 60.w),
              padding: EdgeInsets.only(top: 20.h, left: 60.w, right: 60.w, bottom: 20.h),
              width: MediaQuery.of(context).size.width * 0.5,
              decoration: BoxDecoration(
                boxShadow: [BoxShadow(
                  blurRadius: 0,
                  spreadRadius: 0,
                  color: const Color(0xAAFFFFFF),
                  offset: Offset(30.w, 30.w)
                )],
                color: kwhite),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: List.generate(_skillData.length, (index) => SkillBar(skillData: _skillData[index])),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SkillBar extends StatefulWidget {
  final Map<String, dynamic> skillData;
  const SkillBar({ Key? key, required this.skillData }) : super(key: key);

  @override
  _SkillBarState createState() => _SkillBarState();
}

class _SkillBarState extends State<SkillBar> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Txt(
          txt: widget.skillData['type'],
          clr: kblack,
          size: 40.sp,
          fontFam: 'semiBoldPoppins',
        ),
        SizedBox(height: 5.h),
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[...(widget.skillData['skills'] as List<Skill>)
              .map((Skill skill) => ListTile(
                onTap: (){},
                  contentPadding: EdgeInsets.zero,
                  leading: Stack(
                    alignment: const Alignment(-0.9, 0.9),
                    children: [
                      Image.asset(skill.icon, height: 100.w),
                      Container(
                        transform: Matrix4.rotationZ(math.pi / 5),
                        padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 10.w),
                        decoration: BoxDecoration(color: Theme.of(context).primaryColor),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(Icons.check, color: kwhite, size: 13),
                            SizedBox(width: 5.w),
                            Txt(txt: skill.masteryLevel.round().toString()+'%', size: 15.sp),
                          ],
                        ),
                      )
                    ],
                  ),
                  title: Txt(
                    txt: skill.name,
                    fontFam: 'boldPoppins',
                    size: 20.sp,
                    clr: kblack,
                  ),
                  subtitle: LayoutBuilder(
                    builder: (context, constraints){
                      final maxWidth = constraints.maxWidth;
                      return Stack(
                        alignment: Alignment.centerLeft,
                        children: [
                          Container(
                            height: 6.h,
                            width: maxWidth,
                            decoration: BoxDecoration(
                              color: ktrans,
                              border: Border.all(color: kblack, width: 3.w),
                            ),
                          ),
                          Container(                        
                            height: 6.h,
                            width:  ((skill.masteryLevel / 100) * maxWidth),
                            decoration: BoxDecoration(
                              border: Border(
                                top: BorderSide(color: kblack, width: 3.w),
                                left: BorderSide(color: kblack, width: 3.w),
                                bottom: BorderSide(color: kblack, width: 3.w),
                              ),
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                        ],
                      );
                    },
                  )
                ),
              ).toList(),
              SizedBox(height: 10.h)
          ]
        )
      ],
    );
  }
} 