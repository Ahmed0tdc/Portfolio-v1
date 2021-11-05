// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:portfolio/src/state/provider_class.dart';
import 'package:portfolio/src/utils/constants/data.dart';
import 'package:portfolio/src/utils/constants/palette.dart';
import 'package:portfolio/src/utils/sizeconfig.dart';
import 'package:portfolio/src/view/global_widgets/section_header.dart';
import 'package:provider/src/provider.dart';
import 'local_widgets/skill_bar.dart';


class SkillsSection extends StatelessWidget {
  const SkillsSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const SectionHeader _sectionHeader = SectionHeader(
      upperText: "MY SKILLS",
      lowerText: "What do I know?",
      upperFontSize: 30,
      lowerFontSize: 24
    );
    return SingleChildScrollView(
      controller: context.read<ProviderClass>().getScrollController,
      child: Padding(
        padding: const EdgeInsets.only(left: 30, right: 30, top: 20,),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _sectionHeader,
            const SizedBox(height: 50),
            Container(
              padding: EdgeInsets.only(top: 20, left: 30, right: 30, bottom: 20),
              width: SizeConfig.isDesktop() ? MediaQuery.of(context).size.width * 0.5 : MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                boxShadow: [BoxShadow(
                  blurRadius: 0,
                  spreadRadius: 0,
                  color: const Color(0xAAFFFFFF),
                  offset: Offset(15, 15)
                )],
                color: kwhite),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: List.generate(skillData.length, (index) => SkillBar(index: index, skillData: skillData[index])),
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}

