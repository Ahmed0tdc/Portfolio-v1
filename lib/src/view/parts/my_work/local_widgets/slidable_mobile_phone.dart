import 'package:flutter/material.dart';
import 'package:portfolio/src/models/project.dart';
import 'package:portfolio/src/utils/constants/constansts.dart';
import 'package:portfolio/src/utils/constants/palette.dart';
import 'package:portfolio/src/utils/sizeconfig.dart';

class SlidableMobilePhone extends StatefulWidget {
  final Project project;
  const SlidableMobilePhone({Key? key, required this.project})
      : super(key: key);

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
    final List<Widget> _projectSlides = widget.project.projectImages
        .map((String img) => Container(
            padding: const EdgeInsets.only(left: 8, right: 5),
            child: Image.asset('assets/images/projects/' + img, fit: BoxFit.fitWidth)))
        .toList();
    return MouseRegion(
      onEnter: (event) => setState.call(() => _isHovered = true),
      onExit: (event) => setState.call(() => _isHovered = false),
      child: AnimatedContainer(
        duration: _animDur,
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        decoration: BoxDecoration(
            color: _isHovered ? Theme.of(context).primaryColor : ktrans,
            boxShadow: _isHovered
                ? [
                    BoxShadow(
                        blurRadius: 0,
                        spreadRadius: 0,
                        color: const Color(0x3300FF00),
                        offset: Offset(30.w, 30.w))
                  ]
                : null),
        child: TweenAnimationBuilder<double>(
            duration: _animDur,
            curve: Curves.easeInOut,
            tween: Tween<double>(begin: 1, end: !_isHovered ? 1 : 1.1),
            builder: (context, double val, _) {
              return Transform.scale(
                scale: val,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      height: 350,
                      width: 160,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Positioned.fill(child: Image.asset(kLGPhoneImg)),
                          Positioned.fill(
                            child: Container(
                              margin: const EdgeInsets.fromLTRB(8, 45, 5, 45),
                              color: kwhite, 
                              child: Center(child: CircularProgressIndicator(backgroundColor: kblack.withOpacity(0.1)),
                              ),
                            ),
                          ),
                          PageView(
                            key: const Key('slidable_mobile_phone'),
                            controller: _pageController,
                            scrollDirection: Axis.horizontal,
                            allowImplicitScrolling: true,
                            pageSnapping: false,
                            onPageChanged: (newIndex) {
                              setState(() {
                                _pageIndex = newIndex;
                              });
                            },
                            children: _projectSlides,
                          ),
                        ],
                      ),
                    ),
                     Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        MaterialButton(
                          elevation: _isHovered ? 5 : 0,
                          shape: CircleBorder(side: BorderSide(color: !_isHovered ? kwhite.withOpacity(0.6) : kwhite)),
                          hoverColor: Theme.of(context).primaryColor,
                          color: _isHovered ? Theme.of(context).primaryColor : kwhite,
                          onPressed: () {
                            if(_pageIndex > 0) _pageController.jumpToPage(_pageIndex - 1);
                          },
                          child: Icon(Icons.arrow_back_ios_sharp, color: !_isHovered ? kblack : kwhite, size: 15),
                        ),
                        MaterialButton(
                          elevation: _isHovered ? 5 : 0,
                          shape: CircleBorder(side: BorderSide(color: !_isHovered ? kwhite.withOpacity(0.6) : kwhite)),
                          hoverColor: Theme.of(context).primaryColor,
                          color: _isHovered ? Theme.of(context).primaryColor : kwhite,
                          onPressed: () {
                            if(_pageIndex < (_projectSlides.length-1)) _pageController.jumpToPage(_pageIndex + 1);
                          },
                          child: Icon(Icons.arrow_forward_ios_sharp, color: !_isHovered ? kblack : kwhite, size: 15),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              );
            }),
      ),
    );
  }
}
