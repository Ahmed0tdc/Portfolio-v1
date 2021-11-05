import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/src/models/project.dart';
import 'package:portfolio/src/state/provider_class.dart';
import 'package:portfolio/src/utils/constants/palette.dart';
import 'package:portfolio/src/utils/sizeconfig.dart';
import 'package:portfolio/src/view/global_widgets/custom_text.dart';
import 'package:portfolio/src/view/parts/my_work/local_widgets/slidable_mobile_phone.dart';
import 'package:provider/provider.dart';
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
        width: !SizeConfig.isDesktop() ? double.infinity : null,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: projectModel.brandColors != null
                  ? <Color>[
                      for (Color clr in projectModel.brandColors!)
                        clr.withOpacity(0.3)
                    ]
                  : [Theme.of(context).primaryColor, kblack]),
        ),
        child: SizeConfig.isDesktop()
            ? Row(
                children: [
                  SizedBox(width: 100.w),
                  Column(
                    children: [
                      _buildProjectInfoSection(context),
                      SizedBox(height: 60.h),
                      GestureDetector(
                        onTap: () {
                          context.read<ProviderClass>().setSelectedProject =
                              projectModel;
                          Navigator.of(context).pushNamed('/more_info');
                        },
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Txt(
                                txt: 'Learn more',
                                clr: Theme.of(context).primaryColor,
                                size: 20),
                            const SizedBox(width: 5),
                            Icon(Icons.arrow_forward_ios_rounded,
                                color: Theme.of(context).primaryColor)
                          ],
                        ),
                      )
                    ],
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 20),
                    child: displayProject,
                  ),
                  SizedBox(width: 100.w),
                ],
              )
            : Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),
                    Container(
                      padding: const EdgeInsets.only(left: 30),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Hero(
                                tag:
                                    'tag-${projectModel.projectIconImage}+${projectModel.projectName}',
                                child: Image.asset(
                                    'assets/images/projects/${projectModel.projectIconImage}',
                                    fit: BoxFit.fill,
                                    height: 100),
                              ),
                              const SizedBox(height: 1),
                              GestureDetector(
                                onTap: () {
                                  context
                                      .read<ProviderClass>()
                                      .setSelectedProject = projectModel;
                                  Navigator.of(context).pushNamed('/more_info');
                                },
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Txt(
                                        txt: 'Learn more',
                                        clr: Theme.of(context).primaryColor,
                                        size: 16),
                                    const SizedBox(width: 5),
                                    Icon(Icons.arrow_forward_ios_rounded,
                                        size: 15,
                                        color: Theme.of(context).primaryColor)
                                  ],
                                ),
                              )
                            ],
                          ),
                          const SizedBox(width: 15),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Txt(
                                txt: projectModel.projectName,
                                size: 40,
                                fontFam: 'boldPoppins',
                              ),
                              (projectModel.projecGitHubUrl != null)
                                  ? Text.rich(
                                      TextSpan(
                                        children: <TextSpan>[
                                          TextSpan(
                                            style: const TextStyle(
                                                color: Colors.blueAccent,
                                                decoration:
                                                    TextDecoration.underline),
                                            text: 'See on GitHub',
                                            recognizer: TapGestureRecognizer()
                                              ..onTap = () async {
                                                if (projectModel
                                                        .projecGitHubUrl !=
                                                    null) {
                                                  if (await canLaunch(
                                                      projectModel
                                                          .projecGitHubUrl!)) {
                                                    await launch(projectModel
                                                        .projecGitHubUrl!);
                                                  }
                                                }
                                              },
                                          ),
                                        ],
                                      ),
                                    )
                                  : const SizedBox.shrink(),
                            ],
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [displayProject],
                    ),
                  ],
                ),
              ));
  }

  Widget _buildProjectInfoSection(BuildContext context, {bool noBg = false}) {
    return Container(
      padding:
          EdgeInsets.only(left: 60.w, top: 20.h, bottom: 20.h, right: 60.w),
      decoration: BoxDecoration(
        color: !noBg ? Theme.of(context).primaryColor : null,
        boxShadow: !noBg
            ? [
                BoxShadow(
                    blurRadius: 0,
                    spreadRadius: 0,
                    color: const Color(0x9900FF00),
                    offset: Offset(30.w, 30.w))
              ]
            : null,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Hero(
            tag:
                'tag-${projectModel.projectIconImage}+${projectModel.projectName}',
            child: Image.asset(
              'assets/images/projects/${projectModel.projectIconImage}',
              fit: BoxFit.fill,
              height: 80,
            ),
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
                            decoration: TextDecoration.underline),
                        text: 'See on GitHub',
                        recognizer: TapGestureRecognizer()
                          ..onTap = () async {
                            if (projectModel.projecGitHubUrl != null) {
                              if (await canLaunch(
                                  projectModel.projecGitHubUrl!)) {
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
