class StationModel {
  final String stationId;
  final String stationNameEn;
  final String stationNameBn;
  final String stationCode;
  final String division;
  final String district;
  final String railwayZone; // East Zone / West Zone
  final String stationType; // Junction / Major Station / Halt
  final double latitude;
  final double longitude;
  final List<String> facilities;
  final String source;
  final String verificationStatus;

  StationModel({
    required this.stationId,
    required this.stationNameEn,
    required this.stationNameBn,
    required this.stationCode,
    required this.division,
    required this.district,
    required this.railwayZone,
    required this.stationType,
    required this.latitude,
    required this.longitude,
    required this.facilities,
    required this.source,
    required this.verificationStatus,
  });

  factory StationModel.fromJson(Map<String, dynamic> json) {
    return StationModel(
      stationId: json['station_id'] ?? '',
      stationNameEn: json['station_name_en'] ?? '',
      stationNameBn: json['station_name_bn'] ?? '',
      stationCode: json['station_code'] ?? '',
      division: json['division'] ?? '',
      district: json['district'] ?? '',
      railwayZone: json['railway_zone'] ?? '',
      stationType: json['station_type'] ?? '',
      latitude: (json['latitude'] as num?)?.toDouble() ?? 0.0,
      longitude: (json['longitude'] as num?)?.toDouble() ?? 0.0,
      facilities: List<String>.from(json['facilities'] ?? []),
      source: json['source'] ?? 'https://railway.gov.bd/',
      verificationStatus: json['verification_status'] ?? 'verified',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'station_id': stationId,
      'station_name_en': stationNameEn,
      'station_name_bn': stationNameBn,
      'station_code': stationCode,
      'division': division,
      'district': district,
      'railway_zone': railwayZone,
      'station_type': stationType,
      'latitude': latitude,
      'longitude': longitude,
      'facilities': facilities,
      'source': source,
      'verification_status': verificationStatus,
    };
  }
}
