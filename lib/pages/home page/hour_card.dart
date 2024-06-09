import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:sky_view/models/weather_forecast.dart';
import 'package:sky_view/utils/extensions.dart';

class HourCard extends StatelessWidget {
  final Hour hour;
  const HourCard({super.key, required this.hour});

  @override
  Widget build(BuildContext context) {
    int isDay = hour.isDay;
    String text = hour.condition.text.trim().toCapitalized();
    String folderPath = isDay == 1 ? 'day' : 'night';
    DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(hour.timeEpoch * 1000);
    String time = DateFormat.j().format(dateTime);

    return Container(
      margin: EdgeInsets.only(right: 8.h),
      padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 22.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        color: const Color.fromARGB(255, 24, 24, 24),
      ),
      child: Column(
        children: [
          SizedBox(
            width: 26.w,
            height: 26.h,
            child: Image(
              image: AssetImage('assets/icons/weather/$folderPath/$text.png'),
            ),
          ),
          SizedBox(
            height: 6.h,
          ),
          Text(
            '${hour.tempC.round()}°',
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.w700,
              color: Colors.grey[200],
            ),
          ),
          SizedBox(
            height: 6.h,
          ),
          Text(
            time,
            style: TextStyle(
              fontSize: 10.sp,
              color: Colors.grey[400],
            ),
          ),
        ],
      ),
    );
  }
}
