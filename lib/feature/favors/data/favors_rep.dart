import 'package:laprea/feature/favors/data/favors_api.dart';
import 'package:laprea/feature/favors/data/models/favor_data.dart';
import 'package:laprea/feature/favors/data/models/service_data.dart';

class FavorsRep {
  FavorsRep(this.favorsApi);

  final FavorsApi favorsApi;

  var _favor = <FavorData>[];

  Future<List<FavorData>> fetchFavors() async {
    _favor = await favorsApi.fetchFavors(ownerId: 1013);
    return _favor;
  }

  List<ServiceData> searched(String value) {
    final list = <ServiceData>[];
    for (final e in _favor) {
      for (final s in e.services) {
        if (s.searchValue().contains(value.toLowerCase())) {
          list.add(s);
        }
      }
    }
    return list;
  }
}
