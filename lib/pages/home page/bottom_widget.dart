import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:sky_view/models/weather_forecast.dart';
import 'package:sky_view/pages/home%20page/day_card.dart';
import 'package:sky_view/pages/home%20page/hour_card.dart';
import 'package:sky_view/providers/weather_forecast_provider.dart';
import 'package:sky_view/utils/shimmer_widget.dart';

class BottomWidget extends StatefulWidget {
  const BottomWidget({super.key});

  @override
  State<BottomWidget> createState() => _BottomWidgetState();
}

class _BottomWidgetState extends State<BottomWidget> {
  int _selectedDay = 0;

  @override
  Widget build(BuildContext context) {
    final WeatherForecastProvider weatherForecastProvider = Provider.of<WeatherForecastProvider>(context);
    List<Forecastday>? days = weatherForecastProvider.weatherForecast?.forecast.forecastday;

    return Container(
      padding: EdgeInsets.all(16.0.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 32.h,
            child: weatherForecastProvider.isLoading
                ? ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.only(right: 8.0.w),
                        child: ShimmerWidget.rectangular(height: 21.h, width: 70.w),
                      );
                    },
                  )
                : ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: days!.length,
                    itemBuilder: (context, index) {
                      return DayCard(
                        day: days[index],
                        onPressed: () => setState(() => _selectedDay = index),
                        isSelected: _selectedDay == index,
                      );
                    },
                  ),
          ),
          SizedBox(
            height: 12.h,
          ),
          SizedBox(
            height: 110.h,
            child: weatherForecastProvider.isLoading
                ? ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.only(right: 8.0.w),
                        child: ShimmerWidget.rectangular(
                          height: 70.h,
                          width: 70.w,
                          shapeBorder: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                        ),
                      );
                    },
                  )
                : ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: days![_selectedDay].hour.length,
                    itemBuilder: (context, index) {
                      return HourCard(
                        hour: days[_selectedDay].hour[index],
                      );
              },
            ),
          )
        ],
      ),
    );
  }
}
