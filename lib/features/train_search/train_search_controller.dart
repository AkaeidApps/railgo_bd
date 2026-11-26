import 'package:get/get.dart';

import '../../data/models/station_model.dart';
import '../../data/models/train_model.dart';
import '../../data/repositories/station_repository.dart';
import '../../data/repositories/train_repository.dart';

class TrainSearchController extends GetxController {
  final StationRepository _stationRepo = StationRepository();
  final TrainRepository _trainRepo = TrainRepository();

  final fromStation = Rxn<StationModel>();
  final toStation = Rxn<StationModel>();
  final journeyDate = DateTime.now().add(const Duration(days: 1)).obs;
  final passengerCount = 1.obs;
  final selectedClass = 'Shovon Chair'.obs;
  final selectedCategory = 'All'.obs;

  final searchResults = <TrainModel>[].obs;
  final isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    final stations = _stationRepo.getAllStations();
    if (stations.isNotEmpty) {
      fromStation.value =
          stations.firstWhereOrNull((s) => s.stationCode == 'DAK') ??
          stations.first;
      toStation.value =
          stations.firstWhereOrNull((s) => s.stationCode == 'CXB') ??
          stations.last;
    }
  }

  void performSearch() {
    if (fromStation.value == null || toStation.value == null) return;
    isLoading.value = true;

    final results = _trainRepo.searchTrains(
      originCode: fromStation.value!.stationCode,
      destinationCode: toStation.value!.stationCode,
      category: selectedCategory.value,
      trainClass: selectedClass.value,
    );

    searchResults.value = results;
    isLoading.value = false;
  }
}
