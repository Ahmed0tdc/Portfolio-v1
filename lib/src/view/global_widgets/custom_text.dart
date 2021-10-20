import 'package:flutter/material.dart';
import 'package:portfolio/src/utils/sizeconfig.dart';

class Txt extends StatelessWidget {
  final String txt;
  final String? fontFam;
  final Color? clr;
  final int? maxLines;
  final double? size;
  final bool isOverflow;
  final bool isBold;
  final FontWeight? boldness;
  final TextAlign? alignment;

  const Txt(
      {Key? key,
      required this.txt,
      this.clr,
      this.size,
      this.fontFam,
      this.maxLines,
      this.boldness,
      this.isBold = false,
      this.isOverflow = false,
      this.alignment})
      : super(key: key);

  Widget build(BuildContext context) {
    return Text(
      txt,
      maxLines: maxLines,
      style: TextStyle(
        color: clr,
        fontSize: size ?? 18.sp,
        fontWeight: isBold ? FontWeight.bold : boldness,
        fontFamily: fontFam,
      ),
      overflow: isOverflow ? TextOverflow.ellipsis : null,
      textAlign: alignment,
    );
  }
}
