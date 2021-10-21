// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:portfolio/src/models/persona.dart';
import 'package:portfolio/src/state/provider_class.dart';
import 'package:portfolio/src/utils/constants/constansts.dart';
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
    final Persona _myPersona = Persona(
        fullname: 'ahmed el otmani',
        age: 18,
        adress: "Tangier, Morocco",
        country: "Morocco",
        picture: kMeUnderSky,
        biography:
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.");
    return Scaffold(
      body: CustomScrollView(
        shrinkWrap: true,
        controller: _globProvider.getScrollController,
        slivers: [
          const HeroSection(),
          SliverList(
            delegate: SliverChildListDelegate(<Widget>[
              SizeConfig.isDesktop()
                  ? Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        AboutMeSection(myPersona: _myPersona),
                        // AboutMeSection(myPersona: _myPersona),
                        // AboutMeSection(myPersona: _myPersona),
                        // AboutMeSection(myPersona: _myPersona),
                        Container(
                            alignment: Alignment.center,
                            height: 100,
                            color: Colors.green,
                            child: Text("Footer at the end"))
                      ],
                    )
                  : SizedBox.shrink()
            ]),
          ),
        ],
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
