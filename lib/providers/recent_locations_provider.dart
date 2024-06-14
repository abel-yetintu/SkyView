import 'package:flutter/material.dart';
import 'package:sky_view/models/recent_location.dart';
import 'package:sky_view/services/recent_locations_database.dart';

class RecentLocationsProvider extends ChangeNotifier {
  final recentLocationsDatabase = RecentLocationsDatabase.instance;

  Future<List<RecentLocation>> getRecentLocations() async {
    return await recentLocationsDatabase.readAllRecentLocations();
  }

  Future<RecentLocation> addLocation(RecentLocation recentLocation) async {
    final result = await recentLocationsDatabase.create(recentLocation);
    notifyListeners();
    return result;
  }

  Future<RecentLocation> deleteRecentLocation(RecentLocation recentLocation) async {
    final result = await recentLocationsDatabase.delete(recentLocation);
    notifyListeners();
    return result;
  }
}
