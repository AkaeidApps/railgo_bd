import '../datasources/bangladesh_stations_data.dart';
import '../models/station_model.dart';

class StationRepository {
  List<StationModel> getAllStations() {
    return BangladeshStationsData.stations;
  }

  List<StationModel> searchStations(String query) {
    if (query.trim().isEmpty) return BangladeshStationsData.stations;
    final q = query.trim().toLowerCase();
    return BangladeshStationsData.stations.where((s) {
      return s.stationNameEn.toLowerCase().contains(q) ||
          s.stationNameBn.contains(q) ||
          s.stationCode.toLowerCase().contains(q) ||
          s.district.toLowerCase().contains(q);
    }).toList();
  }

  StationModel? getStationByCode(String code) {
    try {
      return BangladeshStationsData.stations.firstWhere(
        (s) => s.stationCode.toUpperCase() == code.toUpperCase(),
      );
    } catch (_) {
      return null;
    }
  }
}
