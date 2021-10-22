import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:portfolio/src/models/skill.dart';
import 'package:portfolio/src/utils/constants/palette.dart';
import 'package:portfolio/src/utils/reused_widgets.dart';
import 'package:portfolio/src/utils/sizeconfig.dart';
import 'package:portfolio/src/view/global_widgets/custom_text.dart';
import 'package:portfolio/src/view/global_widgets/section_header.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _skillData = [
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
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 60.w, top: 20.h),
          child: SectionHeader(
            upperText: "MY SKILLS",
            lowerText: "What do I have under my belt?",
            upperFontSize: 40.sp,
            lowerFontSize: 35.sp,
          ),
        ),
        ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 300, minWidth: 200),
          child: FittedBox(
            fit: BoxFit.fill,
            child: Container(
              decoration: BoxDecoration(color: kwhite),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children:
                List.generate(
                  _skillData.length,
                  (index) => _buildSkillSection(
                    _skillData[index],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSkillSection(Map<String, dynamic> skillData) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Txt(
          txt: skillData['type'],
          clr: kblack,
          size: 40.sp,
          fontFam: 'semiBoldPoppins',
        ),
        SizedBox(height: 30.h),
        Container(
          color: Colors.red,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: (skillData['skills'] as List<Skill>)
                .map(
                  (Skill skill) => Row(
                    children: [
                      Image.asset(skill.icon),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Txt(
                            txt: skill.name,
                            fontFam: 'boldPoppins',
                            clr: kblack,
                          ),
                          Container(
                            height: 10.h,
                            // width: double.infinity,
                            decoration: BoxDecoration(
                              color: ktrans,
                              border: Border.all(color: kblack, width: 8.w),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                )
                .toList(),
          ),
        )
      ],
    );
  }
}
