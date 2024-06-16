import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sky_view/providers/navigation_provider.dart';
import 'package:sky_view/providers/recent_locations_provider.dart';
import 'package:sky_view/providers/general_settings_provider.dart';
import 'package:sky_view/wrapper.dart';
import 'package:sky_view/providers/weather_forecast_provider.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var prefs = await SharedPreferences.getInstance();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<NavigationProvider>(
          create: (context) => NavigationProvider(),
        ),
        ChangeNotifierProvider<WeatherForecastProvider>(
          create: (context) => WeatherForecastProvider(),
        ),
        ChangeNotifierProvider<RecentLocationsProvider>(
          create: (context) => RecentLocationsProvider(),
        ),
        ChangeNotifierProvider<GeneralSettings>(
          create: (context) => GeneralSettings(prefs: prefs),
        )
      ],
      child: const SkyView(),
    ),
  );
}

class SkyView extends StatelessWidget {
  const SkyView({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 760),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            fontFamily: 'Montserrat',
            appBarTheme: const AppBarTheme(
              systemOverlayStyle: SystemUiOverlayStyle.light,
            ),
          ),
          home: const Wrapper(),
        );
      },
    );
  }
}
