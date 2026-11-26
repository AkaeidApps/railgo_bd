class FareModel {
  final String trainId;
  final String originCode;
  final String destinationCode;
  final String trainClass;
  final double baseFare;
  final double vatCharge;
  final double totalFare;
  final String effectiveDate;
  final String source;
  final String verificationStatus;

  FareModel({
    required this.trainId,
    required this.originCode,
    required this.destinationCode,
    required this.trainClass,
    required this.baseFare,
    required this.vatCharge,
    required this.totalFare,
    required this.effectiveDate,
    required this.source,
    required this.verificationStatus,
  });

  factory FareModel.fromJson(Map<String, dynamic> json) {
    return FareModel(
      trainId: json['train_id'] ?? '',
      originCode: json['origin_code'] ?? '',
      destinationCode: json['destination_code'] ?? '',
      trainClass: json['train_class'] ?? 'Shovon Chair',
      baseFare: (json['base_fare'] as num?)?.toDouble() ?? 0.0,
      vatCharge: (json['vat_charge'] as num?)?.toDouble() ?? 0.0,
      totalFare: (json['total_fare'] as num?)?.toDouble() ?? 0.0,
      effectiveDate: json['effective_date'] ?? '',
      source: json['source'] ?? 'https://railway.gov.bd/',
      verificationStatus: json['verification_status'] ?? 'verified',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'train_id': trainId,
      'origin_code': originCode,
      'destination_code': destinationCode,
      'train_class': trainClass,
      'base_fare': baseFare,
      'vat_charge': vatCharge,
      'total_fare': totalFare,
      'effective_date': effectiveDate,
      'source': source,
      'verification_status': verificationStatus,
    };
  }
}
