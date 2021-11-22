// ignore_for_file: prefer_const_constructors

import 'package:animate_do/animate_do.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:portfolio/src/models/project.dart';
import 'package:portfolio/src/state/provider_class.dart';
import 'package:portfolio/src/utils/constants/data.dart';
import 'package:portfolio/src/utils/constants/palette.dart';
import 'package:portfolio/src/utils/sizeconfig.dart';
import 'package:portfolio/src/view/global_widgets/custom_text.dart';
import 'package:provider/provider.dart';

class ProjectInfo extends StatelessWidget {
  const ProjectInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ProviderClass _globProvider = Provider.of<ProviderClass>(context);
    return Scaffold(
      body: DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: <Color>[
            for (Color clr in _globProvider.getSelectedProject!.brandColors ??
                <Color>[kblack, ktrans])
              clr.withOpacity(0.2)
          ], begin: Alignment.bottomLeft, end: Alignment.topCenter),
        ),
        child: SizeConfig.isDesktopMQ(context)
            ? Row(
                children: [
                  Expanded(child: _buildProjectInfoSection(context, _globProvider)),
                  Expanded(
                    child: ListView(
                    children: [
                      _getProjectGallery(context, _globProvider),
                      const SizedBox(height: 30),
                      const ProjectsNav(),
                      const SizedBox(height: 30),
                      _getMarketingText(context),
                    ],
                  ))
                ],
              )
            : SingleChildScrollView(
                child: Column(
                  children: [
                    _buildProjectInfoSection(context, _globProvider),
                    const SizedBox(height: 30),
                    _getProjectGallery(context, _globProvider, isMobile: true),
                    const SizedBox(height: 30),
                    const ProjectsNav(),
                    const SizedBox(height: 30),
                    _getMarketingText(context),
                    const SizedBox(height: 30),
                  ],
                ),
              ),
      ),
    );
  }

  Padding _getMarketingText(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Text.rich(
        TextSpan(
          style: TextStyle(fontSize: 20),
          children: <InlineSpan>[
            TextSpan(text: 'Have an interesting Flutter project idea? '),
            TextSpan(
              text: 'Let\'s talk.',
              style: TextStyle(color: Theme.of(context).primaryColor),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  context.read<ProviderClass>().setSelectedAppBarIndex = 4;
                  context.read<ProviderClass>().setPageScrollingState = false;                  
                  Navigator.pop(context);
                },
            ),
          ],
        ),
      ),
    );
  }

  Widget _getProjectGallery(BuildContext context, ProviderClass _globProvider, {bool isMobile = false}) {
    return 
    // GridView.builder(
    //   shrinkWrap: true,
    //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
    //   itemCount: _globProvider.getSelectedProject!.projectImages.length,
    //   itemBuilder: (BuildContext context, int index) => Image.asset('assets/images/projects/${_globProvider.getSelectedProject!.projectImages[index]}')
    // );
    StaggeredGridView.countBuilder(
      shrinkWrap: true,
      physics: isMobile ? const NeverScrollableScrollPhysics() : null,
      crossAxisCount: 2,
      itemCount: _globProvider.getSelectedProject!.projectImages.length,
      itemBuilder: (BuildContext context, int index) => FadeIn(child: Image.asset('assets/images/projects/${_globProvider.getSelectedProject!.projectImages[index]}')) ,
      staggeredTileBuilder: (int index) => const StaggeredTile.fit(1),
      mainAxisSpacing: 8,
      crossAxisSpacing: 8,
    );
  }

  Padding _buildProjectInfoSection(BuildContext context, ProviderClass _globProvider) {
    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 30),
      child: Column(
        children: [
          const SizedBox(height: 20),
          Row(
            children: [
              Text.rich(
                TextSpan(
                  style: TextStyle(color: Theme.of(context).primaryColor, fontSize: 19),
                  children: [
                    WidgetSpan(child: Padding(
                      padding:  EdgeInsets.only(right: 5),
                      child: Icon(
                        Icons.arrow_back_ios_new_rounded,
                          color: Theme.of(context).primaryColor,
                      ),
                    )
                  ),
                  TextSpan(text: "View all projects",  recognizer: TapGestureRecognizer()
                ..onTap = () {
                  Navigator.pop(context);
                },)
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 40),
          Hero(
            tag: 'tag-${_globProvider.getSelectedProject!.projectIconImage}+${_globProvider.getSelectedProject!.projectName}',
            child: Image.asset('assets/images/projects/${_globProvider.getSelectedProject!.projectIconImage}', height: 150),
          ),
          const SizedBox(width: 5),
          FadeInUp(
            duration: Duration(milliseconds: 300),
            child: Txt(
              txt: _globProvider.getSelectedProject!.projectName,
              size: 60,
              fontFam: 'boldPoppins',
              isBold: true,
              isOverflow: true
            ),
          ),
          const SizedBox(height: 30),
          SizeConfig.isDesktop()
          ?
          Flexible(
            child: FadeInUp(
              duration: Duration(milliseconds: 400),
              child: Txt(
                txt: _globProvider.getSelectedProject!.projectDescription.replaceAll('\n', ' '),
                size: 18,
                fontFam: 'semiBoldPoppins',
                // isOverflow: true
              ),
            ),
          )
          : FadeInUp(
            duration: Duration(milliseconds: 400),
            child: Txt(
              txt: _globProvider.getSelectedProject!.projectDescription.replaceAll('\n', ' '),
              size: 18,
              fontFam: 'semiBoldPoppins',
              // isOverflow: true
            ),
          )
        ],
      ),
    );
  }
}

class ProjectsNav extends StatelessWidget {
  const ProjectsNav({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _globProvider = Provider.of<ProviderClass>(context);
    Project currentProject = myProjects
        .where((element) =>
            element.projectName ==
            _globProvider.getSelectedProject!.projectName)
        .toList()
        .first;
    return Row(
      // mainAxisSize: MainAxisSize.min,
      children: [
        IgnorePointer(
          ignoring: myProjects.indexOf(currentProject) == 0,
          child: MaterialButton(
              splashColor: ktrans,
              highlightColor: ktrans,
              hoverColor: ktrans,
              padding: EdgeInsets.zero,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.arrow_back_ios_outlined,
                      size: 25,
                      color: myProjects.indexOf(currentProject) == 0
                          ? Colors.grey[600]
                          : Theme.of(context).primaryColor),
                  const SizedBox(width: 5),
                  Txt(
                      txt: 'Previous project',
                      isOverflow: true,
                      clr: myProjects.indexOf(currentProject) == 0
                          ? Colors.grey[600]
                          : Theme.of(context).primaryColor,
                      size: 19),
                  const SizedBox(width: 5)
                ],
              ),
              onPressed: () {
                int newIndex = myProjects.indexOf(currentProject) - 1;
                if (newIndex >= 0){
                  _globProvider.setSelectedProject = myProjects[newIndex];
                  Navigator.of(context).pushReplacementNamed('/more_info');
                  }
              }),
        ),
        const Spacer(),
        IgnorePointer(
          ignoring: myProjects.indexOf(currentProject) == myProjects.length - 1,
          child: MaterialButton(
              splashColor: ktrans,
              highlightColor: ktrans,
              hoverColor: ktrans,
              padding: EdgeInsets.zero,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(width: 5),
                  Txt(
                      txt: 'Next project',
                      isOverflow: true,
                      clr: myProjects.indexOf(currentProject) ==
                              myProjects.length - 1
                          ? Colors.grey[600]
                          : Theme.of(context).primaryColor,
                      size: 19),
                  const SizedBox(width: 5),
                  Icon(Icons.arrow_forward_ios_outlined,
                      size: 25,
                      color: myProjects.indexOf(currentProject) ==
                              myProjects.length - 1
                          ? Colors.grey[600]
                          : Theme.of(context).primaryColor),
                ],
              ),
              onPressed: () {
                int newIndex = myProjects.indexOf(currentProject) + 1;
                if (newIndex < myProjects.length){
                  _globProvider.setSelectedProject = myProjects[newIndex];
                  Navigator.of(context).pushReplacementNamed('/more_info');
                  
                  }
              }),
        ),
      ],
    );
  }
}
