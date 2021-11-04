// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, curly_braces_in_flow_control_structures

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/src/models/persona.dart';
import 'package:portfolio/src/state/provider_class.dart';
import 'package:portfolio/src/utils/constants/constansts.dart';
import 'package:portfolio/src/utils/constants/data.dart';
import 'package:portfolio/src/utils/constants/palette.dart';
import 'package:portfolio/src/utils/sizeconfig.dart';
import 'package:portfolio/src/view/global_widgets/custom_text.dart';
import 'package:portfolio/src/view/parts/about_me/about_me.dart';
import 'package:portfolio/src/view/parts/contact/contact.dart';
import 'package:portfolio/src/view/parts/hero_section/hero_section.dart';
import 'package:portfolio/src/view/parts/hero_section/local_widgets/home_intro.dart';
import 'package:portfolio/src/view/parts/my_skills/my_skills.dart';
import 'package:portfolio/src/view/parts/my_work/my_work.dart';
import 'package:provider/provider.dart';
import 'global_widgets/custom_app_bar.dart';

class PortfolioWrapper extends StatefulWidget {
  const PortfolioWrapper({Key? key}) : super(key: key);

  @override
  _ScrollBodyState createState() => _ScrollBodyState();
}

class _ScrollBodyState extends State<PortfolioWrapper> {
  bool _startLoading = false; //true;

  @override
  void initState() {
    super.initState();
    if (_startLoading) {
      Future.delayed(const Duration(seconds: 1), () {
        setState.call(() => _startLoading = false);
      });
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _globProvider = Provider.of<ProviderClass>(context);
    final List<Widget> _sections = <Widget>[
      HomeIntro(),
      AboutMeSection(myPersona: myPersona),
      SkillsSection(),
      WorksSection(),
      ContactSection()
    ];
    List<bool> scrolled = [false, false, false, false, false];
    final bool isWidgetToBeScrolled = scrolled[_globProvider.getSelectedAppBarIndex];
    return Scaffold(
      extendBodyBehindAppBar: true,
      drawer: !SizeConfig.isDesktop() ? MobileNavMenu() : null,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight),
          child: CustomAppBar()),
      body: HeroSection(
        isScrolled: isWidgetToBeScrolled,
        kiddo: !isWidgetToBeScrolled
            ? Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).padding.top + kToolbarHeight),
                child: _sections[_globProvider.getSelectedAppBarIndex])
            : null,
        downKiddo: isWidgetToBeScrolled
            ? _sections[_globProvider.getSelectedAppBarIndex]
            : null,
        upKiddo: isWidgetToBeScrolled ? Text("HELLO THERE FOO") : null,
      ),
    );
  }
}

class MobileNavMenu extends StatefulWidget {
  const MobileNavMenu({
    Key? key,
  }) : super(key: key);

  @override
  State<MobileNavMenu> createState() => _MobileNavMenuState();
}

class _MobileNavMenuState extends State<MobileNavMenu> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // height: double.infinity,
      // width: double.infinity,
      decoration: BoxDecoration(color: kblack),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 60),
            ...List.generate(5, (index) => _buildMobileNavItem(index)),
            SizedBox(height: 30),
            GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Icon(            
                  Icons.clear,
                  color: kwhite,
                  size: 50,
                ),
            ),
          ],
        ),
      ),
    );
  }

  final List<bool> _interactionStates = [false, false, false, false, false];
  Widget _buildMobileNavItem(int index) {
    final _globProvider = Provider.of<ProviderClass>(context);
    final List<String> tabsLabels = [
      'Home',
      'About me',
      'My skills',
      'My Work',
      'Contact'
    ];
    final bool _isSelected = index == _globProvider.getSelectedAppBarIndex;
    final bool _isHovered = _interactionStates[index];
    return InkWell(
      highlightColor: ktrans,
      splashColor: ktrans,
      focusColor: ktrans,
      hoverColor: ktrans,
      splashFactory: NoSplash.splashFactory,
      onHover: (isHovered) {
        setState(() {
          if (isHovered)
            _interactionStates[index] = true;
          else
            _interactionStates[index] = false;
        });
      },
      onTap: () async {
        _globProvider.setSelectedAppBarIndex = index;
        await Future.delayed(Duration(milliseconds: 250), () {
          Navigator.pop(context);
        });
      },
      child: Padding(
        padding: EdgeInsets.only(bottom: 20),
        child: AnimatedContainer(
          // padding: EdgeInsets.symmetric(vertical: 10),
          child: Center(
            child: Txt(
              isAnimted: true,
              animationDur: const Duration(milliseconds: 250),
              txt: tabsLabels[index],
              fontFam: 'semiBoldPoppins',
              clr: _isHovered && !_isSelected
                  ? kwhite
                  : _isSelected
                      ? Theme.of(context).primaryColor
                      : kwhite.withOpacity(0.8),
              size: _isHovered && !_isSelected ? 30 : 25,
            ),
          ),
          duration: const Duration(milliseconds: 300),
          // decoration: BoxDecoration(color: !_isSelected ? ktrans : Theme.of(context).primaryColor.withOpacity(0.4)),
        ),
      ),
    );
  }
}
