import '../models/ticket_model.dart';

class BookingRepository {
  final List<TicketModel> _tickets = [
    TicketModel(
      ticketId: 'tck_88921',
      pnr: 'BR88921932',
      trainNumber: '813',
      trainNameEn: 'Cox\'s Bazar Express',
      trainNameBn: 'কক্সবাজার এক্সপ্রেস',
      originStationEn: 'Dhaka Kamalapur',
      originStationBn: 'ঢাকা কমলাপুর',
      destinationStationEn: 'Cox\'s Bazar',
      destinationStationBn: 'কক্সবাজার',
      journeyDate: '2025-04-15',
      departureTime: '22:30',
      arrivalTime: '06:40',
      trainClass: 'Snigdha',
      coachName: 'KHA',
      seats: ['KHA-12', 'KHA-13'],
      totalFare: 2650.0,
      passengerName: 'MD. TANVIR HOSSAIN',
      passengerPhone: '+8801700000000',
      passengerNid: '19952691234567891',
      status: 'Upcoming',
      bookingTime: '2025-04-01 10:20 AM',
      qrCodeData: 'RAILGO-BD-PNR-BR88921932-SEATS-KHA12-KHA13',
    ),
    TicketModel(
      ticketId: 'tck_77102',
      pnr: 'BR77102811',
      trainNumber: '701',
      trainNameEn: 'Suborno Express',
      trainNameBn: 'সুবর্ণ এক্সপ্রেস',
      originStationEn: 'Chattogram Central',
      originStationBn: 'চট্টগ্রাম সেন্ট্রাল',
      destinationStationEn: 'Dhaka Kamalapur',
      destinationStationBn: 'ঢাকা কমলাপুর',
      journeyDate: '2025-02-10',
      departureTime: '07:00',
      arrivalTime: '12:15',
      trainClass: 'Shovon Chair',
      coachName: 'GA',
      seats: ['GA-44'],
      totalFare: 420.0,
      passengerName: 'MD. TANVIR HOSSAIN',
      passengerPhone: '+8801700000000',
      passengerNid: '19952691234567891',
      status: 'Completed',
      bookingTime: '2025-02-05 08:15 AM',
      qrCodeData: 'RAILGO-BD-PNR-BR77102811-SEATS-GA44',
    ),
  ];

  List<TicketModel> getTickets() => _tickets;

  List<TicketModel> getTicketsByStatus(String status) {
    if (status == 'All') return _tickets;
    return _tickets
        .where((t) => t.status.toLowerCase() == status.toLowerCase())
        .toList();
  }

  void addTicket(TicketModel ticket) {
    _tickets.insert(0, ticket);
  }
}
