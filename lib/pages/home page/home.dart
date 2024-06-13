import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:sky_view/pages/home%20page/bottom_widget.dart';
import 'package:sky_view/pages/home%20page/top_widget.dart';
import 'package:sky_view/providers/weather_forecast_provider.dart';
import 'package:sky_view/utils/app_exception.dart';
import 'package:sky_view/utils/error_widget.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Selector<WeatherForecastProvider, AppException?>(
      selector: (context, provider) => provider.appException,
      builder: (context, value, child) {
        if (value == null) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Expanded(
                child: TopWidget(),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 6.h),
                child: const BottomWidget(),
              ),
            ],
          );
        } else {
          return Column(
            children: [
              Expanded(
                child: ErrorInfo(
                  appException: value,
                ),
              ),
              Container(
                height: 200.h,
              )
            ],
          );
        }
      },
    );
  }
}
