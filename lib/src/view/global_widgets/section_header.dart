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
            padding: const EdgeInsets.only(left: 15, right: 15),
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
          padding: const EdgeInsets.only(left: 15, top: 5, right: 15, bottom: 25),
          child: Txt(
            txt: upperText ?? '',
            size: upperFontSize ?? 60.sp,
          ),
          color: upperBgColor ?? Theme.of(context).primaryColor.withOpacity(0.4),
        ),
        Positioned(
          left: SizeConfig.isDesktop() ? 40 : 0,
          bottom: -19,
          child: Container(
          padding: const EdgeInsets.only(left: 15, top: 5, right: 15, bottom: 5),
          child: Txt(
            txt: lowerText ?? '',
            size: lowerFontSize ?? 60.sp,
            alignment: TextAlign.start
          ),
          color: lowerBgColor ?? Theme.of(context).primaryColor,
        ),)
      ],
    );
  }
}
