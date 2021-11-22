import 'package:flutter/material.dart';
import 'package:portfolio/src/utils/constants/palette.dart';
import 'package:portfolio/src/utils/sizeconfig.dart';

class Txt extends StatelessWidget {
  final String txt;
  final String? fontFam;
  final Color? clr;
  final int? maxLines;
  final double? size;
  final double? height;
  final bool isOverflow;
  final bool isBold;
  final bool withShadow;
  final bool underlined;
  final bool isAnimted;
  final FontWeight? boldness;
  final TextAlign? alignment;
  final Duration? animationDur;

  const Txt(
      {Key? key,
      required this.txt,
      this.clr,
      this.size,
      this.height,
      this.fontFam,
      this.maxLines,
      this.boldness,
      this.animationDur,
      this.isBold = false,
      this.isOverflow = false,
      this.underlined = false,
      this.isAnimted = false,
      this.withShadow = false,
      this.alignment})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return isAnimted 
      ? AnimatedDefaultTextStyle(
        duration: animationDur ?? const Duration(milliseconds: 200),
          style: TextStyle(
          color: clr,
          decoration: underlined ? TextDecoration.underline : null,
          fontSize: size ?? 18.sp,
          fontWeight: isBold ? FontWeight.bold : boldness,
          fontFamily: fontFam,
        ),
        child: Text(
          txt,
          maxLines: maxLines,
          overflow: isOverflow ? TextOverflow.ellipsis : null,
          textAlign: alignment,
        )
      )
    : Text(
        txt,
        maxLines: maxLines,
        style: TextStyle(
          shadows: withShadow ? [BoxShadow(offset: Offset(0, 0.1), color: kblack, blurRadius: 0.1 )] : null,
          height: height,
          color: clr,
          decoration: underlined ? TextDecoration.underline : null,
          fontSize: size ?? 18.sp,
          fontWeight: isBold ? FontWeight.bold : boldness,
          fontFamily: fontFam,
        ),
        overflow: isOverflow ? TextOverflow.ellipsis : null,
        textAlign: alignment,
    );
  }
}
