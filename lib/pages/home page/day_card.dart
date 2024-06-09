import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:sky_view/models/weather_forecast.dart';
import 'package:sky_view/utils/extensions.dart';

class DayCard extends StatelessWidget {
  final bool isSelected;
  final Forecastday day;
  final VoidCallback onPressed;
  const DayCard({super.key, required this.day, required this.onPressed, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    String date = DateFormat('E, d MMM').format(day.date);
    String displayDate = day.date.isToday
        ? 'Today'
        : day.date.isTomorrow
            ? 'Tomorrow'
            : date;

    return GestureDetector(
      onTap: onPressed,
      child: Container(
        margin: EdgeInsets.only(right: 8.w),
        padding: EdgeInsets.all(5.w),
        decoration: BoxDecoration(
          color: isSelected ? Colors.grey[200] : null,
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Text(
          displayDate,
          style: TextStyle(
            fontSize: 12.sp,
            fontWeight: FontWeight.w600,
            color: isSelected ? Colors.black : Colors.grey[300],
          ),
        ),
      ),
    );
  }
}
