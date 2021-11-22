import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/src/models/project.dart';
import 'package:portfolio/src/state/provider_class.dart';
import 'package:portfolio/src/utils/constants/palette.dart';
import 'package:portfolio/src/utils/sizeconfig.dart';
import 'package:portfolio/src/view/global_widgets/custom_text.dart';
import 'package:portfolio/src/view/parts/my_work/local_widgets/slidable_mobile_phone.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
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
                  ? <Color>[for (Color clr in projectModel.brandColors!) clr.withOpacity(0.3)]
                  : [Theme.of(context).primaryColor, kblack]),
        ),
        child: SizeConfig.isDesktop()
            ? Row(
                children: [
                  SizedBox(width: 100.w),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildProjectInfoSection(context),
                      const SizedBox(height: 60),
                      _getProjectLinks(context)
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
                          Hero(
                            tag:
                                'tag-${projectModel.projectIconImage}+${projectModel.projectName}',
                            child: Image.asset(
                                'assets/images/projects/${projectModel.projectIconImage}',
                                fit: BoxFit.fill,
                                height: 100),
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
                              const SizedBox(height: 5),
                              GestureDetector(
                                  onTap: () {
                                    context
                                        .read<ProviderClass>()
                                        .setSelectedProject = projectModel;
                                    Navigator.of(context)
                                        .pushNamed('/more_info');
                                  },
                                  child: Shimmer.fromColors(
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: const [
                                          Txt(
                                            txt: 'Learn more',
                                            clr: kwhite,
                                            size: 18,
                                          ),
                                          SizedBox(width: 5),
                                          Icon(Icons.arrow_forward_ios_rounded,
                                              color: kwhite)
                                        ],
                                      ),
                                      baseColor: kwhite,
                                      highlightColor: kwhite.withOpacity(0.3))),
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
                    const SizedBox(height: 20),
                    _getProjectLinks(context)
                  ],
                ),
              ));
  }

  Widget _getProjectLinks(BuildContext context) {
    Widget _buildLinkContainer({required String source}) {
      return Container(
        padding: const EdgeInsets.only(right: 5, bottom: 5, left: 5, top: 5),
        decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            boxShadow: const [
              BoxShadow(
                  blurRadius: 0,
                  offset: Offset(5, 5),
                  color: Color(0x3300FF00))
            ]),
        child: Row(
          children: [
            source.isNotEmpty
            ? Image.asset('assets/icons/${source == "github" ? "github_square.png" : source == 'play' ? "google_play.png" : ""}', height: 25)
            : const SizedBox.shrink(),
            const SizedBox(width: 5),
            Text.rich(
              TextSpan(
                children: <TextSpan>[
                  TextSpan(
                    style: const TextStyle(
                        color: Colors.blueAccent,
                        fontSize: 16,
                        decoration: TextDecoration.underline),
                    text: source.isNotEmpty
                        ? 'See on ${source == 'github' ? "GitHub" : source == 'play' ? "Play" : ""}'
                        : '',
                    recognizer: TapGestureRecognizer()
                      ..onTap = () async {
                        switch (source) {
                          case 'github':
                            if (projectModel.projecGitHubUrl != null) {
                              if (await canLaunch(
                                  projectModel.projecGitHubUrl!)) {
                                await launch(projectModel.projecGitHubUrl!);
                              }
                            }
                            break;
                          case 'paly':
                            if (projectModel.projecPlayUrl != null) {
                              if (await canLaunch(
                                  projectModel.projecPlayUrl!)) {
                                await launch(projectModel.projecPlayUrl!);
                              }
                            }
                            break;
                        }
                      },
                  ),
                ],
              ),
            )
          ],
        ),
      );
    }
    return SizeConfig.isDesktop()
    ? Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        (projectModel.projecGitHubUrl != null)
            ? _buildLinkContainer(source: 'github')
            : const SizedBox.shrink(),
        const SizedBox(height: 10),
        (projectModel.projecPlayUrl != null)
            ? _buildLinkContainer(source: 'play')
            : const SizedBox.shrink(),
      ],
    )
    : Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          (projectModel.projecGitHubUrl != null)
              ? _buildLinkContainer(source: 'github')
              : const SizedBox.shrink(),
          // const SizedBox(width: 5),
          Spacer(),
          (projectModel.projecPlayUrl != null)
              ? _buildLinkContainer(source: 'play')
              : const SizedBox.shrink(),
        ],
      ),
    );
  }

  Widget _buildProjectInfoSection(BuildContext context, {bool noBg = false}) {
    return Container(
      padding:
          EdgeInsets.only(left: 60.w, top: 20.h, bottom: 20.h, right: 60.w),
      decoration: BoxDecoration(
        color: !noBg ? Theme.of(context).primaryColor : null,
        boxShadow: !noBg
            ? const [
                BoxShadow(
                    blurRadius: 0,
                    spreadRadius: 0,
                    color: const Color(0x3300FF00),
                    offset: Offset(10, 10))
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
              height: 100,
            ),
          ),
          const SizedBox(height: 10),
          Txt(
            txt: projectModel.projectName,
            size: 50,
            // clr: kblack,
            fontFam: 'boldPoppins',
          ),
          const SizedBox(height: 2),
          GestureDetector(
              onTap: () {
                context.read<ProviderClass>().setSelectedProject = projectModel;
                Navigator.of(context).pushNamed('/more_info');
              },
              child: Shimmer.fromColors(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      Txt(
                        txt: 'Learn more',
                        clr: kwhite,
                        size: 18,
                      ),
                      SizedBox(width: 5),
                      Icon(Icons.arrow_forward_ios_rounded, color: kwhite)
                    ],
                  ),
                  baseColor: kwhite,
                  highlightColor: kwhite.withOpacity(0.3)))
        ],
      ),
    );
  }
}
