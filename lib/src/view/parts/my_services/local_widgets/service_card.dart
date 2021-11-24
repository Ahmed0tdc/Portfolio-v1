import 'package:flutter/material.dart';
import 'package:portfolio/src/models/service.dart';
import 'package:portfolio/src/utils/constants/palette.dart';
import 'package:portfolio/src/utils/sizeconfig.dart';
import 'package:portfolio/src/view/global_widgets/custom_text.dart';

class ServiceCard extends StatefulWidget {
  final Service serviceModel;
  const ServiceCard({Key? key, required this.serviceModel}) : super(key: key);

  @override
  _ServiceCardState createState() => _ServiceCardState();
}

class _ServiceCardState extends State<ServiceCard> {
  bool _isCardHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) => setState.call(() => _isCardHovered = true),
      onExit: (event) => setState.call(() => _isCardHovered = false),
      child: GestureDetector(
        onLongPress: () => setState.call(() => _isCardHovered = true),
        onLongPressEnd: (l) => setState.call(() => _isCardHovered = false),
        child: _buildCard()
      ),
    );
  }

  Widget _buildCard(){
    const Duration _serviceCardAnimDur = Duration(milliseconds: 200);
    const double _height = 230;
    double _width = SizeConfig.isDesktop() ? 240 : MediaQuery.of(context).size.width * 0.7;
    return AnimatedContainer(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
      duration: _serviceCardAnimDur,
      decoration: BoxDecoration(
        color: _isCardHovered ? kwhite : Theme.of(context).primaryColor,
        boxShadow: [
          BoxShadow(
            blurRadius: 0,
            offset: const Offset( 8, 8),
            color: _isCardHovered ? const Color(0x99FFFFFF) : const Color(0x2200FF00)
          )
        ]
      ),
      width:  _width,
      height: _height,
      child: TweenAnimationBuilder(
        tween: Tween<double>(begin: _isCardHovered ? 1 : 1, end: _isCardHovered ? 1.05 : 1),
        duration: _serviceCardAnimDur,
        builder: (context, double val, _){
          return Transform.scale(
            scale: val,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  'assets/images/${widget.serviceModel.illustration}',
                  height: 60,
                  color: _isCardHovered ? Theme.of(context).primaryColor : kblack,
                ),
                const SizedBox(height: 10),
                Txt(txt: widget.serviceModel.name, fontFam: 'boldPoppins', size: 18, clr: _isCardHovered ? kblack : kwhite, isAnimted: true),
                const SizedBox(height: 4),
                Txt(txt: widget.serviceModel.description, size: 14, clr: _isCardHovered ? kblack : kwhite, isAnimted: true, fontFam: 'semiBoldPoppins'),
              ],
            ),
          );
        },
      )
    );
  }
}
