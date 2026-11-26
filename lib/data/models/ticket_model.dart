class TicketModel {
  final String ticketId;
  final String pnr;
  final String trainNumber;
  final String trainNameEn;
  final String trainNameBn;
  final String originStationEn;
  final String originStationBn;
  final String destinationStationEn;
  final String destinationStationBn;
  final String journeyDate;
  final String departureTime;
  final String arrivalTime;
  final String trainClass;
  final String coachName;
  final List<String> seats;
  final double totalFare;
  final String passengerName;
  final String passengerPhone;
  final String passengerNid;
  final String status; // Upcoming, Completed, Cancelled
  final String bookingTime;
  final String qrCodeData;

  TicketModel({
    required this.ticketId,
    required this.pnr,
    required this.trainNumber,
    required this.trainNameEn,
    required this.trainNameBn,
    required this.originStationEn,
    required this.originStationBn,
    required this.destinationStationEn,
    required this.destinationStationBn,
    required this.journeyDate,
    required this.departureTime,
    required this.arrivalTime,
    required this.trainClass,
    required this.coachName,
    required this.seats,
    required this.totalFare,
    required this.passengerName,
    required this.passengerPhone,
    required this.passengerNid,
    required this.status,
    required this.bookingTime,
    required this.qrCodeData,
  });

  factory TicketModel.fromJson(Map<String, dynamic> json) {
    return TicketModel(
      ticketId: json['ticket_id'] ?? '',
      pnr: json['pnr'] ?? '',
      trainNumber: json['train_number'] ?? '',
      trainNameEn: json['train_name_en'] ?? '',
      trainNameBn: json['train_name_bn'] ?? '',
      originStationEn: json['origin_station_en'] ?? '',
      originStationBn: json['origin_station_bn'] ?? '',
      destinationStationEn: json['destination_station_en'] ?? '',
      destinationStationBn: json['destination_station_bn'] ?? '',
      journeyDate: json['journey_date'] ?? '',
      departureTime: json['departure_time'] ?? '',
      arrivalTime: json['arrival_time'] ?? '',
      trainClass: json['train_class'] ?? '',
      coachName: json['coach_name'] ?? '',
      seats: List<String>.from(json['seats'] ?? []),
      totalFare: (json['total_fare'] as num?)?.toDouble() ?? 0.0,
      passengerName: json['passenger_name'] ?? '',
      passengerPhone: json['passenger_phone'] ?? '',
      passengerNid: json['passenger_nid'] ?? '',
      status: json['status'] ?? 'Upcoming',
      bookingTime: json['booking_time'] ?? '',
      qrCodeData: json['qr_code_data'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'ticket_id': ticketId,
      'pnr': pnr,
      'train_number': trainNumber,
      'train_name_en': trainNameEn,
      'train_name_bn': trainNameBn,
      'origin_station_en': originStationEn,
      'origin_station_bn': originStationBn,
      'destination_station_en': destinationStationEn,
      'destination_station_bn': destinationStationBn,
      'journey_date': journeyDate,
      'departure_time': departureTime,
      'arrival_time': arrivalTime,
      'train_class': trainClass,
      'coach_name': coachName,
      'seats': seats,
      'total_fare': totalFare,
      'passenger_name': passengerName,
      'passenger_phone': passengerPhone,
      'passenger_nid': passengerNid,
      'status': status,
      'booking_time': bookingTime,
      'qr_code_data': qrCodeData,
    };
  }
}
