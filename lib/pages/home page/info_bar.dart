import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:sky_view/models/weather_forecast.dart';
import 'package:sky_view/providers/general_settings_provider.dart';

class InfoBar extends StatelessWidget {
  final WeatherForecast weatherForecast;
  const InfoBar({super.key, required this.weatherForecast});

  @override
  Widget build(BuildContext context) {
    GeneralSettings generalSettings = Provider.of<GeneralSettings>(context);
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 6.w, vertical: 8.h),
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(50.r))),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 32.0.w, vertical: 24.0.h),
        child: IntrinsicHeight(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [ 
                  Text(
                    generalSettings.isKmph
                        ? '${weatherForecast.current.windKph.round()}km/h'
                        : '${weatherForecast.current.windMph.round()}m/h',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16.sp,
                    ),
                  ),
                  SizedBox(
                    height: 6.h,
                  ),
                  Text(
                    'wind',
                    style: TextStyle(
                      color: Colors.grey[700],
                      fontSize: 12.sp,
                    ),
                  ),
                ],
              ),
              VerticalDivider(
                color: Colors.grey[300],
                width: 0,
                thickness: 1.w,
              ),
              Column(
                children: [
                  Text(
                    generalSettings.isMilli
                        ? '${weatherForecast.current.pressureMb.round()} mb'
                        : '${weatherForecast.current.pressureIn.round()} in',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16.sp,
                    ),
                  ),
                  SizedBox(
                    height: 6.h,
                  ),
                  Text(
                    'pressure',
                    style: TextStyle(
                      color: Colors.grey[700],
                      fontSize: 12.sp,
                    ),
                  ),
                ],
              ),
              VerticalDivider(
                color: Colors.grey[300],
                width: 0,
                thickness: 1.w,
              ),
              Column(
                children: [
                  Text(
                    '${weatherForecast.current.humidity}%',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16.sp,
                    ),
                  ),
                  SizedBox(
                    height: 6.h,
                  ),
                  Text(
                    'humidity',
                    style: TextStyle(
                      color: Colors.grey[700],
                      fontSize: 12.sp,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
