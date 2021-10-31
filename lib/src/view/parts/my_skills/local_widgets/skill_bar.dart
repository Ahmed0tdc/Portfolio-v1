import 'package:flutter/material.dart';
import 'package:portfolio/src/models/skill.dart';
import 'package:portfolio/src/utils/constants/palette.dart';
import 'package:portfolio/src/utils/sizeconfig.dart';
import 'package:portfolio/src/view/global_widgets/custom_text.dart';
import 'dart:math' as math;


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