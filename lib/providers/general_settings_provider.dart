import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GeneralSettings extends ChangeNotifier {
  static const unitKey = 'isCelsius';
  static const defaultLocationKey = 'location';

  final SharedPreferences prefs;

  bool _isCelsius;
  bool get isCelsius => _isCelsius;

  String? _defaultLocation;
  String? get defaultLocation => _defaultLocation;

  GeneralSettings({required this.prefs})
      : _isCelsius = prefs.getBool(unitKey) ?? true,
        _defaultLocation = prefs.getString(defaultLocationKey);

  void changeUnit() {
    _isCelsius = !_isCelsius;
    prefs.setBool(unitKey, _isCelsius);
    notifyListeners();
  }

  void setLocation(String? location) {
    _defaultLocation = location;
    if (_defaultLocation != null) {
      prefs.setString(defaultLocationKey, _defaultLocation!);
    }
  }
}
