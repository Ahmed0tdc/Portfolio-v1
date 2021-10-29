import 'package:flutter/material.dart';
import 'package:portfolio/src/models/project.dart';
import 'package:portfolio/src/utils/constants/palette.dart';
import 'package:portfolio/src/utils/sizeconfig.dart';
import 'package:portfolio/src/view/parts/my_work/local_widgets/slidable_mobile_phone.dart';

class ProjectDisplaySection extends StatelessWidget {
  final SlidableMobilePhone displayProject;
  final Project projectModel;
  final Color? backgroundColor;
  const ProjectDisplaySection(
      {Key? key,
      required this.displayProject,
      required this.projectModel,
      this.backgroundColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      color: backgroundColor ?? kblack.withOpacity(0.65),
      child: Row(
        children: [
          SizedBox(width: 100.w),
          _buildProjectInfoSection(),
          const Spacer(),
          Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 20),
              child: displayProject),
          SizedBox(width: 100.w),
        ],
      ),
    );
  }

  Widget _buildProjectInfoSection() {
    return Image.asset(
      'assets/images/projects/${projectModel.projectIconImage}',
      fit: BoxFit.fill,
      height: 80,
    );
  }
}
