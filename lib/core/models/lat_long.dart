/// Simple model representing a geographic coordinate.
class LatLong {
  final double lat;
  final double long;

  const LatLong({required this.lat, required this.long});

  LatLong copyWith({double? lat, double? long}) =>
      LatLong(lat: lat ?? this.lat, long: long ?? this.long);

  @override
  String toString() => 'LatLong(lat: $lat, long: $long)';
}
