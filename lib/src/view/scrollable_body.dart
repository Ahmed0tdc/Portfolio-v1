// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:portfolio/src/state/provider_class.dart';
import 'package:portfolio/src/utils/sizeconfig.dart';
import 'package:portfolio/src/view/parts/about_me/about_me.dart';
import 'package:portfolio/src/view/parts/hero_section/hero_section.dart';
import 'package:provider/provider.dart';

class ScrollBody extends StatefulWidget {
  const ScrollBody({Key? key}) : super(key: key);

  @override
  _ScrollBodyState createState() => _ScrollBodyState();
}

class _ScrollBodyState extends State<ScrollBody> {

  @override
  void initState() {
    context.read<ProviderClass>().listenToScrollChanges();
    super.initState();
  }

  @override
  void dispose() {
    context.read<ProviderClass>().disposeOfScrollController();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _globProvider = Provider.of<ProviderClass>(context);
    return Scaffold(
      body: CustomScrollView(
        shrinkWrap: true,
        controller: _globProvider.getScrollController,
        slivers: [
          const HeroSection(),
          SliverList(
            delegate: SliverChildListDelegate(
               [
                 AboutMeSection()
                // Column(
                //   mainAxisSize: MainAxisSize.min,
                //   children: [
                //     SizedBox(
                //       height: 5000.h,
                //       child: PortfolioSections()),
                //     Text("Footer at the end")
                //   ],
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


class PortfolioSections extends StatefulWidget {
  const PortfolioSections({ Key? key }) : super(key: key);

  @override
  _PortfolioSectionsState createState() => _PortfolioSectionsState();
}

class _PortfolioSectionsState extends State<PortfolioSections> {

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    context.read<ProviderClass>().disposeOfPageController();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _globProvider = Provider.of<ProviderClass>(context);
    final _portfolioSections = <Widget>[
      // AboutMeSection(),
      Text('hello'),
      Text('hello'),
      Text('hello'),
    ];
    return PageView(
      
      // physics: NeverScrollableScrollPhysics(),
      scrollDirection: Axis.vertical,
      controller: _globProvider.getPageController,
      children: _portfolioSections
    );
  }
}