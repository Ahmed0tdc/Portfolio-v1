import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/src/utils/constants/palette.dart';
import 'package:portfolio/src/utils/sizeconfig.dart';

class WebNavigation extends StatefulWidget {
  const WebNavigation({Key? key}) : super(key: key);

  @override
  _WebNavigationState createState() => _WebNavigationState();
}

class _WebNavigationState extends State<WebNavigation> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
          mainAxisSize: MainAxisSize.min,  
          children: List.generate(4, (index) => _buildNavItem(index))),
          Container(
            color: Colors.red,
            child: Stack(
              fit: StackFit.expand,
              children: [
                Container(
                  height: 10.h, width: 100.w,
                  decoration: BoxDecoration(color: kgreen),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildNavItem(int index) {
    return RichText(
      text: TextSpan(
        recognizer: TapGestureRecognizer()..onTap = () => print(index),
        text: "Contacts",
        style: TextStyle()
      ),
    );
  }
}
