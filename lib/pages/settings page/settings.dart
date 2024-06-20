import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sky_view/pages/settings%20page/default_location.dart';
import 'package:sky_view/pages/settings%20page/unit_settings.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 24.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const DefaultLocation(),
          SizedBox(height: 12.h),
          const UnitSettings(),
        ],
      ),
    );
  }
}
