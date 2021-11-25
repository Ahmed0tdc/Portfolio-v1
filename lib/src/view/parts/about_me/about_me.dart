// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:animate_do/animate_do.dart' as animatedo;
import 'package:flutter/material.dart';
import 'package:portfolio/src/models/persona.dart';
import 'package:portfolio/src/models/skill.dart';
import 'package:portfolio/src/state/provider_class.dart';
import 'package:portfolio/src/utils/constants/constansts.dart';
import 'package:portfolio/src/utils/constants/palette.dart';
import 'package:portfolio/src/utils/sizeconfig.dart';
import 'package:portfolio/src/view/global_widgets/custom_text.dart';
import 'package:portfolio/src/view/global_widgets/section_header.dart';
import 'package:portfolio/src/view/parts/my_skills/local_widgets/skill_bar.dart';
import 'package:provider/src/provider.dart';
import 'dart:math' as math;

class AboutMeSection extends StatelessWidget {
  final Persona myPersona;
  const AboutMeSection({Key? key, required this.myPersona}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final SectionHeader _headerWidget = SectionHeader(
      makeFlat: false,
      upperText: 'ABOUT ME',
      lowerText:
          'Who is Ahmed?', //'Allow me to introduce myself', //'Who I am?',
      upperFontSize: 30,
      lowerFontSize: 24,
      // bottomSpacing: SizeConfig.isDesktop() ? null : -45,
      // isCentered: SizeConfig.isDesktop() ? false : true,
    );
    final String _name = myPersona.fullname
            ?.split(' ')
            .map((String part) =>
                part.substring(0, 1).toUpperCase().trim() +
                part.substring(1).toLowerCase().trim())
            .join(' ') ??
        '';
    return ListView(
      physics: const BouncingScrollPhysics(),
      controller: context.read<ProviderClass>().getScrollController,
      children: [
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: _headerWidget,
        ),
        SizedBox(height: SizeConfig.isDesktop() ? 50 : 60),
        SizeConfig.isDesktop()
            ? const SizedBox.shrink()
            : animatedo.FadeInUp(
                duration: const Duration(milliseconds: 300),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.fromLTRB(30, 20, 0, 0),
                        decoration: BoxDecoration(color: kwhite, boxShadow: [
                          const BoxShadow(
                              offset: Offset(10, 10),
                              blurRadius: 0,
                              color: Color(0x55FFFFFF))
                        ]),
                        child: Image.asset(kMeWithGlasses, height: 300),
                      ),
                    ],
                  ),
                ),
              ),
        SizedBox(height: SizeConfig.isDesktop() ? 30 : 50),
        animatedo.FadeInUp(
          duration: const Duration(milliseconds: 400),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Row(
              children: [
                Expanded(
                  flex: SizeConfig.isDesktop() ? 2 : 1,
                  child: Container(
                    padding: const EdgeInsets.all(30.0),
                    decoration: BoxDecoration(
                      boxShadow: const [
                        BoxShadow(
                            blurRadius: 0,
                            offset: Offset(8, 8),
                            color: Color(0x33FFFFFF) //Color(0x2200FF00)
                            )
                      ],
                      color: kwhite,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Txt(
                            txt: _name.toUpperCase(),
                            clr: kblack,
                            size: SizeConfig.isDesktop() ? 45 : 40,
                            height: 1.1,
                            fontFam: 'boldPoppins',
                            maxLines: 1,
                            isOverflow: true),
                        const SizedBox(height: 5),
                        Txt(
                          txt: myPersona.biography ?? '',
                          fontFam: 'regPoppins',
                          alignment: TextAlign.left,
                          clr: Colors.black87,
                          size: 18,
                        ),
                        const SizedBox(height: 20),
                        _buildPersonalInfoTable(),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            MaterialButton(onPressed: (){}, child: Text("My Skills")),
                            const SizedBox(width: 20),                            
                            MaterialButton(onPressed: (){}, child: Text("Hire me")),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                SizeConfig.isDesktop()
                    ? const Spacer()
                    : const SizedBox.shrink()
              ],
            ),
          ),
        ),
        // const LocationMapButton(),
        const SizedBox(height: 50),
        animatedo.FadeInUp(
          duration: const Duration(milliseconds: 800),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: SectionHeader(
              isOnePartOnly: true,
              kid: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Image.asset(
                      'assets/icons/language.png',
                      height: 40,
                    ),
                    SizedBox(width: 10),
                    Txt(txt: "Languages I speak", size: 24),
                  ],
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 20),
        animatedo.FadeInUp(
          duration: const Duration(milliseconds: 500),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Row(
              children: [
                Expanded(
                  flex: SizeConfig.isDesktop() ? 2 : 1,
                  child: Column(
                    children: List.generate(
                      3,
                      (index) => LangBar(
                        index: index,
                        langSkill: [
                          Skill(
                              name: "English (Fluent)",
                              icon: '',
                              masteryLevel: 89),
                          Skill(
                              name: "Arabic (Native)",
                              icon: '',
                              masteryLevel: 100),
                          Skill(
                              name: "French (Conversational)",
                              icon: '',
                              masteryLevel: 54)
                        ][index],
                      ),
                    ),
                  ),
                ),
                SizeConfig.isDesktop()
                    ? const Spacer()
                    : const SizedBox.shrink()
              ],
            ),
          ),
        ),
        const SizedBox(height: 30),
      ],
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
          0: FlexColumnWidth(SizeConfig.isDesktop() ? 0.2 : 0.5),
          1: FlexColumnWidth(1),
        },
        children: _myPersonalInfo.keys
            .map(
              (String info) => TableRow(
                children: [
                  Txt(
                    txt: info,
                    clr: kgreen.withOpacity(0.8),
                    size: 15,
                    fontFam: 'boldPoppins',
                  ),
                  Txt(
                    txt: _myPersonalInfo[info]?.toString() ?? '',
                    clr: kblack,
                    size: 15,
                  ),
                ],
              ),
            )
            .toList());
  }
}

class LangBar extends StatefulWidget {
  final Skill langSkill;
  final int index;
  const LangBar({Key? key, required this.langSkill, required this.index})
      : super(key: key);

  @override
  _LangBarState createState() => _LangBarState();
}

class _LangBarState extends State<LangBar> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Stack(
        alignment: const Alignment(-0.3, 0.2),
        children: [
          widget.langSkill.icon.isNotEmpty
              ? Image.asset(widget.langSkill.icon, height: 100)
              : Container(
                  height: 100,
                  width: 100,
                  // padding: EdgeInsets.all(5),
                  decoration:
                      BoxDecoration(shape: BoxShape.circle, color: kwhite),
                  alignment: Alignment.center,
                  child: Txt(
                      clr: kblack,
                      fontFam: 'boldPoppins',
                      isBold: true,
                      txt: widget.langSkill.name.substring(0, 1).toUpperCase() +
                          widget.langSkill.name.substring(1, 2).toLowerCase(),
                      size: 30),
                ),
          Container(
            transform: Matrix4.rotationZ(math.pi / 5),
            padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 4),
            decoration: BoxDecoration(color: Theme.of(context).primaryColor),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.check, color: kwhite, size: 16),
                const SizedBox(width: 5),
                Txt(
                    txt: widget.langSkill.masteryLevel.round().toString() + '%',
                    size: 13),
              ],
            ),
          )
        ],
      ),
      title: Row(
        children: [
          Txt(
            txt: widget.langSkill.name.split(" ").first,
            fontFam: 'boldPoppins',
            size: 20,
            clr: kwhite,
          ),
          Txt(
            txt: widget.langSkill.name.split(" ").last,
            fontFam: 'medPoppins',
            size: 20,
            clr: kwhite,
          ),
        ],
      ),
      subtitle: LayoutBuilder(
        builder: (context, constraints) {
          final maxWidth = constraints.maxWidth;
          return Stack(
            alignment: Alignment.centerLeft,
            children: [
              Container(
                height: 15,
                width: maxWidth,
                decoration: BoxDecoration(
                  color: kwhite,
                  border: Border.all(color: Colors.grey[400]!, width: 2),
                ),
              ),
              TweenAnimationBuilder<double>(
                  curve: Curves.easeOut,
                  duration:
                      Duration(milliseconds: 300 + (200 * (widget.index + 1))),
                  tween: Tween<double>(begin: 0, end: 1),
                  builder: (context, double val, _) {
                    return Container(
                      height: 15,
                      width:
                          ((widget.langSkill.masteryLevel / 100) * maxWidth) *
                              val,
                      decoration: BoxDecoration(
                        border: Border(
                          top: BorderSide(color: Colors.grey[400]!, width: 2),
                          left: BorderSide(color: Colors.grey[400]!, width: 2),
                          right: BorderSide(
                              color: Colors.grey[400]!,
                              width:
                                  (widget.langSkill.masteryLevel * val == 100.0)
                                      ? 2
                                      : 0),
                          bottom:
                              BorderSide(color: Colors.grey[400]!, width: 2),
                        ),
                        color: Theme.of(context).primaryColor,
                      ),
                    );
                  }),
            ],
          );
        },
      ),
    );
  }
}
