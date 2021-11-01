import 'package:flutter/material.dart';
import 'package:portfolio/src/models/service.dart';
import 'package:portfolio/src/utils/sizeconfig.dart';
import 'package:portfolio/src/view/global_widgets/custom_text.dart';

class ServiceCard extends StatefulWidget {
  final Service serviceModel;
  const ServiceCard({Key? key, required this.serviceModel}) : super(key: key);

  @override
  _ServiceCardState createState() => _ServiceCardState();
}

class _ServiceCardState extends State<ServiceCard> {
  @override
  Widget build(BuildContext context) {
    const Duration _serviceCardAnimDur = Duration(milliseconds: 500);
    return Container(
      padding: EdgeInsets.only(left: 30.w, right: 30.w, top: 10.h, bottom: 10.h),
      // duration: _serviceCardAnimDur,
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        boxShadow: [
          BoxShadow(
            offset: Offset(30.w, 30.w),
            blurRadius: 0,
            color: const Color(0x9900FF00)
          )
        ]
      ),
      width: 160.h,
      height: 150.h,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            'assets/images/${widget.serviceModel.illustration}',
            height: 60.h,
          ),
          Txt(txt: widget.serviceModel.name, fontFam: 'boldPoppins', size: 20.sp),
          Txt(txt: widget.serviceModel.description),
        ],
      ),
    );
  }
}
