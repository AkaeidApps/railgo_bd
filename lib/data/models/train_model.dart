import 'route_stop_model.dart';
import 'fare_model.dart';

class TrainModel {
  final String trainId;
  final String trainNumber;
  final String nameEn;
  final String nameBn;
  final String category; // Intercity, Mail Express, Commuter, Local
  final String originStationCode;
  final String originStationNameEn;
  final String originStationNameBn;
  final String destinationStationCode;
  final String destinationStationNameEn;
  final String destinationStationNameBn;
  final String departureTime;
  final String arrivalTime;
  final String journeyDuration;
  final String weeklyOffDay;
  final List<String> availableClasses;
  final List<RouteStopModel> routeStoppages;
  final List<FareModel> fares;
  final String operationalStatus; // Active, Suspended, Maintenance
  final String source;
  final String verificationStatus;
  final String lastVerifiedAt;

  TrainModel({
    required this.trainId,
    required this.trainNumber,
    required this.nameEn,
    required this.nameBn,
    required this.category,
    required this.originStationCode,
    required this.originStationNameEn,
    required this.originStationNameBn,
    required this.destinationStationCode,
    required this.destinationStationNameEn,
    required this.destinationStationNameBn,
    required this.departureTime,
    required this.arrivalTime,
    required this.journeyDuration,
    required this.weeklyOffDay,
    required this.availableClasses,
    required this.routeStoppages,
    required this.fares,
    required this.operationalStatus,
    required this.source,
    required this.verificationStatus,
    required this.lastVerifiedAt,
  });

  factory TrainModel.fromJson(Map<String, dynamic> json) {
    return TrainModel(
      trainId: json['train_id'] ?? '',
      trainNumber: json['train_number'] ?? '',
      nameEn: json['name_en'] ?? '',
      nameBn: json['name_bn'] ?? '',
      category: json['category'] ?? 'Intercity',
      originStationCode: json['origin_station_code'] ?? '',
      originStationNameEn: json['origin_station_name_en'] ?? '',
      originStationNameBn: json['origin_station_name_bn'] ?? '',
      destinationStationCode: json['destination_station_code'] ?? '',
      destinationStationNameEn: json['destination_station_name_en'] ?? '',
      destinationStationNameBn: json['destination_station_name_bn'] ?? '',
      departureTime: json['departure_time'] ?? '',
      arrivalTime: json['arrival_time'] ?? '',
      journeyDuration: json['journey_duration'] ?? '',
      weeklyOffDay: json['weekly_off_day'] ?? 'None',
      availableClasses: List<String>.from(json['available_classes'] ?? []),
      routeStoppages: (json['route_stoppages'] as List? ?? [])
          .map((e) => RouteStopModel.fromJson(e))
          .toList(),
      fares: (json['fares'] as List? ?? [])
          .map((e) => FareModel.fromJson(e))
          .toList(),
      operationalStatus: json['operational_status'] ?? 'Active',
      source: json['source'] ?? 'https://railway.gov.bd/',
      verificationStatus: json['verification_status'] ?? 'verified',
      lastVerifiedAt:
          json['last_verified_at'] ?? DateTime.now().toIso8601String(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'train_id': trainId,
      'train_number': trainNumber,
      'name_en': nameEn,
      'name_bn': nameBn,
      'category': category,
      'origin_station_code': originStationCode,
      'origin_station_name_en': originStationNameEn,
      'origin_station_name_bn': originStationNameBn,
      'destination_station_code': destinationStationCode,
      'destination_station_name_en': destinationStationNameEn,
      'destination_station_name_bn': destinationStationNameBn,
      'departure_time': departureTime,
      'arrival_time': arrivalTime,
      'journey_duration': journeyDuration,
      'weekly_off_day': weeklyOffDay,
      'available_classes': availableClasses,
      'route_stoppages': routeStoppages.map((e) => e.toJson()).toList(),
      'fares': fares.map((e) => e.toJson()).toList(),
      'operational_status': operationalStatus,
      'source': source,
      'verification_status': verificationStatus,
      'last_verified_at': lastVerifiedAt,
    };
  }
}
