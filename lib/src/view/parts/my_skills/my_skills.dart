import 'package:flutter/material.dart';
import 'package:portfolio/src/models/skill.dart';
import 'package:portfolio/src/utils/constants/palette.dart';
import 'package:portfolio/src/utils/sizeconfig.dart';
import 'package:portfolio/src/view/global_widgets/section_header.dart';
import 'local_widgets/skill_bar.dart';


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

