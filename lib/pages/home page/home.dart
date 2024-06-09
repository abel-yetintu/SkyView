import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:sky_view/pages/home%20page/bottom_widget.dart';
import 'package:sky_view/pages/home%20page/top_widget.dart';
import 'package:sky_view/providers/weather_forecast_provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      var weatherForecastProvdier = Provider.of<WeatherForecastProvider>(context, listen: false);
      if (weatherForecastProvdier.weatherForecast == null) {
        weatherForecastProvdier.getWeatherForecastByCityName('addis ababa');
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
  }
}
