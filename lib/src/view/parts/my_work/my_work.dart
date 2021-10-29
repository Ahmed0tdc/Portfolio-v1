import 'package:carousel_slider/carousel_slider.dart';
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
  final _myProjects = [
    Project(
        projectType: ProjectType.mobileApp,
        projectName: 'Anas Cars',
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
    final List<SlidableMobilePhone> _myMobileProjects = _myProjects.map((Project pro) => SlidableMobilePhone(project: pro)).toList();
    final Widget _sectionHeader = Row(
      children: [
        SectionHeader(
          upperText: "MY WORK",
          lowerText: "What have I built?",
          upperFontSize: 40.sp,
          lowerFontSize: 35.sp,
        ),
      ],
    );
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 20.h),
          Padding(padding: EdgeInsets.only(left: 60.w), child: _sectionHeader),
          SizedBox(height: 30.h),
          ColoredBox(
            color: Colors.white.withOpacity(0.4),
            child: Column(
              children: List.generate(
                _myMobileProjects.length,
                (index) => ProjectDisplaySection(displayProject: _myMobileProjects[index], projectModel: _myProjects[index])))),
          SizedBox(height: 60.h),
        ],
      ),
    );
  }
}

