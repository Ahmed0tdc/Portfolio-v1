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
  const HeroSection({Key? key}) : super(key: key);

  @override
  _HeroSectionState createState() => _HeroSectionState();
}

const List<String> tabsLabels = ['About me', 'My skills', 'My Work', 'Contact'];

class _HeroSectionState extends State<HeroSection> {
  int? _selectedTabIndex;
  @override
  Widget build(BuildContext context) {
    final _globProvider = Provider.of<ProviderClass>(context);
    return SliverAppBar(
      automaticallyImplyLeading: false,
      title: Text(
        kProjectTitle + '.',
        style: TextStyle(fontFamily: 'boldPoppins'),
      ),
      actions: (kIsWeb && SizeConfig.isDesktop() && !SizeConfig.isMobile())
          ? <Widget>[
              // WebNavigation()
              ...List.generate(4, (index) => _buildWebNavItem(index))
            ]
          : <Widget>[Icon(Icons.menu)],
      pinned: true,
      expandedHeight: SizeConfig.isDesktop()
          ? (MediaQuery.of(context).size.height -
              MediaQuery.of(context).viewPadding.top)
          : 480.h,
      flexibleSpace: FlexibleSpaceBar(
          background: Stack(
        fit: StackFit.expand,
        children: [
          _getBgDecoration(),
        ],
      )),
    );
  }

  List<bool> interactionStates = [false, false, false, false];
  Widget _buildWebNavItem(int index) {
    final _globProvider = Provider.of<ProviderClass>(context);
    final bool _isSelected =
        (_selectedTabIndex != null) ? index == _selectedTabIndex : false;
    return InkWell(
      // highlightColor: ktrans,
      focusColor: ktrans,
      // splashColor: ktrans,
      hoverColor: ktrans,
      splashFactory: NoSplash.splashFactory,
      onHover: (isHovered) {
        setState(() {
          if (isHovered)
            interactionStates[index] = true;
          else
            interactionStates[index] = false;
        });
      },
      onTap: () {
        setState(() {
          _selectedTabIndex = index;
        });
        _globProvider.getScrollController.animateTo((index + 1) * 500.h,
            duration: const Duration(milliseconds: 1000),
            curve: Curves.easeInOut);
      },
      child: Padding(
        padding: EdgeInsets.only(
            left: 40.w, right: (tabsLabels.length - 1 == index ? 60 : 40).w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedContainer(
              padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 10.w),
              child: Txt(
                txt: tabsLabels[index],
                fontFam: 'regPoppins',
                clr: interactionStates[index] && !_isSelected
                    ? kblack
                    : _isSelected
                        ? kwhite
                        : kwhite.withOpacity(0.8),
                size: 25.sp,
              ),
              duration: const Duration(milliseconds: 300),
              decoration: BoxDecoration(
                  color: interactionStates[index] && !_isSelected
                      ? kwhite.withOpacity(0.4)
                      : !_isSelected
                          ? ktrans
                          : _globProvider.getScrollController.offset >= 450.h
                              ? kblack.withOpacity(0.4)
                              : kgreen.withOpacity(0.4)),
            ),
          ],
        ),
      ),
    );
  }

  Widget _getBgDecoration() {
    return Stack(
      fit: StackFit.expand,
      children: [
        DecoratedBox(
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage('assets/images/hero_bg.jpg'),
            ),
          ),
        ),
        DecoratedBox(decoration:  BoxDecoration(
            gradient: LinearGradient(
                colors: const [kblack, Color(0x88000000)],
                begin: Alignment.centerRight,
                end: Alignment.centerLeft,
                stops: const [0.3, 1.0]),
          )),
         SizeConfig.isDesktopMQ(context)
              ? Align(
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
                      fit: BoxFit.fill,
                      height: 450.h,
                    ),
                  ),
                )
              : SizedBox.shrink(),
        Container(
          child: SafeArea(
              bottom: false,
              minimum: EdgeInsets.only(left: 60.w, top: 100.h, right: 60.w),
              child: Column(
                children: [
                  Expanded(
                    flex: 3,
                    child: Row(
                      children: [
                        Expanded(
                            flex: SizeConfig.isDesktop() ? 8 : 1,
                            child: HomeIntro()),
                        SizeConfig.isDesktop()
                            ? Spacer(flex: 3)
                            : SizedBox.shrink()
                      ],
                    ),
                  ),
                  const Spacer(),
                ],
              )),
         
        ),
      ],
    );
  }
}
