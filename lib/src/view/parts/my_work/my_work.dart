import 'package:flutter/material.dart';
import 'package:portfolio/src/models/project.dart';
import 'package:portfolio/src/utils/constants/constansts.dart';
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
  final List<Project> _myProjects = [
    Project(
        projectType: ProjectType.mobileApp,
        projectName: 'Anas Cars',
        projecGitHubUrl:  kAppOne,
        brandColors: [Colors.purple, Colors.white],
        projectImages: [
          'spark/spark_01.png',
          'spark/spark_02.png',
          'spark/spark_03.png',
          'spark/spark_04.png',
          'spark/spark_05.png'
        ],
        projectDescription: 'Cars app, I guess.',
        projectIconImage: 'spark/logo.png'),
    Project(
        projectType: ProjectType.mobileApp,
        projectName: 'GooLoads',
        projecGitHubUrl: kAppOne,
        brandColors: [Colors.black, Colors.white],
        projectImages: [
          '/spark/spark_01.png',
          '/spark/spark_02.png',
          '/spark/spark_03.png',
          '/spark/spark_04.png',
          '/spark/spark_05.png'
        ],
        projectDescription: 'Cars app, I guess.',
        projectIconImage: 'spark/logo.png'),
    Project(
        projectType: ProjectType.mobileApp,
        brandColors: [Colors.white, Colors.brown],
        projectName: 'TOGYMDO',
        projectImages: [
          '/spark/spark_01.png',
          '/spark/spark_02.png',
          '/spark/spark_03.png',
          '/spark/spark_04.png',
          '/spark/spark_05.png'
        ],
        projectDescription: 'Cars app, I guess.',
        projectIconImage: 'spark/logo.png'),
  ];

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
    final List<SlidableMobilePhone> _myMobileProjects = _myProjects
        .map((Project pro) => SlidableMobilePhone(project: pro))
        .toList();
    final SectionHeader _sectionHeader = SectionHeader(
      upperText: "MY WORK",
      lowerText: "What have I built?",
      upperFontSize: 40.sp,
      lowerFontSize: 35.sp,
    );
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20.h),
          Padding(padding: EdgeInsets.only(left: 60.w), child: _sectionHeader),
          SizedBox(height: 30.h),
          Padding(
            padding: EdgeInsets.only(left: 60.w),
            child: Txt(
              txt: 'the work you see below is a combination of both personl and clinent products.\nfrom E-Commerce apps all the way to VR worlds.',
              fontFam: 'semiBoldPoppins',
              alignment: TextAlign.left,
              size: 30.sp,
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
                  projectModel: _myProjects[index],
                ),
              ),
            ),
          ),
          SizedBox(height: 60.h),
        ],
      ),
    );
  }
}
