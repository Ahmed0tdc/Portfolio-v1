import 'package:flutter/material.dart';
import 'package:portfolio/src/utils/constants/palette.dart';
import 'package:portfolio/src/utils/sizeconfig.dart';
import 'package:portfolio/src/view/global_widgets/custom_text.dart';
import 'package:animate_do/animate_do.dart' as animatedo;
class LocationMapButton extends StatefulWidget {
  const LocationMapButton({
    Key? key,
  }) : super(key: key);

  @override
  State<LocationMapButton> createState() => _LocationMapButtonState();
}

class _LocationMapButtonState extends State<LocationMapButton> {
  bool _isButtonHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) {
        setState(
          () {
            _isButtonHovered = true;
          },
        );
      },
      onExit: (event) {
        setState(
          () {
            _isButtonHovered = false;
          },
        );
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        height: 55,//!_isButtonHovered ? 60 : 100,
        width: 200,//!_isButtonHovered ? 200 : 250,
        decoration: BoxDecoration(
          boxShadow: [BoxShadow(
            blurRadius: 0,
            spreadRadius: 0,
            color:  _isButtonHovered ? const Color(0x99FFFFFF) : const Color(0x9900FF00),
            offset: Offset(15, 15)
          )],
        color: Theme.of(context).primaryColor,
        ),
        child: !_isButtonHovered
            ? Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(width: 10.w),
                  Icon(
                    Icons.location_pin,
                    color: kwhite,
                  ),
                  SizedBox(width: 30.w),
                  Txt(clr: kwhite, size: 16, txt: 'Find me'),
                  SizedBox(width: 30.w),
                ],
              )
            : animatedo.FadeIn(
              duration: const Duration(milliseconds: 200),
              child: Container(
                  width: 55,
                  height: 200,
                  decoration: BoxDecoration(
                    border: Border.all(color: Theme.of(context).primaryColor),
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage('assets/images/map.jpg')
                        ),
                  ),
                ),
            ),
      ),
    );
  }
}
