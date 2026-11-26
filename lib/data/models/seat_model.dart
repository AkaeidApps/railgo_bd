enum SeatStatus { available, selected, booked, vip }

class SeatModel {
  final String seatId;
  final String seatNumber; // e.g. KA-1, KA-2
  final String coachName; // e.g. KA, KHA, GA
  final String trainClass;
  SeatStatus status;
  final bool isWindow;
  final double price;

  SeatModel({
    required this.seatId,
    required this.seatNumber,
    required this.coachName,
    required this.trainClass,
    this.status = SeatStatus.available,
    this.isWindow = false,
    required this.price,
  });
}
