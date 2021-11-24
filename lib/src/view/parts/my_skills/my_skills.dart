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
      makeFlat: false,
      upperText: "MY SKILLS",
      lowerText: "What do I know?",
      upperFontSize: 30,
      lowerFontSize: 24
    );
    return ListView(
      physics: const BouncingScrollPhysics(),
      controller: context.read<ProviderClass>().getScrollController,
      children: [
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: _sectionHeader,
        ),
        const SizedBox(height: 50),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Row(
            children: [
              Expanded(
                child: Container(
                  padding: EdgeInsets.only(top: 20, left: 30, right: 30, bottom: 20),
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 0,
                        spreadRadius: 0,
                        color: const Color(0xAAFFFFFF),
                        offset: Offset(15, 15)
                      )
                    ],
                    color: kwhite
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: List.generate(skillData.length, (index) => Padding(padding: EdgeInsets.only(bottom: 20), child: SkillBar(index: index, skillData: skillData[index]))),
                  ),
                ),
              ),
              SizeConfig.isDesktop() ? const Spacer() : const SizedBox.shrink()
            ],
          ),
        ),
        const SizedBox(height: 30),
      ],
    );
  }
}

