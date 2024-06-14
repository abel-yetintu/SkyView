import 'dart:convert';

const String tableName = 'recent_locations';
const String cityField = 'city';

class RecentLocation {
  final String city;

  const RecentLocation({required this.city});

  RecentLocation copyWith({
    String? city,
  }) {
    return RecentLocation(
      city: city ?? this.city,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      cityField: city,
    };
  }

  factory RecentLocation.fromMap(Map<String, dynamic> map) {
    return RecentLocation(
      city: map['city'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory RecentLocation.fromJson(String source) => RecentLocation.fromMap(json.decode(source) as Map<String, dynamic>);
}
