import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GeneralSettings extends ChangeNotifier {
  static const tempUnitKey = 'tempUnitKey';
  static const windUnitKey = 'windUnitKey';
  static const preUnitKey = 'preUnitKey';
  static const defaultLocationKey = 'location';

  final SharedPreferences prefs;

  bool _isCelsius;
  bool get isCelsius => _isCelsius;

  bool _isKmph;
  bool get isKmph => _isKmph;

  bool _isMilli;
  bool get isMilli => _isMilli;

  String? _defaultLocation;
  String? get defaultLocation => _defaultLocation;

  GeneralSettings({required this.prefs})
      : _isCelsius = prefs.getBool(tempUnitKey) ?? true,
        _isKmph = prefs.getBool(windUnitKey) ?? true,
        _isMilli = prefs.getBool(preUnitKey) ?? true,
        _defaultLocation = prefs.getString(defaultLocationKey);

  void changeTempUnit() {
    _isCelsius = !_isCelsius;
    prefs.setBool(tempUnitKey, _isCelsius);
    notifyListeners();
  }

  void changeWindUnit() {
    _isKmph = !_isKmph;
    prefs.setBool(windUnitKey, _isKmph);
    notifyListeners();
  }

  void changePreUnit() {
    _isMilli = !_isMilli;
    prefs.setBool(preUnitKey, _isMilli);
    notifyListeners();
  }

  void setLocation(String? location) {
    _defaultLocation = location;
    if (_defaultLocation != null) {
      prefs.setString(defaultLocationKey, _defaultLocation!);
      notifyListeners();
    }
  }
}
