import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WeatherCard extends StatelessWidget {
  const WeatherCard({super.key});

  @override
  Widget build(BuildContext context) {
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
            child: const Image(
              image: AssetImage('assets/images/cloudy.png'),
            ),
          ),
          SizedBox(
            height: 6.h,
          ),
          Text(
            '21°',
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
            '10 AM',
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
