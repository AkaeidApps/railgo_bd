import 'package:get/get.dart';

import '../../core/routes/app_routes.dart';
import '../../data/models/seat_model.dart';
import '../../data/models/train_model.dart';

class SeatSelectionController extends GetxController {
  late TrainModel train;
  final selectedSeats = <SeatModel>[].obs;
  final seats = <SeatModel>[].obs;
  final selectedCoach = 'KA'.obs;

  final coaches = ['KA', 'KHA', 'GA', 'GHA'];

  @override
  void onInit() {
    super.onInit();
    train = Get.arguments ?? _defaultTrain();
    _generateSeats();
  }

  TrainModel _defaultTrain() {
    return TrainModel(
      trainId: 'default',
      trainNumber: '701',
      nameEn: 'Suborno Express',
      nameBn: 'সুবর্ণ এক্সপ্রেস',
      category: 'Intercity',
      originStationCode: 'CGP',
      originStationNameEn: 'Chattogram Central',
      originStationNameBn: 'চট্টগ্রাম সেন্ট্রাল',
      destinationStationCode: 'DAK',
      destinationStationNameEn: 'Dhaka Kamalapur',
      destinationStationNameBn: 'ঢাকা কমলাপুর',
      departureTime: '07:00',
      arrivalTime: '12:15',
      journeyDuration: '5h 15m',
      weeklyOffDay: 'Monday',
      availableClasses: ['Shovon Chair'],
      routeStoppages: [],
      fares: [],
      operationalStatus: 'Active',
      source: 'https://railway.gov.bd/',
      verificationStatus: 'verified',
      lastVerifiedAt: DateTime.now().toIso8601String(),
    );
  }

  void _generateSeats() {
    final list = <SeatModel>[];
    final rows = ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10'];
    final cols = ['A', 'B', 'C', 'D'];

    for (var row in rows) {
      for (var col in cols) {
        final seatNum = '$row$col';
        final isBooked =
            (row == '2' && col == 'B') || (row == '5' && col == 'C');
        list.add(
          SeatModel(
            seatId: '${selectedCoach.value}-$seatNum',
            seatNumber: seatNum,
            coachName: selectedCoach.value,
            trainClass: 'Shovon Chair',
            status: isBooked ? SeatStatus.booked : SeatStatus.available,
            isWindow: col == 'A' || col == 'D',
            price: 420.0,
          ),
        );
      }
    }
    seats.value = list;
  }

  void toggleSeat(SeatModel seat) {
    if (seat.status == SeatStatus.booked) return;

    if (seat.status == SeatStatus.selected) {
      seat.status = SeatStatus.available;
      selectedSeats.removeWhere((s) => s.seatId == seat.seatId);
    } else {
      if (selectedSeats.length >= 4) {
        Get.snackbar(
          'Limit Reached',
          'Maximum 4 seats can be selected per booking',
        );
        return;
      }
      seat.status = SeatStatus.selected;
      selectedSeats.add(seat);
    }
    seats.refresh();
  }

  double get totalPrice {
    if (train.fares.isNotEmpty) {
      return selectedSeats.length * train.fares.first.totalFare;
    }
    return selectedSeats.length * 420.0;
  }

  void proceedToPassengerInfo() {
    if (selectedSeats.isEmpty) {
      Get.snackbar(
        'Select Seats',
        'Please select at least one seat to continue',
      );
      return;
    }
    Get.toNamed(
      AppRoutes.passengerInfo,
      arguments: {
        'train': train,
        'seats': selectedSeats,
        'totalPrice': totalPrice,
      },
    );
  }
}
