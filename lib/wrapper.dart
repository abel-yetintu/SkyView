import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:provider/provider.dart';
import 'package:sky_view/providers/general_settings_provider.dart';
import 'package:sky_view/providers/navigation_provider.dart';
import 'package:sky_view/providers/weather_forecast_provider.dart';
import 'pages/home page/home.dart';
import 'pages/search page/search.dart';

class Wrapper extends StatefulWidget {
  const Wrapper({super.key});

  @override
  State<Wrapper> createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  final List<Widget> _pages = const [Home(), Search()];

  Future<bool> _handleLocationPermission() async {
    bool serviceEnabled;
    LocationPermission locationPermission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Location services are disabled. Please enable the services or search for location'),
          duration: Duration(seconds: 5),
        ),
      );
      return false;
    }
    locationPermission = await Geolocator.checkPermission();
    if (locationPermission == LocationPermission.denied) {
      locationPermission = await Geolocator.requestPermission();
      if (locationPermission == LocationPermission.denied) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Location permissions are denied. Search for a location'),
            duration: Duration(seconds: 5),
          ),
        );
        return false;
      }
    }
    if (locationPermission == LocationPermission.deniedForever) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Location permissions are permanently denied. Search for a location.'),
          duration: Duration(seconds: 5),
        ),
      );
      return false;
    }
    return true;
  }

  Future<Position?> _getCurrentPosition() async {
    final hasPermission = await _handleLocationPermission();
    if (!hasPermission) return null;
    try {
      final location = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
      return location;
    } catch (e) {
      return null;
    }
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      var generalSettings = Provider.of<GeneralSettings>(context, listen: false);
      var weatherForecastProvdier = Provider.of<WeatherForecastProvider>(context, listen: false);

      if (generalSettings.defaultLocation == null) {
        var navigation = Provider.of<NavigationProvider>(context, listen: false);

        if (weatherForecastProvdier.weatherForecast == null && weatherForecastProvdier.appException == null) {
          final position = await _getCurrentPosition();

          if (position != null) {
            await weatherForecastProvdier.getWeatherForecastByLocation(position);
            generalSettings.setLocation(weatherForecastProvdier.weatherForecast?.location.name);
          } else {
            navigation.changePage(1);
          }
        }
      } else {
        if (weatherForecastProvdier.weatherForecast == null && weatherForecastProvdier.appException == null) {
          weatherForecastProvdier.getWeatherForecastByCityName(generalSettings.defaultLocation!);
        }
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    NavigationProvider navigation = Provider.of<NavigationProvider>(context);
    return Scaffold(
      backgroundColor: Colors.black,
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: false,
      body: _pages[navigation.pageIndex],
      bottomNavigationBar: Padding(
        padding: EdgeInsets.fromLTRB(100.w, 0, 100.w, 8.h),
        child: GNav(
          padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
          tabBackgroundColor: Colors.white,
          tabBorderRadius: 12.r,
          color: Colors.white,
          activeColor: Colors.grey.shade900,
          tabs: const [
            GButton(
              icon: Icons.home,
              iconColor: Colors.white,
              text: '',
            ),
            GButton(
              icon: Icons.search,
              iconColor: Colors.white,
              text: '',
            )
          ],
          selectedIndex: navigation.pageIndex,
          onTabChange: (value) {
            navigation.changePage(value);
          },
        ),
      ),
    );
  }
}
