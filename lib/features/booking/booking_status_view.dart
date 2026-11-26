import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/constants/app_colors.dart';
import '../../core/routes/app_routes.dart';
import '../../core/widgets/rail_button.dart';
import '../../data/models/seat_model.dart';
import '../../data/models/ticket_model.dart';
import '../../data/models/train_model.dart';
import '../../data/repositories/booking_repository.dart';

class BookingStatusView extends StatelessWidget {
  const BookingStatusView({super.key});

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> args = Get.arguments ?? {};
    final TrainModel train = args['train'];
    final List<SeatModel> seats = args['seats'];
    final double totalPrice = args['totalPrice'];
    final String passengerName = args['passengerName'];
    final String passengerPhone = args['passengerPhone'];
    final String passengerNid = args['passengerNid'];

    final ticket = TicketModel(
      ticketId: 'tck_${DateTime.now().millisecondsSinceEpoch}',
      pnr: 'BR${DateTime.now().millisecondsSinceEpoch.toString().substring(5)}',
      trainNumber: train.trainNumber,
      trainNameEn: train.nameEn,
      trainNameBn: train.nameBn,
      originStationEn: train.originStationNameEn,
      originStationBn: train.originStationNameBn,
      destinationStationEn: train.destinationStationNameEn,
      destinationStationBn: train.destinationStationNameBn,
      journeyDate: '2025-04-20',
      departureTime: train.departureTime,
      arrivalTime: train.arrivalTime,
      trainClass: 'Shovon Chair',
      coachName: seats.isNotEmpty ? seats.first.coachName : 'KA',
      seats: seats.map((s) => s.seatId).toList(),
      totalFare: totalPrice,
      passengerName: passengerName,
      passengerPhone: passengerPhone,
      passengerNid: passengerNid,
      status: 'Upcoming',
      bookingTime: DateTime.now().toString(),
      qrCodeData:
          'RAILGO-BD-PNR-${train.trainNumber}-${seats.map((s) => s.seatId).join("-")}',
    );

    Get.put(BookingRepository()).addTicket(ticket);

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 90,
                height: 90,
                decoration: const BoxDecoration(
                  color: AppColors.lightGreen,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.check_rounded,
                  size: 54,
                  color: AppColors.primary,
                ),
              ),
              const SizedBox(height: 24),
              const Text(
                'Booking Confirmed Successfully!',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimary,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              const Text(
                'Your Bangladesh Railway E-Ticket has been generated and saved securely to My Tickets.',
                style: TextStyle(fontSize: 14, color: AppColors.textSecondary),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),
              RailButton(
                text: 'View E-Ticket',
                onPressed: () =>
                    Get.offAllNamed(AppRoutes.eticket, arguments: ticket),
              ),
              const SizedBox(height: 16),
              OutlinedButton(
                onPressed: () => Get.offAllNamed(AppRoutes.mainNav),
                child: const Text('Back to Home'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
