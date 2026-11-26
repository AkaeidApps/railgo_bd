import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/constants/app_colors.dart';
import '../../core/utils/currency_formatter.dart';
import '../../core/widgets/rail_button.dart';
import 'seat_selection_controller.dart';
import '../../data/models/seat_model.dart';

class SeatSelectionView extends GetView<SeatSelectionController> {
  const SeatSelectionView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SeatSelectionController());
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(title: const Text('Select Coach & Seats')),
      body: SafeArea(
        child: Column(
          children: [
            // Coach selector
            Container(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              color: AppColors.surface,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: controller.coaches.map((coach) {
                  return Obx(() {
                    final isSelected = controller.selectedCoach.value == coach;
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 6),
                      child: ChoiceChip(
                        label: Text('Coach $coach'),
                        selected: isSelected,
                        selectedColor: AppColors.primary,
                        labelStyle: TextStyle(
                          color: isSelected
                              ? Colors.white
                              : AppColors.textPrimary,
                          fontWeight: FontWeight.bold,
                        ),
                        onSelected: (val) {
                          controller.selectedCoach.value = coach;
                        },
                      ),
                    );
                  });
                }).toList(),
              ),
            ),
            // Legend
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _legendItem('Available', Colors.white, AppColors.border),
                  const SizedBox(width: 16),
                  _legendItem('Selected', AppColors.primary, AppColors.primary),
                  const SizedBox(width: 16),
                  _legendItem(
                    'Booked',
                    AppColors.seatBooked,
                    AppColors.seatBooked,
                  ),
                ],
              ),
            ),
            // Seats Grid
            Expanded(
              child: Obx(
                () => GridView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    childAspectRatio: 1.1,
                  ),
                  itemCount: controller.seats.length,
                  itemBuilder: (context, index) {
                    final seat = controller.seats[index];
                    Color bg = Colors.white;
                    Color fg = AppColors.textPrimary;
                    BoxBorder? border = Border.all(color: AppColors.border);

                    if (seat.status == SeatStatus.selected) {
                      bg = AppColors.primary;
                      fg = Colors.white;
                      border = null;
                    } else if (seat.status == SeatStatus.booked) {
                      bg = AppColors.seatBooked;
                      fg = AppColors.textSecondary;
                    }

                    return InkWell(
                      onTap: () => controller.toggleSeat(seat),
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        decoration: BoxDecoration(
                          color: bg,
                          borderRadius: BorderRadius.circular(10),
                          border: border,
                        ),
                        child: Center(
                          child: Text(
                            seat.seatNumber,
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: fg,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            // Bottom bar summary
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: AppColors.surface,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.06),
                    blurRadius: 10,
                    offset: const Offset(0, -2),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Obx(
                    () => Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          '${controller.selectedSeats.length} Seats Selected',
                          style: const TextStyle(
                            fontSize: 12,
                            color: AppColors.textSecondary,
                          ),
                        ),
                        Text(
                          CurrencyFormatter.format(controller.totalPrice),
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: AppColors.primary,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 160,
                    child: RailButton(
                      text: 'Continue',
                      onPressed: controller.proceedToPassengerInfo,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _legendItem(String label, Color color, Color borderColor) {
    return Row(
      children: [
        Container(
          width: 18,
          height: 18,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(4),
            border: Border.all(color: borderColor),
          ),
        ),
        const SizedBox(width: 6),
        Text(
          label,
          style: const TextStyle(fontSize: 12, color: AppColors.textSecondary),
        ),
      ],
    );
  }
}
