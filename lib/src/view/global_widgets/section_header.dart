import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/src/utils/constants/palette.dart';
import 'package:portfolio/src/utils/reused_widgets.dart';
import 'package:portfolio/src/utils/sizeconfig.dart';
import 'package:portfolio/src/view/global_widgets/custom_text.dart';

class SectionHeader extends StatelessWidget {
  final String? upperText;
  final String? lowerText;
  final Color? upperBgColor;
  final Color? lowerBgColor;
  const SectionHeader(
      {Key? key,
      this.upperText,
      this.lowerText,
      this.upperBgColor,
      this.lowerBgColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey.withOpacity(0.5),
      height: 500.w,
      width: 400.h,
      child: Stack(
        children: [
          Column(
            children: [
              Expanded(
             
                child: Row(
                  children: [
                    Expanded(
                     flex: 2,
                      child:  Container(
                        alignment: Alignment.topLeft,
                        height: double.infinity,
                        child: Padding(
                          padding: EdgeInsets.only(left: 60.w, top: 5.w, right: 60.w, bottom: 5.h),
                          child: Txt(
                            txt: upperText ?? '',
                            size: 60.sp,
                          ),
                        ),
                        color: Theme.of(context).primaryColor.withOpacity(0.4),
                      ),
                    ),
                    const Spacer()
                  ],
                ),
              ),
              Spacer()
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Column(
              children: [
                const Spacer(),
                Expanded(
                  flex: 2,
                  child: Row(
                    children: [
                      const Spacer(),
                      Container(
                        alignment: Alignment.center,
                        height: double.infinity,
                        child: Padding(
                          padding: EdgeInsets.only(left: 60.w, top: 5.w, right: 60.w, bottom: 5.h),
                          child: Txt(
                            txt: lowerText ?? '',
                            size: 60.sp,
                          ),
                        ),
                        color: Theme.of(context).primaryColor,
                      ),
                    ],
                  ),
                ),
                const Spacer(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
