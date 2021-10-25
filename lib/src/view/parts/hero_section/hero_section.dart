// ignore_for_file: prefer_const_constructors, curly_braces_in_flow_control_structures

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/src/state/provider_class.dart';
import 'package:portfolio/src/utils/constants/constansts.dart';
import 'package:portfolio/src/utils/constants/palette.dart';
import 'package:portfolio/src/utils/sizeconfig.dart';
import 'package:portfolio/src/view/global_widgets/custom_text.dart';
import 'package:provider/provider.dart';

import 'local_widgets/home_intro.dart';
import 'local_widgets/web_nav.dart';

class HeroSection extends StatefulWidget {
  final Widget kiddo;
  final bool isStacked;
  const HeroSection({Key? key, required this.kiddo, this.isStacked = true})
      : super(key: key);

  @override
  _HeroSectionState createState() => _HeroSectionState();
}

class _HeroSectionState extends State<HeroSection> {
  @override
  Widget build(BuildContext context) {
    // final _globProvider = Provider.of<ProviderClass>(context);
    final double _desktopHeroSectionHeight =
        (MediaQuery.of(context).size.height -
            MediaQuery.of(context).viewPadding.top);
    final double _mobileHeroSectionHeight = 400.h;
    return widget.isStacked
        ? _getBgDecoration()
        : CustomScrollView(
            slivers: [
              SliverAppBar(
                toolbarHeight: 0,
                automaticallyImplyLeading: false,
                pinned: true,
                expandedHeight: SizeConfig.isDesktop()
                    ? (MediaQuery.of(context).size.height -
                        MediaQuery.of(context).viewPadding.top)
                    : 400.h,
                flexibleSpace: FlexibleSpaceBar(
                    background: Stack(
                  fit: StackFit.expand,
                  children: [
                    _getBgDecoration(),
                  ],
                )),
              ),
              SliverList(delegate: SliverChildListDelegate([
                widget.kiddo
              ]))
            ],
          );
  }

  Widget _getBgDecoration() {
    return Stack(
      fit: StackFit.expand,
      children: [
        Container(
          foregroundDecoration: SizeConfig.isDesktop()
              ? BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.centerRight,
                    end: Alignment.centerLeft,
                    stops: const [0.1, 1.0],
                    colors: const [kblack, ktrans],
                  ),
                )
              : null,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage('assets/images/hero_bg.jpg'),
            ),
          ),
        ),
        DecoratedBox(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: const [kblack, Color(0x88000000)],
                begin: Alignment.centerRight,
                end: Alignment.centerLeft,
                stops: const [0.3, 1.0]),
          ),
        ),
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
                        stops: const [0.0, 0.15, 1],
                        colors: const [kblack, kblack, ktrans],
                      ),
                    ),
                    child: Image.asset(
                      kMeWithGlasses,
                      fit: BoxFit.contain,
                      height: 450,
                    ),
                  ),
                ),
              )
            : const SizedBox.shrink(),
         widget.isStacked ?
         widget.kiddo : SizedBox()
      ],
    );
  }
}
