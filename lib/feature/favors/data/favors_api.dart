import 'package:laprea/dio/dio_client.dart';
import 'package:laprea/feature/favors/data/models/favor_data.dart';

class FavorsApi {
  FavorsApi(this.network);

  final DioClient network;

  Future<List<FavorData>> fetchFavors({
    required int ownerId,
    double? employeeId,
    int? maxDurationTime,
  }) async {
    final result = await network.get<Map<String, dynamic>>(
      path: 'BookingWidget/GetServices',
      queryParameters: {
        'ownerId': ownerId,
        if (employeeId != null) 'employeeId': employeeId,
        if (maxDurationTime != null) 'maxDurationTime': maxDurationTime,
      },
    );
    return (result['Data'] as List<dynamic>)
        .map((e) => FavorData.fromJson(e))
        .toList();
  }
}
