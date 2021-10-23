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

  @override
  void initState() {
    super.initState();
    _carouselController = CarouselController();
  }

  @override
  void dispose() {
    // _carouselController
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
    final List<SlidableMobilePhone> _myMobileProjects = _myProjects
        .map((Project pro) => SlidableMobilePhone(project: pro))
        .toList();
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
                  lowerText: "What do have I built?",
                  upperFontSize: 40.sp,
                  lowerFontSize: 35.sp,
                ),
              ],
            ),
          ),
          SizedBox(height: 30.h),
          Row(
            children: [
              Expanded(
                  child: Container(
                height: double.infinity,
                child: Txt(txt: _myProjects[_currentPageIndex].projectName),
                decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor.withOpacity(0.2)),
              )),
              Expanded(
                flex: 2,
                child: Row(
                  mainAxisSize: MainAxisSize.min
                  children: [
                    IconButton(onPressed: (){_carouselController.previousPage();}, icon: Icon(Icons.arrow_back_ios_rounded)),
                    CarouselSlider(
                      carouselController: _carouselController,
                      items: _myMobileProjects,
                      options: CarouselOptions(
                        height: 400.h,
                        viewportFraction: 0.5,
                        // enableInfiniteScroll: true,
                        // reverse: false,
                        // autoPlay: true,
                        // autoPlayInterval: Duration(seconds: 3),
                        // autoPlayAnimationDuration: Duration(milliseconds: 800),
                        // autoPlayCurve: Curves.fastOutSlowIn,
                        enlargeCenterPage: true,
                        onPageChanged: (index, reason) {
                          setState(() {
                            _currentPageIndex = index;
                          });
                        },
                        scrollDirection: Axis.horizontal,
                      ),
                    ),
                    IconButton(onPressed: (){_carouselController.nextPage();}, icon: Icon(Icons.arrow_forward_ios_rounded)),
                  ],
                ),
              ),
            ],
          )
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
    return Stack(
      children: [
        Image.asset('assets/images/lg.png'),
        // CarouselSlider(
        //     items: items,
        //     options: CarouselOptions(
        //       height: 400,
        //       aspectRatio: 16 / 9,
        //       viewportFraction: 0.8,
        //       initialPage: 0,
        //       enableInfiniteScroll: true,
        //       reverse: false,
        //       autoPlay: true,
        //       autoPlayInterval: Duration(seconds: 3),
        //       autoPlayAnimationDuration: Duration(milliseconds: 800),
        //       autoPlayCurve: Curves.fastOutSlowIn,
        //       enlargeCenterPage: true,
        //       onPageChanged: callbackFunction,
        //       scrollDirection: Axis.horizontal,
        //     ))
      ],
    );
  }
}
