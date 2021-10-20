import 'package:flutter/material.dart';
import 'package:portfolio/src/utils/constants/palette.dart';
import 'package:portfolio/src/utils/sizeconfig.dart';

Widget getSpaceFiller(
      {bool wOnly = false, bool hOnly = false, Color? clr, double times = 1}) {
    final double outerHeight =
        (SizeConfig.screenHeight != null) ? SizeConfig.screenHeight! * 0.3 : 0;
    double height = outerHeight * 0.2;
    double width = outerHeight * 0.2;
    return Container(
      decoration: BoxDecoration(
        color: clr ?? ktrans,
      ),
      height: wOnly ? 0.0 : height * times,
      width: hOnly ? 0.0 : width * times,
    );
  }