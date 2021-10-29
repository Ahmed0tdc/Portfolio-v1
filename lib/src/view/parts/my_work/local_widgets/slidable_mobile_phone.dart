import 'package:flutter/material.dart';
import 'package:portfolio/src/models/project.dart';
import 'package:portfolio/src/utils/constants/constansts.dart';
import 'package:portfolio/src/utils/constants/palette.dart';
import 'package:portfolio/src/utils/sizeconfig.dart';

class SlidableMobilePhone extends StatefulWidget {
  final Project project;
  const SlidableMobilePhone({Key? key, required this.project}) : super(key: key);

  @override
  State<SlidableMobilePhone> createState() => _SlidableMobilePhoneState();
}

class _SlidableMobilePhoneState extends State<SlidableMobilePhone> {
  late PageController _pageController;
  bool _isHovered = false;
  int _pageIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      initialPage: _pageIndex,
      viewportFraction: 1,
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const Duration _animDur = Duration(milliseconds: 200);
    return MouseRegion(
      onEnter: (event) => setState.call(() => _isHovered = true),
      onExit: (event) => setState.call(() => _isHovered = false),
      child: AnimatedContainer(
        duration: _animDur,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
            // borderRadius: const BorderRadius.all(Radius.circular(20)),
            color: _isHovered ? Theme.of(context).primaryColor : ktrans,
            boxShadow: _isHovered
                ? [
                    BoxShadow(
                        blurRadius: 0,
                        spreadRadius: 0,
                        color: const Color(0x9900FF00),
                        offset: Offset(30.w, 30.w))
                  ]
                : null),
        child: TweenAnimationBuilder<double>(
            duration: _animDur,
            tween: Tween<double>(begin: 1, end: !_isHovered ? 1 : 1.1),
            builder: (context, double val, _) {
              return Transform.scale(
                scale: val,
                child: Container(
                    margin: EdgeInsets.only(top: 10.h, bottom: 10.h),
                    height: 350,
                    width: 160,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Positioned.fill(child: Image.asset(kLGPhoneImg)),
                        PageView(
                            key: const Key('slidable_mobile_phone'),
                            controller: _pageController,
                            scrollDirection: Axis.horizontal,
                            onPageChanged: (newIndex) {
                              _pageIndex = newIndex;
                            },
                            children: widget.project.projectImages
                                .map((String img) => _buildPhoneSlides(img))
                                .toList()),
                        Flexible(
                          child: Row(
                            children: [
                              IconButton(
                                hoverColor: kwhite.withOpacity(0.4),
                                onPressed: () {
                                  _pageController.previousPage(duration: Duration(milliseconds: 250), curve: Curves.easeInOut);
                                },
                                icon: const Icon(Icons.arrow_back_ios_sharp, color: kwhite),
                              ),
                              const Spacer(),
                              IconButton(
                                hoverColor: kwhite.withOpacity(0.4),
                                onPressed: () {
                                  _pageController.nextPage(duration: Duration(milliseconds: 250), curve: Curves.easeInOut);
                                },
                                icon: const Icon(Icons.arrow_forward_ios_sharp, color: kwhite)
                              ),
                            ],
                          ),
                        )
                      ],
                    )),
              );
            }),
      ),
    );
  }

  Widget _buildPhoneSlides(String img) {
    return Container(
        padding: const EdgeInsets.only(left: 9, right: 5),
        child: Image.asset('assets/images/projects/' + img));
  }
}
