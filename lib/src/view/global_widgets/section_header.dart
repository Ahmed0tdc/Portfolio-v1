import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/src/utils/constants/palette.dart';
import 'package:portfolio/src/utils/reused_widgets.dart';
import 'package:portfolio/src/utils/sizeconfig.dart';
import 'package:portfolio/src/view/global_widgets/custom_text.dart';

class SectionHeader extends StatelessWidget {
  final String? upperText;
  final String? lowerText;
  final double? upperFontSize;
  final double? lowerFontSize;
  final Color? upperBgColor;
  final Color? lowerBgColor;
  final bool isOnePartOnly;

  const SectionHeader(
      {Key? key,
      this.isOnePartOnly = false,
      this.upperText,
      this.lowerText,
      this.upperFontSize,
      this.lowerFontSize,
      this.upperBgColor,
      this.lowerBgColor})
      : super(key: key);

  const SectionHeader.onePartOnly({
    Key? key,
    this.isOnePartOnly = true,
    this.upperText,
    this.lowerText,
    this.upperFontSize,
    this.lowerFontSize,
    this.upperBgColor,
    this.lowerBgColor,
  }): super(key: key);

  @override
  Widget build(BuildContext context) {
    return isOnePartOnly ?
    Row(
      children: [
        Container(
          alignment: Alignment.center,
          child: Padding(
            padding: EdgeInsets.only(left: 60.w, right: 60.w),
            child: Txt(
              txt: upperText ?? '',
              size: upperFontSize ?? 60.sp,
            ),
          ),
          color: upperBgColor ?? Theme.of(context).primaryColor,
        ),
        const Spacer()
      ],
    )
    : Stack(
      clipBehavior: Clip.none,
      children: [
         Container(
          padding: EdgeInsets.only(left: 60.w, top: 5.w, right: 60.w, bottom: 20.h),
          child: Txt(
            txt: upperText ?? '',
            size: upperFontSize ?? 60.sp,
          ),
          color: upperBgColor ?? Theme.of(context).primaryColor.withOpacity(0.4),
        ),
        Positioned(
          left: 40,
          // right: -20,
          bottom: -15,
          child: Container(
          padding: EdgeInsets.only(left: 60.w, top: 5.w, right: 60.w, bottom: 5.h),
          child: Txt(
            txt: lowerText ?? '',
            size: lowerFontSize ?? 60.sp,
          ),
          color: lowerBgColor ?? Theme.of(context).primaryColor,
        ),)
      ],
    );
    // Container(
    //   // color: Colors.grey.withOpacity(0.5),
    //   height: 500.w,
    //   width: 300.h,
    //   child: Stack(
    //     children: [
    //       Column(
    //         children: [
    //           Expanded(
    //             flex: 2,            
    //             child: Row(
    //               children: [
    //                 Container(
    //                   alignment: Alignment.topLeft,
    //                   height: double.infinity,
    //                   child: Padding(
    //                     padding: EdgeInsets.only(left: 60.w, top: 5.w, right: 60.w, bottom: 5.h),
    //                     child: 
                        
    //                     // AnimatedTextKit(
    //                     //   animatedTexts: [
    //                     //     ColorizeAnimatedText(
    //                     //       'Larry Page',
    //                     //       textStyle: TextStyle(fontSize: 60.sp),
    //                     //       colors: [Colors.yellow, Colors.black],
    //                     //     ),
    //                     //   ],
    //                     //   pause: Duration.zero,
    //                     //   isRepeatingAnimation: true,
    //                     //   )
                        
    //                     Txt(
    //                       txt: upperText ?? '',
    //                       size: upperFontSize ?? 60.sp,
    //                     ),
    //                   ),
    //                   color: upperBgColor ?? Theme.of(context).primaryColor.withOpacity(0.4),
    //                 ),
    //                 const Spacer()
    //               ],
    //             ),
    //           ),
    //           const Spacer(flex: 2)
    //         ],
    //       ),
    //       Align(
    //         alignment: Alignment.bottomCenter,
    //         child: Column(
    //           children: [
    //             const Spacer(flex: 2,),
    //             Expanded(
    //               flex: 3,
    //               child: Container(
    //                 // color: Colors.red,
    //                 child: Row(
    //                   children: [
    //                     const Spacer(),
    //                     Container(
    //                       alignment: Alignment.center,
    //                       height: double.infinity,
    //                       child: Padding(
    //                         padding: EdgeInsets.only(left: 60.w,   right: 60.w,  ),
    //                         child: Txt(
    //                           txt: lowerText ?? '',
    //                           size: lowerFontSize ?? 60.sp,
    //                         ),
    //                       ),
    //                       color: lowerBgColor ?? Theme.of(context).primaryColor,
    //                     ),
    //                     const Spacer(flex: 3),
    //                   ],
    //                 ),
    //               ),
    //             ),
    //             const Spacer(flex: 2),
    //           ],
    //         ),
    //       ),
    //     ],
    //   ),
    // );
  }
}
