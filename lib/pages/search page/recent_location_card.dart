import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:sky_view/models/recent_location.dart';
import 'package:sky_view/providers/navigation_provider.dart';
import 'package:sky_view/providers/recent_locations_provider.dart';
import 'package:sky_view/providers/weather_forecast_provider.dart';

class RecentLocationCard extends StatelessWidget {
  final RecentLocation recentLocation;
  const RecentLocationCard({super.key, required this.recentLocation});

  @override
  Widget build(BuildContext context) {
    final recentlocationProvider = Provider.of<RecentLocationsProvider>(context, listen: false);
    final weatherForecastProvider = Provider.of<WeatherForecastProvider>(context, listen: false);
    final navigation = Provider.of<NavigationProvider>(context, listen: false);

    return Card(
      margin: EdgeInsets.symmetric(horizontal: 6.w, vertical: 6.h),
      color: const Color.fromARGB(255, 18, 18, 18),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 0.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () {
                  weatherForecastProvider.getWeatherForecastByCityName(recentLocation.city);
                  navigation.changePage(0);
                },
                child: Text(
                  recentLocation.city,
                  style: TextStyle(
                    color: Colors.grey[200],
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            IconButton(
              icon: Icon(
                Icons.clear,
                size: 24.r,
                color: Colors.grey[200],
              ),
              onPressed: () {
                recentlocationProvider.deleteRecentLocation(recentLocation);
              },
            ),
          ],
        ),
      ),
    );
  }
}
