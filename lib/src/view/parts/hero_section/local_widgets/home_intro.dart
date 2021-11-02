// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/src/models/service.dart';
import 'package:portfolio/src/utils/constants/palette.dart';
import 'package:portfolio/src/utils/reused_widgets.dart';
import 'package:portfolio/src/utils/sizeconfig.dart';
import 'package:portfolio/src/view/global_widgets/custom_text.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:portfolio/src/view/global_widgets/section_header.dart';
import 'package:portfolio/src/view/parts/my_services/local_widgets/service_card.dart';
import 'package:portfolio/src/view/parts/my_skills/my_skills.dart';

class HomeIntro extends StatelessWidget {
  const HomeIntro({Key? key}) : super(key: key);
  // double outerWidth =  (SizeConfig.screenWidth != null) ? SizeConfig.screenWidth! * 0.4 : 0;
  // double outerHeight =  (SizeConfig.screenHeight != null) ? SizeConfig.screenHeight! * 0.3 : 0;

  @override
  Widget build(BuildContext context) {
    final SectionHeader _sectionHeader = SectionHeader(
      upperText: "MY SERVICES",
      lowerText: "What do I provide?",
      upperFontSize: 40.sp,
      lowerFontSize: 35.sp,
    );
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(left: 60.w, right: 60.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 150.h),
            SizedBox(
              height: 200,
              child: Row(
                children: [
                  const SizedBox(width: 100),
                  Expanded(
                    flex: SizeConfig.isDesktop() ? 5 : 1,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        boxShadow: const [BoxShadow(offset: Offset(-100, -80), blurRadius: 0, color: Color(0x55007802))],
                      ),
                      child: Stack(
                        fit: StackFit.expand,
                        clipBehavior: Clip.none,
                        children: [
                          Positioned(
                            top: -80,
                            left: -80,
                            child: Txt(
                              txt: 'Hi, my name is Ahmed!',
                              size: (kIsWeb && SizeConfig.isDesktop())
                                  ? 80.sp
                                  : 40,
                            ),
                          ),
                          Positioned(
                            // alignment: Alignment.topLeft,
                            child: Padding(
                              padding: EdgeInsets.only(right: 60.w, left: 60.w),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Txt(txt: 'I\'m a ', size: (kIsWeb && SizeConfig.isDesktop()) ? 60.sp : 30),
                                      //!TODO: create your own, the widget below is weak
                                      _buildAnimatedText(),
                                    ],
                                  ),
                                  Txt(
                                    txt: 'and I create software experiences.',
                                    // alignment: TextAlign.start,
                                    size: (kIsWeb && SizeConfig.isDesktop())
                                        ? 60.sp
                                        : 30
                                    ),
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                            top: -(outerHeight * 0.2),
                            right: -(outerHeight * 0.2),
                            child: getSpaceFiller(clr: kwhite.withOpacity(0.4)
                            ),
                          ),
                          Positioned(
                            bottom: -(outerHeight * 0.2),
                            left: -(outerHeight * 0.2),
                            child: getSpaceFiller(clr: kwhite.withOpacity(0.4)
                            ),
                          ),
                        ],
                      ),
                      // child:
                      // Stack(
                      //   clipBehavior: Clip.none,
                      //   children: [
                      //     Positioned(
                      //       top: -75,
                      //       child: Txt(
                      //         txt: 'Hi! my name is Ahmed',
                      //         size: (kIsWeb && SizeConfig.isDesktop()) ? 80.sp : 40,
                      //         // size: 80.sp
                      //       ),
                      //     ),
                      //     Padding(
                      //       padding: EdgeInsets.only(right: 60.w, left: 60.w, top: 10.h),
                      //       child: Row(
                      //         mainAxisAlignment: MainAxisAlignment.start,
                      //         mainAxisSize: MainAxisSize.min,
                      //         children: [
                      //           Txt(
                      //             txt: 'I\'m a ',
                      //             size: (kIsWeb && SizeConfig.isDesktop()) ? 60.sp : 30,
                      //             // size: 60.sp
                      //           ),
                      //           //!TODO: create your own, the widget below is weak
                      //           AnimatedTextKit(
                      //             animatedTexts: [
                      //               "Flutter Developer",
                      //               "Pythonista",
                      //               "UI Designer",
                      //               "YouTuber"
                      //             ]
                      //                 .map(
                      //                   (txt) => TypewriterAnimatedText(
                      //                     txt,
                      //                     textStyle: TextStyle(
                      //                         fontSize: (kIsWeb && SizeConfig.isDesktop())
                      //                             ? 60.sp
                      //                             : 30,
                      //                         color: kblack),
                      //                     speed: const Duration(milliseconds: 200),
                      //                   ),
                      //                 )
                      //                 .toList(),
                      //             repeatForever: true,
                      //             pause: const Duration(milliseconds: 800),
                      //           ),
                      //         ],
                      //       ),
                      //     ),
                      //   ],
                      // ),
                    ),
                  ),
                  SizeConfig.isDesktop()
                      ? const Spacer(flex: 5)
                      : const SizedBox.shrink()
                ],
              ),
            ),
            SizedBox(height: (outerHeight * 0.2) +  50.h),
            _sectionHeader,
            SizedBox(height: 30.h),
            buildServicesSection(context),
            SizedBox(height: 100.h),
          ],
        ),
      ),
    );
  }

  AnimatedTextKit _buildAnimatedText() {
    Duration _textAnimDur({int times = 1}) => Duration(milliseconds: 200 * times);
    final List<String> _titlesList = ["Flutter Developer", "Pythonista", "UI Designer", "YouTuber"];
    return AnimatedTextKit(
      repeatForever: true,
      pause: _textAnimDur(times: 4),
      animatedTexts: _titlesList
          .map((String txt) => 
            TypewriterAnimatedText(
              txt,
              speed: _textAnimDur(),
              textStyle: TextStyle(
                fontSize: (kIsWeb && SizeConfig.isDesktop())
                  ? 60.sp
                  : 30,
                color: kblack
              ),
            ),
          )
          .toList(),
    );
  }

  Widget buildServicesSection(BuildContext context) {
    final List<Service> _myServices = <Service>[
      Service(
          name: 'Mobile Development',
          description:
              'Well honed experience of cross-platform mobile development.',
          illustration: 'mobile.png'),
      Service(
          name: 'Web Development',
          description: 'Responsive and interactive websites for your idea.',
          illustration: 'web.png'),
      Service(
          name: 'UI Design',
          description:
              'Professional designs of user interfaces for your mobile or web application.',
          illustration: 'design.png'),
    ];
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: _myServices
          .map((Service service) => Padding(
                padding: EdgeInsets.symmetric(horizontal: (service.illustration == 'web.png' ? 60 : 0).w),
                child: ServiceCard(serviceModel: service),
              ))
          .toList());
  }
}
