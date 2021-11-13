import 'package:flutter/material.dart';
import 'package:portfolio/src/utils/sizeconfig.dart';
import 'package:portfolio/src/view/global_widgets/custom_text.dart';

class SectionHeader extends StatelessWidget {
  final String? upperText;
  final Widget? kid;
  final String? lowerText;
  final double? upperFontSize;
  final double? lowerFontSize;
  final Color? upperBgColor;
  final Color? lowerBgColor;
  final bool isOnePartOnly;
  final bool makeFlat;
  final double? bottomSpacing;

  const SectionHeader(
      {Key? key,
      this.isOnePartOnly = false,
      this.upperText,
      this.kid,
      this.lowerText,
      this.upperFontSize,
      this.lowerFontSize,
      this.upperBgColor,
      this.makeFlat = true,
      this.bottomSpacing,
      this.lowerBgColor})
      : super(key: key);

  const SectionHeader.onePartOnly({
    Key? key,
    this.isOnePartOnly = true,
    this.upperText,
    this.kid,
    this.lowerText,
    this.upperFontSize,
    this.lowerFontSize,
    this.makeFlat = true,
    this.upperBgColor,
    this.lowerBgColor,
    this.bottomSpacing,
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
            child: kid ?? Txt(
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
          left: SizeConfig.isDesktop() ? 40 : makeFlat ? 0 : 30,
          bottom: bottomSpacing ?? -19,
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
