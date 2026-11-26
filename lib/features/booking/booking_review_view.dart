import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/constants/app_colors.dart';
import '../../core/routes/app_routes.dart';
import '../../core/utils/currency_formatter.dart';
import '../../core/widgets/rail_button.dart';
import '../../core/widgets/rail_card.dart';
import '../../data/models/seat_model.dart';
import '../../data/models/train_model.dart';

class BookingReviewView extends StatelessWidget {
  const BookingReviewView({super.key});

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> args = Get.arguments ?? {};
    final TrainModel train = args['train'];
    final List<SeatModel> seats = args['seats'];
    final double totalPrice = args['totalPrice'];
    final String passengerName = args['passengerName'];
    final String passengerPhone = args['passengerPhone'];

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(title: const Text('Booking Review')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RailCard(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    train.nameEn,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Train #${train.trainNumber} • ${train.category}',
                    style: const TextStyle(
                      fontSize: 13,
                      color: AppColors.textSecondary,
                    ),
                  ),
                  const Divider(height: 24, color: AppColors.divider),
                  _row(
                    'Route',
                    '${train.originStationNameEn} → ${train.destinationStationNameEn}',
                  ),
                  const SizedBox(height: 8),
                  _row('Departure', train.departureTime),
                  const SizedBox(height: 8),
                  _row('Selected Seats', seats.map((s) => s.seatId).join(', ')),
                  const SizedBox(height: 8),
                  _row('Passenger', passengerName),
                  const SizedBox(height: 8),
                  _row('Mobile', passengerPhone),
                ],
              ),
            ),
            const SizedBox(height: 20),
            RailCard(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  _row('Base Fare', CurrencyFormatter.format(totalPrice * 0.9)),
                  const SizedBox(height: 8),
                  _row(
                    'VAT & Service Charge',
                    CurrencyFormatter.format(totalPrice * 0.1),
                  ),
                  const Divider(height: 24, color: AppColors.divider),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Total Payable',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        CurrencyFormatter.format(totalPrice),
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: AppColors.primary,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            RailButton(
              text: 'Proceed to Payment',
              onPressed: () => Get.toNamed(AppRoutes.payment, arguments: args),
            ),
          ],
        ),
      ),
    );
  }

  Widget _row(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 14, color: AppColors.textSecondary),
        ),
        Text(
          value,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: AppColors.textPrimary,
          ),
        ),
      ],
    );
  }
}
