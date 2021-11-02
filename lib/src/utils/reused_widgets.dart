import 'package:flutter/material.dart';
import 'package:portfolio/src/utils/constants/palette.dart';
import 'package:portfolio/src/utils/sizeconfig.dart';

final double outerHeight = (SizeConfig.screenHeight != null) ? SizeConfig.screenHeight! * 0.3 : 0;
Widget getSpaceFiller({bool wOnly = false, bool hOnly = false, Color? clr, double times = 1}) {
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

// Widget getOverlapedContainer({required Widget kid, EdgeInsetsGeometry? paddin, Color? mainBgClr}) {
//   return Container(
//     color: Colors.grey.withOpacity(0.5),
//     child: Stack(
//       clipBehavior: Clip.none,
//       children: [
        
//         // Container(child: kid)
//         Container(
//           child: kid,
//           decoration: BoxDecoration( color: mainBgClr?.withOpacity(0.15) ?? kwhite.withOpacity(0.15)),
//         ),
//         // Positioned(
//         //   bottom: -10,
//         //   left: 10,
//         //   child: Container(
//         //     child: kid,
//         //     decoration: BoxDecoration(color: mainBgClr ?? kwhite),
//         //     padding: paddin ?? EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
//         //   ),
//         // ),
//       ],
//     ),
//   );
// }
