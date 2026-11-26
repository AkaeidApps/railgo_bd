import 'package:get/get.dart';

import '../../data/models/ticket_model.dart';
import '../../data/repositories/booking_repository.dart';

class TicketsController extends GetxController {
  final BookingRepository _bookingRepo = Get.put(BookingRepository());

  final selectedTab = 0.obs;
  final tickets = <TicketModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchTickets();
  }

  void fetchTickets() {
    tickets.value = _bookingRepo.getTickets();
  }
}
