import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/constants/app_colors.dart';
import '../../core/routes/app_routes.dart';
import '../../core/utils/currency_formatter.dart';
import '../../core/widgets/rail_card.dart';
import 'tickets_controller.dart';

class MyTicketsView extends GetView<TicketsController> {
  const MyTicketsView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(TicketsController());
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(title: const Text('My Tickets')),
      body: Obx(
        () => ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: controller.tickets.length,
          itemBuilder: (context, index) {
            final ticket = controller.tickets[index];
            return Container(
              margin: const EdgeInsets.only(bottom: 16),
              child: RailCard(
                onTap: () => Get.toNamed(AppRoutes.eticket, arguments: ticket),
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          ticket.trainNameEn,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: AppColors.textPrimary,
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 2,
                          ),
                          decoration: BoxDecoration(
                            color: ticket.status == 'Upcoming'
                                ? AppColors.lightGreen
                                : Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Text(
                            ticket.status,
                            style: TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.bold,
                              color: ticket.status == 'Upcoming'
                                  ? AppColors.primary
                                  : Colors.grey.shade700,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'PNR: ${ticket.pnr} • Coach: ${ticket.coachName}',
                      style: const TextStyle(
                        fontSize: 12,
                        color: AppColors.textSecondary,
                      ),
                    ),
                    const Divider(height: 20, color: AppColors.divider),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '${ticket.originStationEn} → ${ticket.destinationStationEn}',
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          CurrencyFormatter.format(ticket.totalFare),
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: AppColors.primary,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
