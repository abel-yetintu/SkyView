import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:sky_view/models/recent_location.dart';
import 'package:sky_view/pages/search%20page/recent_list.dart';
import 'package:sky_view/providers/navigation_provider.dart';
import 'package:sky_view/providers/recent_locations_provider.dart';
import 'package:sky_view/providers/weather_forecast_provider.dart';
import 'package:sky_view/services/recent_locations_database.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  final TextEditingController _textInputController = TextEditingController();
  final RecentLocationsDatabase database = RecentLocationsDatabase.instance;

  @override
  Widget build(BuildContext context) {
    final NavigationProvider navigation = Provider.of<NavigationProvider>(context, listen: false);
    final RecentLocationsProvider recentLocationsProvider = Provider.of<RecentLocationsProvider>(context, listen: false);
    final WeatherForecastProvider weatherForecastProvider = Provider.of<WeatherForecastProvider>(context);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextField(
            style: TextStyle(color: Colors.grey[200]),
            cursorColor: Colors.grey[800],
            controller: _textInputController,
            decoration: InputDecoration(
                hintText: "Enter location..",
                hintStyle: TextStyle(color: Colors.grey[600]),
                filled: true,
                fillColor: Colors.black,
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.grey.shade900,
                    width: 1.0.w,
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(12.r),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.grey.shade500,
                    width: 1.0.w,
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(12.r),
                  ),
                ),
                suffixIcon: IconButton(
                  icon: Icon(
                    Icons.clear,
                    color: Colors.grey[400],
                  ),
                  onPressed: () {
                    setState(() {
                      _textInputController.clear();
                    });
                  },
                )),
            onChanged: (value) {
              setState(() {
                _textInputController.text = value;
              });
            },
            textInputAction: TextInputAction.search,
            onSubmitted: (value) {
              weatherForecastProvider.getWeatherForecastByCityName(_textInputController.text);
              recentLocationsProvider.addLocation(RecentLocation(city: _textInputController.text));
              navigation.changePage(0);
            },
          ),
          SizedBox(
            height: 24.h,
          ),
          if (_textInputController.text.isEmpty) ...[
            const Expanded(child: RecentList()),
          ] else if (_textInputController.text.isNotEmpty)
            ...[]
        ],
      ),
    );
  }
}
