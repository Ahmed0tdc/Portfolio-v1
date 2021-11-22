// ignore_for_file: curly_braces_in_flow_control_structures

import 'package:flutter/material.dart';
import 'package:portfolio/src/state/provider_class.dart';
import 'package:portfolio/src/utils/constants/palette.dart';
import 'package:portfolio/src/view/global_widgets/custom_text.dart';
import 'package:provider/provider.dart';

class MobileNavMenu extends StatefulWidget {
  const MobileNavMenu({
    Key? key,
  }) : super(key: key);

  @override
  State<MobileNavMenu> createState() => _MobileNavMenuState();
}

class _MobileNavMenuState extends State<MobileNavMenu> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: kblack),
      child: ListView(
        children: [
          const SizedBox(height: 60),
          ...List.generate(5, (index) => _buildMobileNavItem(index)),
          const SizedBox(height: 30),
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: const Icon(            
                Icons.clear,
                color: kwhite,
                size: 50,
              ),
          ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }

  final List<bool> _interactionStates = [false, false, false, false, false];
  Widget _buildMobileNavItem(int index) {
    final _globProvider = Provider.of<ProviderClass>(context);
    final List<String> tabsLabels = [
      'Home',
      'About me',
      'My skills',
      'My Work',
      'Contact'
    ];
    final bool _isSelected = index == _globProvider.getSelectedAppBarIndex;
    final bool _isHovered = _interactionStates[index];
    return InkWell(
      highlightColor: ktrans,
      splashColor: ktrans,
      focusColor: ktrans,
      hoverColor: ktrans,
      splashFactory: NoSplash.splashFactory,
      onHover: (isHovered) {
        setState(() {
          if (isHovered) _interactionStates[index] = true;
          else _interactionStates[index] = false;
        });
      },
      onTap: () async {
        _globProvider.setSelectedAppBarIndex = index;
        _globProvider.setPageScrollingState = false;
        await Future.delayed(const Duration(milliseconds: 250), () {
          Navigator.pop(context);
        });
      },
      child: Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: AnimatedContainer(
          // padding: EdgeInsets.symmetric(vertical: 10),
          child: Center(
            child: Txt(
              isAnimted: true,
              animationDur: const Duration(milliseconds: 250),
              txt: tabsLabels[index],
              fontFam: 'semiBoldPoppins',
              clr: _isHovered && !_isSelected
                  ? kwhite
                  : _isSelected
                      ? Theme.of(context).primaryColor
                      : kwhite.withOpacity(0.8),
              size: _isHovered && !_isSelected ? 30 : 25,
            ),
          ),
          duration: const Duration(milliseconds: 300),
          // decoration: BoxDecoration(color: !_isSelected ? ktrans : Theme.of(context).primaryColor.withOpacity(0.4)),
        ),
      ),
    );
  }
}
