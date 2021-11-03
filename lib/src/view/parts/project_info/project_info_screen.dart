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
        body: Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: <Color>[
          for (Color clr in _globProvider.getSelectedProject!.brandColors ??
              <Color>[kblack, ktrans])
            clr.withOpacity(0.2)
        ], begin: Alignment.bottomLeft, end: Alignment.topCenter),
      ),
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: 60.w, right: 60.w),
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10.h),
                  const ProjectsNav(),
                  SizedBox(height: 40.h),
                  Hero(
                    tag:
                        'tag-${_globProvider.getSelectedProject!.projectIconImage}+${_globProvider.getSelectedProject!.projectName}',
                    child: Image.asset(
                        'assets/images/projects/${_globProvider.getSelectedProject!.projectIconImage}',
                        height: 150),
                  ),
                  const SizedBox(width: 5),
                  Txt(
                      txt: _globProvider.getSelectedProject!.projectName,
                      size: 80.sp,
                      fontFam: 'boldPoppins',
                      isBold: true,
                      isOverflow: true),
                  SizedBox(height: 30.h),
                  Txt(
                    txt: _globProvider.getSelectedProject!.projectDescription
                        .replaceAll('\n', ' '),
                    size: 25.sp,
                    fontFam: 'semiBoldPoppins',
                    // isOverflow: true
                  )
                ],
              ),
            ),
          ),
          Expanded(
              child: StaggeredGridView.countBuilder(
            crossAxisCount: 2,
            itemCount: _globProvider.getSelectedProject!.projectImages.length,
            itemBuilder: (BuildContext context, int index) => Image.asset(
                'assets/images/projects/${_globProvider.getSelectedProject!.projectImages[index]}'),
            staggeredTileBuilder: (int index) => const StaggeredTile.fit(1),
            mainAxisSpacing: 10.w,
            crossAxisSpacing: 10.w,
          ))
        ],
      ),
    ));
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
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(Icons.arrow_back_ios_outlined,
                      size: 60.w,
                      color: myProjects.indexOf(currentProject) == 0
                          ? Colors.grey[600]
                          : Theme.of(context).primaryColor),
                  const SizedBox(width: 5),
                  Txt(
                      txt: 'View last project',
                      isOverflow: true,
                      clr: myProjects.indexOf(currentProject) == 0
                          ? Colors.grey[600]
                          : Theme.of(context).primaryColor,
                      size: 30.sp),
                  const SizedBox(width: 5)
                ],
              ),
              onPressed: () {
                int newIndex = myProjects.indexOf(currentProject) - 1;
                if (newIndex >= 0)
                  _globProvider.setSelectedProject = myProjects[newIndex];
              }),
        ),
        const Spacer(),
        IgnorePointer(
          ignoring: myProjects.indexOf(currentProject) == myProjects.length - 1,
          child: MaterialButton(
              splashColor: ktrans,
              highlightColor: ktrans,
              hoverColor: ktrans,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(width: 5),
                  Txt(
                      txt: 'View next project',
                      isOverflow: true,
                      clr: myProjects.indexOf(currentProject) ==
                              myProjects.length - 1
                          ? Colors.grey[600]
                          : Theme.of(context).primaryColor,
                      size: 30.sp),
                  const SizedBox(width: 5),
                  Icon(Icons.arrow_forward_ios_outlined,
                      size: 60.w,
                      color: myProjects.indexOf(currentProject) ==
                              myProjects.length - 1
                          ? Colors.grey[600]
                          : Theme.of(context).primaryColor),
                ],
              ),
              onPressed: () {
                int newIndex = myProjects.indexOf(currentProject) + 1;
                if (newIndex < myProjects.length)
                  _globProvider.setSelectedProject = myProjects[newIndex];
              }),
        ),
      ],
    );
  }
}
