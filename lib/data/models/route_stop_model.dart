class RouteStopModel {
  final int stopSequence;
  final String stationCode;
  final String stationNameEn;
  final String stationNameBn;
  final String arrivalTime;
  final String departureTime;
  final int haltMinutes;
  final double distanceKm;

  RouteStopModel({
    required this.stopSequence,
    required this.stationCode,
    required this.stationNameEn,
    required this.stationNameBn,
    required this.arrivalTime,
    required this.departureTime,
    required this.haltMinutes,
    required this.distanceKm,
  });

  factory RouteStopModel.fromJson(Map<String, dynamic> json) {
    return RouteStopModel(
      stopSequence: json['stop_sequence'] ?? 1,
      stationCode: json['station_code'] ?? '',
      stationNameEn: json['station_name_en'] ?? '',
      stationNameBn: json['station_name_bn'] ?? '',
      arrivalTime: json['arrival_time'] ?? '',
      departureTime: json['departure_time'] ?? '',
      haltMinutes: json['halt_minutes'] ?? 0,
      distanceKm: (json['distance_km'] as num?)?.toDouble() ?? 0.0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'stop_sequence': stopSequence,
      'station_code': stationCode,
      'station_name_en': stationNameEn,
      'station_name_bn': stationNameBn,
      'arrival_time': arrivalTime,
      'departure_time': departureTime,
      'halt_minutes': haltMinutes,
      'distance_km': distanceKm,
    };
  }
}
