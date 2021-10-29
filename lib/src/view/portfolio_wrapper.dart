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
import 'global_widgets/custom_app_bar.dart';
import 'global_widgets/custom_text.dart';

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
        address: "Tangier, Morocco",
        country: "Morocco",
        picture: kMeUnderSky,
        biography:
            "Passionate apps developer and a Pythonista with 2+ years of experience building and creating apps, Good at Coding; Quick at learning.\nadd more more more more more more more more stuff");
    final List<Widget> _sections = <Widget>[
      HomeIntro(),
      AboutMeSection(myPersona: _myPersona),
      SkillsSection(),
      WorksSection(),
      ContactSection()
    ];
    List<bool> scrolled = [false, false, false, false, false];
    final _globProvider = Provider.of<ProviderClass>(context);
    final isWidgetToBeScrolled = scrolled[_globProvider.getSelectedAppBarIndex];
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight),
          child: CustomAppBar(),
        ),
        body: HeroSection(
          isScrolled: isWidgetToBeScrolled,
          kiddo: isWidgetToBeScrolled
              ? null
              : Padding(
                  padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top + kToolbarHeight),
                  child: _sections[_globProvider.getSelectedAppBarIndex]),
          downKiddo: isWidgetToBeScrolled
              ? _sections[_globProvider.getSelectedAppBarIndex]
              : null,
          upKiddo: isWidgetToBeScrolled ? Text("HELLO THERE FOO") : null,
        ));
  }
}
