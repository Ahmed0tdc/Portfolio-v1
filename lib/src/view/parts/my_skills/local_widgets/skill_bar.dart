import 'package:flutter/material.dart';
import 'package:portfolio/src/models/skill.dart';
import 'package:portfolio/src/utils/constants/palette.dart';
import 'package:portfolio/src/utils/sizeconfig.dart';
import 'package:portfolio/src/view/global_widgets/custom_text.dart';
import 'dart:math' as math;


class SkillBar extends StatefulWidget {
  final Map<String, dynamic> skillData;
  final int index;
  const SkillBar({ Key? key, required this.skillData, required this.index}) : super(key: key);

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
          txt: widget.skillData['type'], // if type is wrong do the other
          clr: kblack,
          size: 20,
          fontFam: 'semiBoldPoppins',
        ),
        const SizedBox(height: 5),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[...(widget.skillData['skills'] as List<Skill>)
              .map((Skill skill) =>  
              ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: Stack(
                    alignment: const Alignment(-0.9, 0.9),
                    children: [
                      Image.asset(skill.icon, height: 100),
                      Container(
                        transform: Matrix4.rotationZ(math.pi / 5),
                        padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 4),
                        decoration: BoxDecoration(color: Theme.of(context).primaryColor),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(Icons.check, color: kwhite, size: 16),
                            const SizedBox(width: 5),
                            Txt(txt: skill.masteryLevel.round().toString()+'%', size: 13),
                          ],
                        ),
                      )
                    ],
                  ),
                  title: Txt(
                    txt: skill.name,
                    fontFam: 'boldPoppins',
                    size: 20,
                    clr: kblack,
                  ),
                  subtitle: LayoutBuilder(
                    builder: (context, constraints){
                      final maxWidth = constraints.maxWidth;
                      return Stack(
                        alignment: Alignment.centerLeft,
                        children: [
                          Container(
                            height: 10,
                            width: maxWidth,
                            decoration: BoxDecoration(
                              color: ktrans,
                              border: Border.all(color: kblack, width: 2),
                            ),
                          ),
                          TweenAnimationBuilder<double>(               
                            curve: Curves.easeOut,             
                            duration: Duration(milliseconds: 300 + (200 * (widget.index + 1))),
                            tween: Tween<double>(begin: 0, end: 1),
                            builder: (context, double val, _) {
                              return Container(                        
                                height: 10,
                                width:  ((skill.masteryLevel / 100) * maxWidth) * val,
                                decoration: BoxDecoration(
                                  border: const Border(
                                    top: BorderSide(color: kblack, width: 2),
                                    left: BorderSide(color: kblack, width: 2),
                                    bottom: BorderSide(color: kblack, width: 2),
                                  ),
                                  color: Theme.of(context).primaryColor,
                                ),
                              );
                            }
                          ),
                        ],
                      );
                    },
                  )
                ),
              ).toList(),
              const SizedBox(height: 10)
          ]
        )
      
      ],
    );
  }
} 