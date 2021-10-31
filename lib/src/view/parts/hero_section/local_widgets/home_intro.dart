import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/src/utils/constants/palette.dart';
import 'package:portfolio/src/utils/reused_widgets.dart';
import 'package:portfolio/src/utils/sizeconfig.dart';
import 'package:portfolio/src/view/global_widgets/custom_text.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class HomeIntro extends StatelessWidget {
  const HomeIntro({Key? key}) : super(key: key);
  // double outerWidth =  (SizeConfig.screenWidth != null) ? SizeConfig.screenWidth! * 0.4 : 0;
  // double outerHeight =  (SizeConfig.screenHeight != null) ? SizeConfig.screenHeight! * 0.3 : 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
            bottom: false,
            minimum: EdgeInsets.only(top: 100.h, left: 60.w, right: 60.w),
            child: Column(
              children: [
                Expanded(
                    flex: SizeConfig.isDesktop() ? 3 : 6,
                    child: Row(
                            children: [
                              Expanded(
                                  flex: SizeConfig.isDesktop() ? 8 : 1,
                                  child: Stack(
      children: [
        Column(
          children: [
            Expanded(
              flex: 1,
              child: Stack(
                children: [
                  Row(
                    children: [
                      Expanded(
                        flex: 4,
                        child: Container(
                          alignment: Alignment.topLeft,
                          padding: EdgeInsets.only(left: 60.w, top: 10.w),
                          decoration: BoxDecoration(
                              color: Theme.of(context)
                                  .primaryColor
                                  .withOpacity(0.4)),
                        ),
                      ),
                      Expanded(flex: 2, child: getSpaceFiller(wOnly: true))
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 5.h, left: 60.w),//(kIsWeb && SizeConfig.isDesktop()) ? 60.w : 10.w),
                    child: Txt(
                      txt: 'Hi! my name is Ahmed',
                      // size: (kIsWeb && SizeConfig.isDesktop()) ? 80.sp : 24,
                      size: 80.sp
                    ),
                  ),
                ],
              ),
            ),
            Expanded(child: getSpaceFiller(hOnly: true, times: 1.5))
          ],
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: Column(
            children: [
              Expanded(
                child: Align(
                  alignment: Alignment.centerRight,
                  child: getSpaceFiller(clr: kwhite.withOpacity(0.3)),
                ),
              ),
              Expanded(
                flex: 2,
                child: Row(
                  children: [
                    getSpaceFiller(wOnly: true),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.only(left: 60.w, //(kIsWeb && SizeConfig.isDesktop()) ? 60.w : 10.w,
                         top: 10.w),
                        height: double.infinity,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Txt(
                                  txt: 'I\'m a ',
                                  // size: (kIsWeb && SizeConfig.isDesktop()) ? 60.sp : 20,
                                  size: 60.sp
                                ),
                                //!TODO: create your own, the widget below is weak
                                AnimatedTextKit(
                                  animatedTexts: ["Flutter Developer", "UI Designer", "YouTuber"].map((txt) => TypewriterAnimatedText(
                                    txt,
                                    textStyle: TextStyle(
                                      fontSize: 60.sp, //: 20,
                                    color: kblack),
                                    speed: const Duration(milliseconds: 200),
                                  ),).toList(),
                                  repeatForever: true,
                                  
                                  pause: const Duration(milliseconds: 800),
                                ),
                                // TextSpan(text: 'Developer'),
                                
                              ],
                            ),
                            Txt(txt: 'and I create software experiences.', size: 60.sp),//(kIsWeb && SizeConfig.isDesktop()) ?  60.sp : 20),
                          ],
                        ),
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    getSpaceFiller(wOnly: true)
                  ],
                ),
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: getSpaceFiller(clr: kwhite.withOpacity(0.3)),
                ),
              ),
            ],
          ),
        ),
      ],
    )
                                  
                                  
                                  
                                  
                                  )
                                  
                                  
                                  ,
                              SizeConfig.isDesktop()
                                  ? Spacer(flex: 3)
                                  : SizedBox.shrink()
                            ],
                          )
                        ),
                const Spacer(),
              ],
            ));
    
    
    
    
  }

  
}
