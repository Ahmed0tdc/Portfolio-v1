import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/src/models/project.dart';
import 'package:portfolio/src/utils/constants/palette.dart';
import 'package:portfolio/src/utils/sizeconfig.dart';
import 'package:portfolio/src/view/global_widgets/custom_text.dart';
import 'package:portfolio/src/view/parts/my_work/local_widgets/slidable_mobile_phone.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectDisplaySection extends StatelessWidget {
  final SlidableMobilePhone displayProject;
  final Project projectModel;
  const ProjectDisplaySection(
      {Key? key, required this.displayProject, required this.projectModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: projectModel.brandColors != null
                  ? <Color>[
                      for (Color clr in projectModel.brandColors!)
                        clr.withOpacity(0.3)
                    ]
                  : [Theme.of(context).primaryColor, kblack])),
      child: Row(
        children: [
          SizedBox(width: 100.w),
          _buildProjectInfoSection(context),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 20),
            child: displayProject,
          ),
          SizedBox(width: 100.w),
        ],
      ),
    );
  }

  Widget _buildProjectInfoSection(BuildContext context) {
    return Container(
      padding:  EdgeInsets.only(left: 60.w, top: 20.h, bottom: 20.h, right: 60.w),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        boxShadow: [
          BoxShadow(
              blurRadius: 0,
              spreadRadius: 0,
              color: const Color(0x9900FF00),
              offset: Offset(30.w, 30.w))
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            'assets/images/projects/${projectModel.projectIconImage}',
            fit: BoxFit.fill,
            height: 80,
          ),
          SizedBox(height: 10),
          Txt(
            txt: projectModel.projectName,
            size: 24,
            // clr: kblack,
            fontFam: 'boldPoppins',
          ),
          SizedBox(height: 1.h),
          (projectModel.projecGitHubUrl != null)
              ? Text.rich(
                  TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                        style: const TextStyle(
                          color: Colors.blueAccent,
                          decoration: TextDecoration.underline
                        ),
                        text: 'See on GitHub',
                        recognizer: TapGestureRecognizer()
                          ..onTap = () async {
                            if (projectModel.projecGitHubUrl != null) {
                              if (await canLaunch(projectModel.projecGitHubUrl!)) {
                                await launch(projectModel.projecGitHubUrl!);
                              }
                            }
                          },
                      ),
                    ],
                  ),
                )
              : const SizedBox.shrink(),
        ],
      ),
    );
  }
}
