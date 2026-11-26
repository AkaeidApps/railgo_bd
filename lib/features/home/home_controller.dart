import 'package:get/get.dart';

import '../../core/routes/app_routes.dart';
import '../../data/models/station_model.dart';
import '../../data/repositories/station_repository.dart';
import '../train_search/train_search_controller.dart';

class HomeController extends GetxController {
  final StationRepository _stationRepo = StationRepository();

  final fromStation = Rxn<StationModel>();
  final toStation = Rxn<StationModel>();
  final journeyDate = DateTime.now().add(const Duration(days: 1)).obs;
  final passengerCount = 1.obs;
  final selectedClass = 'Shovon Chair'.obs;

  List<StationModel> allStations = [];

  @override
  void onInit() {
    super.onInit();
    allStations = _stationRepo.getAllStations();
    if (allStations.isNotEmpty) {
      fromStation.value =
          allStations.firstWhereOrNull((s) => s.stationCode == 'DAK') ??
          allStations.first;
      toStation.value =
          allStations.firstWhereOrNull((s) => s.stationCode == 'CXB') ??
          allStations.last;
    }
  }

  void swapStations() {
    final temp = fromStation.value;
    fromStation.value = toStation.value;
    toStation.value = temp;
  }

  void searchTrains() {
    if (fromStation.value == null || toStation.value == null) {
      Get.snackbar(
        'Station Required',
        'Please select origin and destination stations',
      );
      return;
    }

    final searchController = Get.put(TrainSearchController());
    searchController.fromStation.value = fromStation.value;
    searchController.toStation.value = toStation.value;
    searchController.journeyDate.value = journeyDate.value;
    searchController.selectedClass.value = selectedClass.value;
    searchController.passengerCount.value = passengerCount.value;

    searchController.performSearch();
    Get.toNamed(AppRoutes.searchResults);
  }

  void selectPopularRoute(String fromCode, String toCode) {
    fromStation.value = _stationRepo.getStationByCode(fromCode);
    toStation.value = _stationRepo.getStationByCode(toCode);
    searchTrains();
  }
}
