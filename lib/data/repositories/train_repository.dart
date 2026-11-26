import '../datasources/bangladesh_trains_data.dart';
import '../models/train_model.dart';

class TrainRepository {
  List<TrainModel> getAllTrains() {
    return BangladeshTrainsData.trains;
  }

  List<TrainModel> searchTrains({
    required String originCode,
    required String destinationCode,
    String? category,
    String? trainClass,
  }) {
    return BangladeshTrainsData.trains.where((train) {
      final matchesRoute =
          (train.originStationCode.toUpperCase() == originCode.toUpperCase() &&
              train.destinationStationCode.toUpperCase() ==
                  destinationCode.toUpperCase()) ||
          train.routeStoppages.any(
                (s) => s.stationCode.toUpperCase() == originCode.toUpperCase(),
              ) &&
              train.routeStoppages.any(
                (s) =>
                    s.stationCode.toUpperCase() ==
                    destinationCode.toUpperCase(),
              );

      if (!matchesRoute) return false;

      if (category != null && category.isNotEmpty && category != 'All') {
        if (train.category.toLowerCase() != category.toLowerCase())
          return false;
      }

      if (trainClass != null && trainClass.isNotEmpty && trainClass != 'All') {
        if (!train.availableClasses.contains(trainClass)) return false;
      }

      return true;
    }).toList();
  }

  TrainModel? getTrainById(String trainId) {
    try {
      return BangladeshTrainsData.trains.firstWhere(
        (t) => t.trainId == trainId,
      );
    } catch (_) {
      return null;
    }
  }

  List<TrainModel> getPopularTrains() {
    return BangladeshTrainsData.trains.take(4).toList();
  }
}
