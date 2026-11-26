import 'package:get/get.dart';

import '../../data/models/station_model.dart';
import '../../data/repositories/station_repository.dart';

class StationController extends GetxController {
  final StationRepository _stationRepo = StationRepository();

  final stations = <StationModel>[].obs;
  final searchQuery = ''.obs;

  @override
  void onInit() {
    super.onInit();
    stations.value = _stationRepo.getAllStations();
  }

  void searchStations(String query) {
    searchQuery.value = query;
    stations.value = _stationRepo.searchStations(query);
  }
}
