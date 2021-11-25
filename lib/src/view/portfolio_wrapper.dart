// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, curly_braces_in_flow_control_structures

import 'package:animate_do/animate_do.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/src/state/provider_class.dart';
import 'package:portfolio/src/utils/constants/data.dart';
import 'package:portfolio/src/utils/sizeconfig.dart';
import 'package:portfolio/src/view/global_widgets/custom_text.dart';
import 'package:portfolio/src/view/global_widgets/mobile_nav_menu.dart';
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
  bool _startLoading = true;

  @override
  void initState() {
    super.initState();
    if (_startLoading) {
      Future.delayed(const Duration(seconds: 2), () {
        setState.call(() => _startLoading = false);
      });
    }
    context.read<ProviderClass>().listenToScrollChanges();
  }

  @override
  void dispose() {
    context.read<ProviderClass>().disposeOfScrollController();
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
    return Stack(
      children: [
        Scaffold(
          extendBodyBehindAppBar: true,
          drawer: !SizeConfig.isDesktop() ? MobileNavMenu() : null,
          appBar: PreferredSize(
              preferredSize: Size.fromHeight(kToolbarHeight),
              child: CustomAppBar()),
          body: HeroSection(
            kiddo: Padding(
              padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top + kToolbarHeight),
              child: _sections[_globProvider.getSelectedAppBarIndex]),
          ),
        ),
        _startLoading
          ? Positioned.fill(child: _getLoadingLayer(context))
          : const SizedBox.shrink()
      ],
    );
  }

  Widget _getLoadingLayer(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Container(
        alignment: Alignment.center,
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(color: Theme.of(context).primaryColor),
        child: FadeIn(
          child: const Txt(
              txt: 'Welcome.', fontFam: 'boldPoppins', size: 50),
        ),
      ),
    ));
  }
}