// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, curly_braces_in_flow_control_structures

import 'package:animate_do/animate_do.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/src/models/persona.dart';
import 'package:portfolio/src/state/provider_class.dart';
import 'package:portfolio/src/utils/constants/constansts.dart';
import 'package:portfolio/src/utils/constants/palette.dart';
import 'package:portfolio/src/utils/sizeconfig.dart';
import 'package:portfolio/src/view/parts/about_me/about_me.dart';
import 'package:portfolio/src/view/parts/contact/contact.dart';
import 'package:portfolio/src/view/parts/hero_section/hero_section.dart';
import 'package:portfolio/src/view/parts/hero_section/local_widgets/home_intro.dart';
import 'package:portfolio/src/view/parts/my_skills/my_skills.dart';
import 'package:portfolio/src/view/parts/my_work/my_work.dart';
import 'package:provider/provider.dart';
import 'dart:html' as html;
import 'global_widgets/custom_text.dart';

class HomeSection extends StatefulWidget {
  const HomeSection({Key? key}) : super(key: key);

  @override
  _ScrollBodyState createState() => _ScrollBodyState();
}

class _ScrollBodyState extends State<HomeSection> {
  bool _startLoading = false; //true;

  @override
  void initState() {
    super.initState();
    // context.read<ProviderClass>().listenToScrollChanges();
    if (_startLoading) {
      Future.delayed(const Duration(seconds: 1), () {
        setState.call(() => _startLoading = false);
      });
    }
  }

  @override
  void dispose() {
    // context.read<ProviderClass>().disposeOfScrollController();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Persona _myPersona = Persona(
        fullname: 'ahmed el otmani',
        age: 18,
        hobies: ["Reading", "Playing chess", "Jogging"],
        yearsOfExperience: 2,
        civilStatus: 'Single',
        adress: "Tangier, Morocco",
        country: "Morocco",
        picture: kMeUnderSky,
        biography:
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.");
    final List<Widget> _sections = <Widget>[
      HomeIntro(),
      AboutMeSection(myPersona: _myPersona),
      SkillsSection(),
      WorksSection(),
      ContactSection()
    ];
    List<bool> stacked = [true, true, true, false, true];
    final _globProvider = Provider.of<ProviderClass>(context);
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(kToolbarHeight),
            child: CustomAppBar()),
        body: 
          HeroSection(
            isStacked: stacked[_globProvider.getSelectedAppBarIndex],
            kiddo: _sections[_globProvider.getSelectedAppBarIndex]
          )
        );
  }
}

class CustomAppBar extends StatefulWidget {
  CustomAppBar({Key? key}) : super(key: key);

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    final List<String> tabsLabels = ['Home', 'About me', 'My skills', 'My Work', 'Contact'];
    return Container(
      height: 40,
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
      ),
      child: Row(
        children: [
          Txt(txt: kProjectTitle + '.', fontFam: 'boldPoppins', size: 30.sp),
          Spacer(),
          Row(
            mainAxisSize: MainAxisSize.min,
            children:
                (kIsWeb && SizeConfig.isDesktop() && !SizeConfig.isMobile())
                    ? List.generate(tabsLabels.length, (index) => _buildWebNavItem(index, tabsLabels))                      
                    : <Widget>[Icon(Icons.menu), SizedBox(width: 10.w)],
          )
        ],
      ),
    );
  }

  List<bool> interactionStates = [false, false, false, false, false];
  Widget _buildWebNavItem(int index, List<String> tabsLabels) {
    final _globProvider = Provider.of<ProviderClass>(context);
    final bool _isSelected = index == _globProvider.getSelectedAppBarIndex;
    return InkWell(
      highlightColor: ktrans,
      splashColor: ktrans,
      focusColor: ktrans,
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
        _globProvider.setSelectedAppBarIndex = index;
        // final List<String> routes = ['about', 'skills', 'work', 'contact'];
        // Navigator.pushNamed(context, '/${routes[index]}');
        // setState(() {
        //   _selectedTabIndex = index;
        // });
        // _globProvider.getScrollController.animateTo((index + 1) * 500.h,
        //     duration: const Duration(milliseconds: 1000),
        //     curve: Curves.easeInOut);
      },
      child: Padding(
        padding: EdgeInsets.only(left: 40.w, right: (tabsLabels.length == index ? 60 : 40).w),
        child: AnimatedContainer(
          padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 10.w),
          child: Txt(
            txt: tabsLabels[index],
            fontFam: 'regPoppins',
            clr: interactionStates[index] && !_isSelected
                ? kblack
                : _isSelected
                    ? kwhite
                    : kwhite.withOpacity(0.8),
            size: 13,
          ),
          duration: const Duration(milliseconds: 300),
          decoration: BoxDecoration(
              color: interactionStates[index] && !_isSelected
                  ? kwhite.withOpacity(0.4)
                  : !_isSelected
                      ? ktrans
                      : kblack.withOpacity(0.4)),
        ),
      ),
    );
  }
}

// class PortfolioSections extends StatefulWidget {
//   const PortfolioSections({Key? key}) : super(key: key);

//   @override
//   _PortfolioSectionsState createState() => _PortfolioSectionsState();
// }

// class _PortfolioSectionsState extends State<PortfolioSections> {
//   @override
//   void initState() {
//     super.initState();
//   }

//   @override
//   void dispose() {
//     context.read<ProviderClass>().disposeOfPageController();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final _globProvider = Provider.of<ProviderClass>(context);
//     final _portfolioSections = <Widget>[
//       // AboutMeSection(),
//       Text('hello'),
//       Text('hello'),
//       Text('hello'),
//     ];
//     return PageView(

//         // physics: NeverScrollableScrollPhysics(),
//         scrollDirection: Axis.vertical,
//         controller: _globProvider.getPageController,
//         children: _portfolioSections);
//   }
// }
