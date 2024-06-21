import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sky_view/pages/home%20page/info_bar.dart';
import 'package:sky_view/providers/general_settings_provider.dart';
import 'package:sky_view/providers/weather_forecast_provider.dart';
import 'package:sky_view/utils/extensions.dart';
import 'package:sky_view/utils/shimmer_widget.dart';

class TopWidget extends StatelessWidget {
  const TopWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var generalSettings = Provider.of<GeneralSettings>(context, listen: false);
    return Container(
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color.fromARGB(255, 10, 98, 230),
            Color.fromARGB(255, 11, 3, 94),
          ],
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(50.r),
          bottomRight: Radius.circular(50.r),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.only(
              top: (MediaQuery.paddingOf(context).top + 6).h,
              right: 8.w,
              left: 8.w,
              bottom: 24.h,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 9.0.w, vertical: 4.h),
                    child: Column(
                      children: [
                        Consumer<WeatherForecastProvider>(builder: (context, value, child) {
                          if (value.isLoading) {
                            return ShimmerWidget.rectangular(height: 21.h, width: 180.w);
                          } else {
                            if (generalSettings.defaultLocation == null) {
                              WidgetsBinding.instance.addPostFrameCallback((_) {
                                generalSettings.setLocation(value.weatherForecast?.location.name);
                              });
                            }
                            return Text(
                              '${value.weatherForecast!.location.name}, ${value.weatherForecast!.location.country}',
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey[200],
                              ),
                            );
                          }
                        }),
                        SizedBox(
                          height: 6.h,
                        ),
                        Consumer<WeatherForecastProvider>(builder: (context, value, child) {
                          if (value.isLoading) {
                            return ShimmerWidget.rectangular(height: 18.h, width: 150.w);
                          } else {
                            DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(value.weatherForecast!.location.localtimeEpoch * 1000);
                            String date = DateFormat('EEEE, dd MMMM yyyy').format(dateTime);
                            return Text(
                              date,
                              style: TextStyle(
                                fontSize: 12.sp,
                                color: Colors.grey[300],
                              ),
                            );
                          }
                        }),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Consumer<WeatherForecastProvider>(builder: (context, value, child) {
            if (value.isLoading) {
              return ShimmerWidget.rectangular(
                width: 130.w,
                height: 130.h,
                shapeBorder: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.r),
                ),
              );
            } else {
              return Consumer<WeatherForecastProvider>(builder: (context, value, child) {
                int isDay = value.weatherForecast!.current.isDay;
                String text = value.weatherForecast!.current.condition.text.trim().toCapitalized();
                String folderPath = isDay == 1 ? 'day' : 'night';
                return SizedBox(
                  width: 125.w,
                  child: Image.asset('assets/icons/weather/$folderPath/$text.png'),
                );
              });
            }
          }),
          SizedBox(
            height: 8.h,
          ),
          Consumer<WeatherForecastProvider>(
            builder: (context, value, child) {
              if (value.isLoading) {
                return Padding(
                  padding: EdgeInsets.only(bottom: 12.h),
                  child: ShimmerWidget.rectangular(
                      height: 80.h,
                      width: 80.w,
                      shapeBorder: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.r),
                      )),
                );
              } else {
                return Consumer<GeneralSettings>(
                  builder: (context, unit, child) {
                    return Text(
                      unit.isCelsius
                          ? '${value.weatherForecast!.current.tempC.round()}°'
                          : '${value.weatherForecast!.current.tempF.round()}°',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.grey[200],
                        fontSize: 60.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    );
                  },
                );
              }
            },
          ),
          Consumer<WeatherForecastProvider>(
            builder: (context, value, child) {
              if (value.isLoading) {
                return ShimmerWidget.rectangular(height: 14.h, width: 100.w);
              } else {
                return Text(
                  value.weatherForecast!.current.condition.text,
                  style: TextStyle(color: Colors.grey[200], fontSize: 14.sp),
                );
              }
            },
          ),
          SizedBox(
            height: 24.h,
          ),
          Consumer<WeatherForecastProvider>(
            builder: (context, value, child) {
              if (value.isLoading) {
                return Shimmer.fromColors(
                  baseColor: Colors.white,
                  highlightColor: Colors.grey.shade700,
                  child: Card(
                      margin: EdgeInsets.symmetric(horizontal: 6.w, vertical: 8.h),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(50.r))),
                      color: Colors.grey.shade200.withOpacity(0.2),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 32.0.w, vertical: 48.0.h),
                        child: Container(),
                      )),
                );
              } else {
                return InfoBar(weatherForecast: value.weatherForecast!);
              }
            },
          ),
        ],
      ),
    );
  }
}
