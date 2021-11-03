import 'package:flutter/material.dart';
import 'package:portfolio/src/models/project.dart';
import 'package:portfolio/src/utils/constants/constansts.dart';
import 'package:portfolio/src/utils/constants/data.dart';
import 'package:portfolio/src/utils/constants/enums.dart';
import 'package:portfolio/src/utils/constants/palette.dart';
import 'package:portfolio/src/utils/sizeconfig.dart';
import 'package:portfolio/src/view/global_widgets/custom_text.dart';
import 'package:portfolio/src/view/global_widgets/section_header.dart';
import 'package:animate_do/animate_do.dart' as animatedo;

import 'local_widgets/project_display_section.dart';
import 'local_widgets/slidable_mobile_phone.dart';

class WorksSection extends StatefulWidget {
  const WorksSection({Key? key}) : super(key: key);

  @override
  State<WorksSection> createState() => _WorksSectionState();
}

class _WorksSectionState extends State<WorksSection> {

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final List<SlidableMobilePhone> _myMobileProjects = myProjects.map((Project pro) => SlidableMobilePhone(project: pro)).toList();
    final SectionHeader _sectionHeader = SectionHeader(
      upperText: "MY WORK",
      lowerText: "What have I built?",
      upperFontSize: 30, //40.sp,
      lowerFontSize: 24 //35.sp,
    );
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20.h),
          Padding(padding: EdgeInsets.only(left: 60.w), child: _sectionHeader),
          SizedBox(height: 30),
          Padding(
            padding: EdgeInsets.only(left: 60.w, right: 60.w),
            child: Row(
              children: [
                Expanded(
                  flex: SizeConfig.isDesktop() ? 2 : 1,
                  child: const Txt(
                    txt: 'My work is a various cambination of personal and client mobile/web applications made with love and attention, from TO-DO list apps to Business e-commerce apps',
                    fontFam: 'semiBoldPoppins',
                    alignment: TextAlign.left,
                    size: 19,
                  ),
                ),
                SizeConfig.isDesktop() ? const Spacer() : const SizedBox.shrink()
              ],
            ),
          ),
          SizedBox(height: 50.h),
          ColoredBox(
            color: kblack.withOpacity(0.2),
            child: Column(
              children: List.generate(
                _myMobileProjects.length,
                (index) => ProjectDisplaySection(
                  displayProject: _myMobileProjects[index],
                  projectModel: myProjects[index],
                ),
              ),
            ),
          ),
          SizedBox(height: 30.h),
        ],
      ),
    );
  }
}
