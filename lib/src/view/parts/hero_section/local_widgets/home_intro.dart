// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/src/models/service.dart';
import 'package:portfolio/src/state/provider_class.dart';
import 'package:portfolio/src/utils/constants/data.dart';
import 'package:portfolio/src/utils/constants/palette.dart';
import 'package:portfolio/src/utils/reused_widgets.dart';
import 'package:portfolio/src/utils/sizeconfig.dart';
import 'package:portfolio/src/view/global_widgets/custom_text.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:portfolio/src/view/global_widgets/section_header.dart';
import 'package:portfolio/src/view/parts/my_services/local_widgets/service_card.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

class HomeIntro extends StatelessWidget {
  const HomeIntro({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final SectionHeader _sectionHeader = SectionHeader(
      makeFlat: false,
      upperText: "MY SERVICES",
      lowerText: "What do I provide?",
      upperFontSize: 30,
      lowerFontSize: 24//SizeConfig.isDesktop() ? 24 : 26,
      // isCentered: SizeConfig.isDesktop() ? false : true,
    );
    return ListView(
      physics: const BouncingScrollPhysics(),
      controller: context.read<ProviderClass>().getScrollController,
      children: [
        SizedBox(height: SizeConfig.isDesktop() ? 150 : 40),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: _buildIntroHeader(context),
        ),
        SizedBox(height: SizeConfig.isDesktop() ? 180 : 80),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: _sectionHeader,
        ),
        const SizedBox(height: 50),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: buildServicesSection(context),
        ),
        const SizedBox(height: 60),
      ],
    );
  }

  Widget _buildIntroHeader(BuildContext context) {
    return SizeConfig.isDesktop()
        ? SizedBox(
            height: MediaQuery.of(context).size.height >= 410
                ? MediaQuery.of(context).size.height * 0.25
                : 120,
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
                            offset:
                                Offset(SizeConfig.isDesktop() ? -100 : 0, -80),
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
                            size:
                                (kIsWeb && SizeConfig.isDesktop()) ? 75.sp : 25,
                          ),
                        ),
                        Positioned(
                          left: 30,
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
                                      size: (kIsWeb && SizeConfig.isDesktop())
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
                        SizeConfig.isDesktop()
                            ? Positioned(
                                top: -(outerHeight * 0.2),
                                right: -(outerHeight * 0.2),
                                child: Shimmer.fromColors(
                                    child: getSpaceFiller(
                                        clr: kwhite.withOpacity(0.4)),
                                    baseColor: kwhite.withOpacity(0.4),
                                    highlightColor: kwhite))
                            : const SizedBox.shrink(),
                        SizeConfig.isDesktop()
                            ? Positioned(
                                bottom: -(outerHeight * 0.2),
                                left: -(outerHeight * 0.2),
                                child: Shimmer.fromColors(
                                    child: getSpaceFiller(
                                        clr: kwhite.withOpacity(0.4)),
                                    baseColor: kwhite.withOpacity(0.4),
                                    highlightColor: kwhite))
                            : const SizedBox.shrink(),
                      ],
                    ),
                  ),
                ),
                SizeConfig.isDesktop()
                    ? const Spacer(flex: 5)
                    : const SizedBox.shrink()
              ],
            ),
          )
        : Container(
            decoration: BoxDecoration(
              border: Border.all(color: Theme.of(context).primaryColor),
              color: kblack.withOpacity(0.4),
            ),
            child: Stack(
              children: [
                Positioned.fill(
                  right: 0,
                  bottom: 0,
                  child: Shimmer.fromColors(
                    period: const Duration(seconds: 2),
                    child: Container(
                    decoration: BoxDecoration(
                      boxShadow: const [
                        BoxShadow(
                            blurRadius: 0,
                            offset: Offset(10, 10),
                            color: Color(0x2200FF00))
                      ],
                      gradient: LinearGradient(
                        stops: [0.1, 0.90, 1.0],
                        colors: [kblack, Theme.of(context).primaryColor, kblack],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                      ),
                    ),
                    height: 1000,
                    width: MediaQuery.of(context).size.width * 0.4,
                  ), baseColor: ktrans, highlightColor: Theme.of(context).primaryColor.withOpacity(0.2)
                  )
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SectionHeader(
                        // makeFlat: false,
                        bottomSpacing: -30,
                        upperFontSize: 30,
                        lowerFontSize: 25,
                        upperText: 'Hello There!',
                        lowerText: 'My name is Ahmed',
                      ),
                      const SizedBox(height: 50),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Txt(txt: 'I\'m a ', size: 25),
                          //!TODO: create your own, the widget below is weak
                          Flexible(
                              child: _buildAnimatedText(clr: kwhite, size: 25)),
                        ],
                      ),
                      const SectionHeader.onePartOnly(
                        upperFontSize: 25,
                        upperText: 'and I create software\nexperiences',
                      )
                    ],
                  ),
                ),
              ],
            ),
          );
  }

  AnimatedTextKit _buildAnimatedText({Color? clr, double? size}) {
    Duration _textAnimDur({int times = 1}) =>
        Duration(milliseconds: 200 * times);
    final List<String> _titlesList = [
      "Developer",
      "Pythonista",
      "UI Designer",
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
                  fontSize:
                      size ?? ((kIsWeb && SizeConfig.isDesktop()) ? 60.sp : 30),
                  color: clr ?? kblack),
            ),
          )
          .toList(),
    );
  }

  Widget buildServicesSection(BuildContext context) {
    return SizeConfig.isDesktop()
        ? Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: myServices
            .map((Service service) => Padding(
                padding: EdgeInsets.symmetric(
                    horizontal:
                        (service.illustration == 'web.png' ? 60 : 0).w),
                child: ServiceCard(serviceModel: service)))
            .toList()
          )
        : Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: myServices
                  .map((Service service) => Padding(padding: EdgeInsets.symmetric(vertical: (service.illustration == 'web.png' ? 80 : 0).w),
                    child: ServiceCard(serviceModel: service))).toList())
            ],
          );
  }
}
