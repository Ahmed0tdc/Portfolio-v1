// ignore_for_file: prefer_const_constructors, curly_braces_in_flow_control_structures

import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/src/utils/constants/constansts.dart';
import 'package:portfolio/src/utils/constants/palette.dart';
import 'package:portfolio/src/utils/sizeconfig.dart';

class HeroSection extends StatefulWidget {
  final Widget? kiddo;
  const HeroSection(
      {Key? key,
      this.kiddo})
      : super(key: key);

  @override
  _HeroSectionState createState() => _HeroSectionState();
}

class _HeroSectionState extends State<HeroSection> {
  @override
  Widget build(BuildContext context) {
    // final _globProvider = Provider.of<ProviderClass>(context);
    // final double _desktopHeroSectionHeight =
    //     (MediaQuery.of(context).size.height -
    //         MediaQuery.of(context).viewPadding.top);
    // final double _mobileHeroSectionHeight = 400.h;
    return _getBgDecoration();
    // !widget.isScrolled
    //     ? _getBgDecoration()
    //     : CustomScrollView(
    //         slivers: [
    //           SliverAppBar(
    //             toolbarHeight: 0,
    //             automaticallyImplyLeading: false,
    //             pinned: true,
    //             expandedHeight: SizeConfig.isDesktop()
    //                 ? _desktopHeroSectionHeight
    //                 : _mobileHeroSectionHeight,
    //             flexibleSpace: FlexibleSpaceBar(
    //               background: Stack(
    //                 fit: StackFit.expand,
    //                 children: [_getBgDecoration()],
    //               ),
    //             ),
    //           ),
    //           SliverList(delegate: SliverChildListDelegate([widget.downKiddo!]))
    //         ],
    //       );
  }

  Widget _getBgDecoration() {
    return Stack(
      children: [
        SizeConfig.isDesktopMQ(context)
        ? SafeArea(
            bottom: false,
            minimum: EdgeInsets.only(top: 40),
            child: Align(
              alignment: Alignment.bottomRight,
              child: Container(
                foregroundDecoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    stops: const [0.0, 0.2, 1],
                    colors: const [kblack, kblack, ktrans],
                  ),
                ),
                child: Image.asset(
                  kMeWithGlasses,
                  fit: BoxFit.cover,
                  height: 650,
                ),
              ),
            ),
          )
        : const SizedBox.shrink(),
         widget.kiddo!,
      ],
    );
    
    // Stack(
    //   fit: StackFit.expand,
    //   children: [
    //     Container(
    //       foregroundDecoration: SizeConfig.isDesktop()
    //           ? BoxDecoration(
    //               gradient: LinearGradient(
    //                 begin: Alignment.centerRight,
    //                 end: Alignment.centerLeft,
    //                 stops: const [0.1, 1.0],
    //                 colors: [kblack, kblack.withOpacity(0.01)],
    //               ),
    //             )
    //           : null,
    //       decoration: BoxDecoration(
    //         image: DecorationImage(
    //           fit: BoxFit.cover,
    //           image: AssetImage('assets/images/hero_bg.jpg'),
    //         ),
    //       ),
    //     ),
    //     DecoratedBox(
    //       decoration: BoxDecoration(
    //         gradient: LinearGradient(
    //             colors: const [kblack, Color(0x88000000)],
    //             begin: Alignment.centerRight,
    //             end: Alignment.centerLeft,
    //             stops: const [0.3, 1.0]),
    //       ),
    //     ),
    //     BackdropFilter(
    //       filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
    //       child: SizeConfig.isDesktopMQ(context)
    //           ? SafeArea(
    //               bottom: false,
    //               minimum: EdgeInsets.only(top: 40),
    //               child: Align(
    //                 alignment: Alignment.bottomRight,
    //                 child: Container(
    //                   foregroundDecoration: BoxDecoration(
    //                     gradient: LinearGradient(
    //                       begin: Alignment.centerLeft,
    //                       end: Alignment.centerRight,
    //                       stops: const [0.0, 0.2, 1],
    //                       colors: const [kblack, kblack, ktrans],
    //                     ),
    //                   ),
    //                   child: Image.asset(
    //                     kMeWithGlasses,
    //                     fit: BoxFit.cover,
    //                     height: 650,
    //                   ),
    //                 ),
    //               ),
    //             )
    //           : const SizedBox.shrink(),
    //     ),
    //     widget.isScrolled ? widget.upKiddo! : widget.kiddo!,
    //   ],
    // );
  }
}
