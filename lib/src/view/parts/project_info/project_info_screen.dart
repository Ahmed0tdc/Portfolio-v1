import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:portfolio/src/models/project.dart';
import 'package:portfolio/src/utils/constants/palette.dart';
import 'package:portfolio/src/utils/sizeconfig.dart';
import 'package:portfolio/src/view/global_widgets/custom_text.dart';

class ProjectInfo extends StatelessWidget {
  const ProjectInfo({Key? key}) : super(key: key);
// final Project projectModel;
//   const ProjectInfo({Key? key, required this.projectModel}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> recievedData =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final Project _projectModel = (recievedData['projectModel'] as Project);
    return Builder(
      builder: (context) {
        return Container(
          decoration: BoxDecoration(color: kblack),
          child: Row(
            children: [
              Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                    Image.asset(
                        'assets/images/projects/${_projectModel.projectIconImage}', height: 100,),
                    SizedBox(height: 30.h),
                    Txt(
                        txt: _projectModel.projectName,
                        size: 30.sp,
                        fontFam: 'boldPoppins',
                        isBold: true,
                        isOverflow: true
                    ),
                    SizedBox(height: 50.h),
                    Txt(
                        txt: _projectModel.projectDescription,
                        size: 20.sp,
                        fontFam: 'semiBoldPoppins',
                        isOverflow: true
                    )
                ],
              ),
                  )),
              Expanded(
                  child: StaggeredGridView.countBuilder(
                crossAxisCount: 2,
                itemCount: _projectModel.projectImages.length,
                itemBuilder: (BuildContext context, int index) => Image.asset('assets/images/projects/${_projectModel.projectImages[index]}'),
                staggeredTileBuilder: (int index) => const StaggeredTile.fit(1),
                mainAxisSpacing: 10.w,
                crossAxisSpacing: 10.w,
              ))
            ],
          ),
        );
      }
    );
  }
}
