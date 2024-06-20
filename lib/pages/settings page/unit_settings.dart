import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:sky_view/providers/general_settings_provider.dart';

class UnitSettings extends StatelessWidget {
  const UnitSettings({super.key});

  @override
  Widget build(BuildContext context) {
    GeneralSettings generalSettings = Provider.of<GeneralSettings>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Units',
          style: TextStyle(
            color: Colors.grey[100],
            fontSize: 22.sp,
          ),
        ),
        SizedBox(
          height: 8.h,
        ),
        Card(
          color: Colors.grey[900],
          child: Padding(
            padding: EdgeInsets.all(16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Tempreature',
                  style: TextStyle(color: Colors.grey[300], fontSize: 16.sp),
                ),
                SizedBox(
                  height: 8.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ToggleButtons(
                      isSelected: [generalSettings.isCelsius, !generalSettings.isCelsius],
                      fillColor: Colors.white,
                      color: Colors.white,
                      selectedColor: Colors.black,
                      borderColor: Colors.grey[700],
                      selectedBorderColor: Colors.grey[700],
                      borderWidth: 2.w,
                      borderRadius: BorderRadius.circular(12.r),
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 6.w),
                          child: Text(
                            'Celsius',
                            style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w600),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 6.w),
                          child: Text(
                            'Fahrenheit',
                            style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w600),
                          ),
                        ),
                      ],
                      onPressed: (index) {
                        if (index == 0 && !generalSettings.isCelsius) {
                          generalSettings.changeTempUnit();
                        }
                        if (index == 1 && generalSettings.isCelsius) {
                          generalSettings.changeTempUnit();
                        }
                      },
                    ),
                  ],
                ),
                SizedBox(
                  height: 12.h,
                ),
                Text(
                  'Wind Speed',
                  style: TextStyle(color: Colors.grey[300], fontSize: 16.sp),
                ),
                SizedBox(
                  height: 8.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ToggleButtons(
                      isSelected: [generalSettings.isKmph, !generalSettings.isKmph],
                      fillColor: Colors.white,
                      color: Colors.white,
                      selectedColor: Colors.black,
                      borderColor: Colors.grey[700],
                      selectedBorderColor: Colors.grey[700],
                      borderWidth: 2.w,
                      borderRadius: BorderRadius.circular(12.r),
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 6.w),
                          child: Text(
                            'Km/h',
                            style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 6.w),
                          child: Text(
                            'M/h',
                            style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w600),
                          ),
                        ),
                      ],
                      onPressed: (index) {
                        if (index == 0 && !generalSettings.isKmph) {
                          generalSettings.changeWindUnit();
                        }
                        if (index == 1 && generalSettings.isKmph) {
                          generalSettings.changeWindUnit();
                        }
                      },
                    ),
                  ],
                ),
                SizedBox(
                  height: 12.h,
                ),
                Text(
                  'Pressure',
                  style: TextStyle(color: Colors.grey[300], fontSize: 16.sp),
                ),
                SizedBox(
                  height: 8.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ToggleButtons(
                      isSelected: [generalSettings.isMilli, !generalSettings.isMilli],
                      fillColor: Colors.white,
                      color: Colors.white,
                      selectedColor: Colors.black,
                      borderColor: Colors.grey[700],
                      selectedBorderColor: Colors.grey[700],
                      borderWidth: 2.w,
                      borderRadius: BorderRadius.circular(12.r),
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 6.w),
                          child: Text(
                            'Millibars',
                            style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w600),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 6.w),
                          child: Text(
                            'Inches',
                            style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w600),
                          ),
                        ),
                      ],
                      onPressed: (index) {
                        if (index == 0 && !generalSettings.isMilli) {
                          generalSettings.changePreUnit();
                        }
                        if (index == 1 && generalSettings.isMilli) {
                          generalSettings.changePreUnit();
                        }
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
