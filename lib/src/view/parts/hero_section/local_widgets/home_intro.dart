// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/src/models/service.dart';
import 'package:portfolio/src/utils/constants/data.dart';
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

  @override
  Widget build(BuildContext context) {
    const SectionHeader _sectionHeader = SectionHeader(
        upperText: "MY SERVICES",
        lowerText: "What do I provide?",
        upperFontSize: 30,
        lowerFontSize: 24);
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(left: 30, right: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 150),
            SizedBox(
              height: 200,
              child: Row(
                children: [
                  SizedBox(width: SizeConfig.isDesktop() ? 100 : 0),
                  Expanded(
                    flex: SizeConfig.isDesktop() ? 5 : 1,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        boxShadow: [
                          BoxShadow(
                              offset: Offset(SizeConfig.isDesktop() ? -100 : 0, -80),
                              blurRadius: 0,
                              color: const Color(0x55007802))
                        ],
                      ),
                      child: Stack(
                        fit: StackFit.expand,
                        clipBehavior: Clip.none,
                        children: [
                          Positioned(
                            top: SizeConfig.isDesktop() ? -80 : -70,
                            left: SizeConfig.isDesktop() ? -80 : 30,
                            child: Txt(
                              txt: 'Hi, my name is Ahmed!',
                              size: (kIsWeb && SizeConfig.isDesktop())
                                  ? 80.sp
                                  : 25,
                            ),
                          ),
                          Positioned(
                            child: Padding(
                              padding: const EdgeInsets.only(right: 30, left: 30),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Txt(
                                          txt: 'I\'m a ',
                                          size:
                                              (kIsWeb && SizeConfig.isDesktop())
                                                  ? 60.sp
                                                  : 30),
                                      //!TODO: create your own, the widget below is weak
                                      Flexible(child: _buildAnimatedText()),
                                    ],
                                  ),
                                  Txt(
                                      txt: 'and I create software experiences.',
                                      // alignment: TextAlign.start,
                                      size: (kIsWeb && SizeConfig.isDesktop())
                                          ? 60.sp
                                          : 30),
                                ],
                              ),
                            ),
                          ),
                          SizeConfig.isDesktop() ? Positioned(
                            top: -(outerHeight * 0.2),
                            right: -(outerHeight * 0.2),
                            child: getSpaceFiller(clr: kwhite.withOpacity(0.4)),
                          ) : const SizedBox.shrink(),
                          SizeConfig.isDesktop() ? Positioned(
                            bottom: -(outerHeight * 0.2),
                            left: -(outerHeight * 0.2),
                            child: getSpaceFiller(clr: kwhite.withOpacity(0.4)),
                          ) : const SizedBox.shrink(),
                        ],
                      ),
                    ),
                  ),
                  SizeConfig.isDesktop()
                      ? const Spacer(flex: 5)
                      : const SizedBox.shrink()
                ],
              ),
            ),
            SizedBox(height: (outerHeight * 0.2) + 80),
            _sectionHeader,
            const SizedBox(height: 50),
            buildServicesSection(context),
            const SizedBox(height: 60),
          ],
        ),
      ),
    );
  }

  AnimatedTextKit _buildAnimatedText() {
    Duration _textAnimDur({int times = 1}) =>
        Duration(milliseconds: 200 * times);
    final List<String> _titlesList = [
      "Developer",
      "Pythonista",
      "UI Designer",
      "YouTuber"
    ];
    return AnimatedTextKit(
      repeatForever: true,
      pause: _textAnimDur(times: 4),
      animatedTexts: _titlesList
          .map(
            (String txt) => TypewriterAnimatedText(
              txt,
              speed: _textAnimDur(),
              textStyle: TextStyle(
                overflow: TextOverflow.ellipsis,
                  fontSize: (kIsWeb && SizeConfig.isDesktop()) ? 60.sp : 30,
                  color: kblack),
            ),
          )
          .toList(),
    );
  }

  Widget buildServicesSection(BuildContext context) {
    return SizeConfig.isDesktop()
        ? Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: myServices
                .map(
                  (Service service) => Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal:
                            (service.illustration == 'web.png' ? 60 : 0).w),
                    child: ServiceCard(serviceModel: service),
                  ),
                )
                .toList())
        : Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: myServices
                    .map(
                      (Service service) => Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: (service.illustration == 'web.png' ? 60 : 0)),
                        child: ServiceCard(serviceModel: service),
                      ),
                    )
                    .toList()),
          ],
        );
  }
}
