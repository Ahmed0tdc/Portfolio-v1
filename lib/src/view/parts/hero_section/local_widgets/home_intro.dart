// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/src/models/service.dart';
import 'package:portfolio/src/utils/constants/palette.dart';
import 'package:portfolio/src/utils/reused_widgets.dart';
import 'package:portfolio/src/utils/sizeconfig.dart';
import 'package:portfolio/src/view/global_widgets/custom_text.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:portfolio/src/view/parts/my_services/local_widgets/service_card.dart';
import 'package:portfolio/src/view/parts/my_skills/my_skills.dart';

class HomeIntro extends StatelessWidget {
  const HomeIntro({Key? key}) : super(key: key);
  // double outerWidth =  (SizeConfig.screenWidth != null) ? SizeConfig.screenWidth! * 0.4 : 0;
  // double outerHeight =  (SizeConfig.screenHeight != null) ? SizeConfig.screenHeight! * 0.3 : 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Spacer(),
        Expanded(
          child: Row(
            children: [
              Container(height: 20, width: (70+60).w, color: Colors.red),
              Expanded(
                flex: SizeConfig.isDesktop() ? 6 : 1,
                child: Container(
                  // margin: EdgeInsets.only(left: .w ),
                  // width: 50,
                  // height: 10,
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    //TODO play around with the offset values
                    boxShadow: [BoxShadow(offset: Offset(-70.w, -100.h), blurRadius: 0, color: Color(0x9900FF00))],
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
              SizeConfig.isDesktop() ? const Spacer(flex: 4) : const SizedBox.shrink()
            ],
          ),
        ),
        Spacer(),
      ],
    );

    // SafeArea(
    //   bottom: false,
    //   minimum: EdgeInsets.only(top: 70.h, left: 60.w, right: 60.w),
    //   child: Column(
    //     children: [
    //       Column(
    //         crossAxisAlignment: CrossAxisAlignment.start,
    //         children: [
    //           Expanded(
    //               flex: SizeConfig.isDesktop() ? 3 : 6,
    //               child: Row(
    //                 children: [
    //                   Expanded(
    //                       flex: SizeConfig.isDesktop() ? 8 : 1,
    //                       child: Stack(
    //                         clipBehavior: Clip.none,
    //                         children: [
    //                           Column(
    //                             children: [
    //                               Expanded(
    //                                 flex: 1,
    //                                 child: Stack(
    //                                   children: [
    //                                     Row(
    //                                       children: [
    //                                         Expanded(
    //                                           flex: 4,
    //                                           child: Container(
    //                                             alignment: Alignment.topLeft,
    //                                             padding: EdgeInsets.only(
    //                                                 left: 60.w, top: 10.w),
    //                                             decoration: BoxDecoration(
    //                                                 color: Theme.of(context)
    //                                                     .primaryColor
    //                                                     .withOpacity(0.4)),
    //                                           ),
    //                                         ),
    //                                         Expanded(
    //                                             flex: 2,
    //                                             child: getSpaceFiller(wOnly: true))
    //                                       ],
    //                                     ),
    //                                     Padding(
    //                                       padding: EdgeInsets.only(
    //                                           top: 5.h,
    //                                           left: 60
    //                                               .w), //(kIsWeb && SizeConfig.isDesktop()) ? 60.w : 10.w),
    //                                       child: Txt(
    //                                         txt: 'Hi! my name is Ahmed',
    //                                         size: (kIsWeb && SizeConfig.isDesktop())
    //                                             ? 80.sp
    //                                             : 40,
    //                                         // size: 80.sp
    //                                       ),
    //                                     ),
    //                                   ],
    //                                 ),
    //                               ),
    //                               Expanded(
    //                                   child:
    //                                       getSpaceFiller(hOnly: true, times: 1.5))
    //                             ],
    //                           ),
    //                           Align(
    //                             alignment: Alignment.bottomRight,
    //                             child: Column(
    //                               children: [
    //                                 Expanded(
    //                                   child: Align(
    //                                     alignment: Alignment.centerRight,
    //                                     child: getSpaceFiller(
    //                                         clr: kwhite.withOpacity(0.3)),
    //                                   ),
    //                                 ),
    //                                 Expanded(
    //                                   flex: 2,
    //                                   child: Row(
    //                                     children: [
    //                                       getSpaceFiller(wOnly: true),
    //                                       Expanded(
    //                                         flex: 2,
    //                                         child: Container(
    //                                           padding: EdgeInsets.only(
    //                                               left: 60.w, top: 10.w),
    //                                           height: double.infinity,
    //                                           child: Column(
    //                                             crossAxisAlignment:
    //                                                 CrossAxisAlignment.start,
    //                                             children: [
    //                                               Row(
    //                                                 crossAxisAlignment:
    //                                                     CrossAxisAlignment.start,
    //                                                 children: [
    //                                                   Txt(
    //                                                     txt: 'I\'m a ',
    //                                                     size: (kIsWeb &&
    //                                                             SizeConfig
    //                                                                 .isDesktop())
    //                                                         ? 60.sp
    //                                                         : 30,
    //                                                     // size: 60.sp
    //                                                   ),
    //                                                   //!TODO: create your own, the widget below is weak
    //                                                   AnimatedTextKit(
    //                                                     animatedTexts: [
    //                                                       "Flutter Developer",
    //                                                       "Pythonista",
    //                                                       "UI Designer",
    //                                                       "YouTuber"
    //                                                     ]
    //                                                         .map(
    //                                                           (txt) =>
    //                                                               TypewriterAnimatedText(
    //                                                             txt,
    //                                                             textStyle: TextStyle(
    //                                                                 fontSize: (kIsWeb &&
    //                                                                         SizeConfig
    //                                                                             .isDesktop())
    //                                                                     ? 60.sp
    //                                                                     : 30,
    //                                                                 color: kblack),
    //                                                             speed:
    //                                                                 const Duration(
    //                                                                     milliseconds:
    //                                                                         200),
    //                                                           ),
    //                                                         )
    //                                                         .toList(),
    //                                                     repeatForever: true,
    //                                                     pause: const Duration(
    //                                                         milliseconds: 800),
    //                                                   ),
    //                                                 ],
    //                                               ),
    //                                               Txt(
    //                                                   txt:
    //                                                       'and I create software experiences.',
    //                                                   alignment: TextAlign.start,
    //                                                   size: (kIsWeb &&
    //                                                           SizeConfig
    //                                                               .isDesktop())
    //                                                       ? 60.sp
    //                                                       : 30),
    //                                               // _buildServicesSection(context)
    //                                             ],
    //                                           ),
    //                                           color: Theme.of(context)
    //                                               .primaryColor
    //                                               .withOpacity(
    //                                                   SizeConfig.isDesktop()
    //                                                       ? 0.8
    //                                                       : 1),
    //                                         ),
    //                                       ),
    //                                       getSpaceFiller(wOnly: true)
    //                                     ],
    //                                   ),
    //                                 ),
    //                                 Expanded(
    //                                   child: Align(
    //                                     alignment: Alignment.centerLeft,
    //                                     child: getSpaceFiller(
    //                                         clr: kwhite.withOpacity(0.3)),
    //                                   ),
    //                                 ),
    //                               ],
    //                             ),
    //                           ),

    //                         ],
    //                       )),
    //                   SizeConfig.isDesktop()
    //                       ? const Spacer(flex: 3)
    //                       : const SizedBox.shrink()
    //                 ],
    //               )),
    //           const Spacer(),
    //         ],
    //       ),
    //     ],
    //   ),
    // );
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
    return Container(
      // padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
      // decoration: BoxDecoration(color: Theme.of(context).primaryColor),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Txt(
            txt: 'My Services',
            size: 40.sp,
          ),
          SizedBox(height: 5.h),
          Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: _myServices
                  .map((Service service) => Padding(
                        padding: EdgeInsets.symmetric(horizontal: 0.h),
                        child: ServiceCard(serviceModel: service),
                      ))
                  .toList())
        ],
      ),
    );
  }
}
