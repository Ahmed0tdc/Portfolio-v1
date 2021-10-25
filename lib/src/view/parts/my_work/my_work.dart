import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/src/models/project.dart';
import 'package:portfolio/src/utils/constants/enums.dart';
import 'package:portfolio/src/utils/constants/palette.dart';
import 'package:portfolio/src/utils/sizeconfig.dart';
import 'package:portfolio/src/view/global_widgets/custom_text.dart';
import 'package:portfolio/src/view/global_widgets/section_header.dart';

class WorksSection extends StatefulWidget {
  const WorksSection({Key? key}) : super(key: key);

  @override
  State<WorksSection> createState() => _WorksSectionState();
}

class _WorksSectionState extends State<WorksSection> {
  int _currentPageIndex = 0;
  late CarouselController _carouselController;
  // late PageController _carouselController;
  @override
  void initState() {
    super.initState();
    _carouselController = CarouselController();
    // _carouselController = PageController(
    //   viewportFraction: 0.4,
    //   initialPage: 0,
    //   keepPage: false
    // );
  }

  @override
  void dispose() {
    // _carouselController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _myProjects = [
      Project(
          projectType: ProjectType.mobileApp,
          projectName: 'Anas Cars',
          projectImages: [
            '/spark/spark_01.png',
            '/spark/spark_02.png',
            '/spark/spark_03.png',
            '/spark/spark_04.png',
            '/spark/spark_05.png'
          ],
          projectDescription: 'Cars app, I guess.',
          projectIconImage: ''),
      Project(
          projectType: ProjectType.mobileApp,
          projectName: 'GooLoads',
          projectImages: [
            '/spark/spark_01.png',
            '/spark/spark_02.png',
            '/spark/spark_03.png',
            '/spark/spark_04.png',
            '/spark/spark_05.png'
          ],
          projectDescription: 'Cars app, I guess.',
          projectIconImage: ''),
      Project(
          projectType: ProjectType.mobileApp,
          projectName: 'TOGYMDO',
          projectImages: [
            '/spark/spark_01.png',
            '/spark/spark_02.png',
            '/spark/spark_03.png',
            '/spark/spark_04.png',
            '/spark/spark_05.png'
          ],
          projectDescription: 'Cars app, I guess.',
          projectIconImage: ''),
    ];
    final List<SlidableMobilePhone> _myMobileProjects = _myProjects.map((Project pro) => SlidableMobilePhone(project: pro)).toList();
    return Container(
      decoration: const BoxDecoration(color: kwhite),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 60.w, top: 20.h),
            child: Row(
              children: [
                SectionHeader(
                  upperText: "MY WORK",
                  lowerText: "What have I built?",
                  upperFontSize: 40.sp,
                  lowerFontSize: 35.sp,
                ),
              ],
            ),
          ),
          SizedBox(height: 30.h),
                Row(
                  children: [
                    ElevatedButton(onPressed: (){}, child: Icon(Icons.arrow_back_ios_rounded)),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor.withOpacity(0.4),
                          border: Border.all(color: Theme.of(context).primaryColor)
                          // boxShadow: [BoxShadow(
                          //   blurRadius: 0,
                          //   spreadRadius: 0,
                          //   color: const Color(0xAA00FF00),
                          //   offset: Offset(30.w, 30.w)
                          // )],
                          ),
                        // width: 500,
                        height: 400.h,
                        child: CarouselSlider.builder(
                                itemCount: _myMobileProjects.length,
                                carouselController: _carouselController,
                                itemBuilder: (context, index, realIndex){
                                  final _isMobileShown = realIndex == _currentPageIndex;
                                  print("isMobileShown: $_isMobileShown");
                                  return _myMobileProjects[index];
                                  // Transform.scale(
                                  //   scale: _isMobileShown ? 4 : 1,  
                                  //   child: _myMobileProjects[index]);
                                },
                                options: CarouselOptions(
                                  // height: 400.h,
                                  initialPage: _currentPageIndex,
                                  viewportFraction: 1,
                                  enableInfiniteScroll: false,
                                  enlargeStrategy: CenterPageEnlargeStrategy.scale,
                                  enlargeCenterPage: true,
                                  disableCenter: true,
                                  scrollDirection: Axis.horizontal,
                                  onPageChanged: (index, reason) {
                                    setState.call(() => _currentPageIndex = index);
                                  }),
                              ),
                      ),
                    ),
                    ElevatedButton(onPressed: (){}, child: Icon(Icons.arrow_forward_ios_rounded)),
                  ],
                ),
       SizedBox(height: 60.h),
        ],
      ),
    );
  }
}

class SlidableMobilePhone extends StatelessWidget {
  final Project project;
  const SlidableMobilePhone({Key? key, required this.project})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset('assets/images/phone.png');
  }
}
