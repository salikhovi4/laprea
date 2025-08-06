import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:laprea/dio/dio_client.dart';
import 'package:laprea/feature/favors/data/favors_rep.dart';
import 'package:laprea/feature/favors/data/models/favor_data.dart';
import 'package:laprea/feature/favors/data/models/service_data.dart';

part 'favors_state.dart';

part 'favors_cubit.freezed.dart';

class FavorsCubit extends Cubit<FavorsState> {
  FavorsCubit(this.favorsRep) : super(const FavorsState());

  final FavorsRep favorsRep;

  Future<void> fetchFavors() async {
    try {
      emit(state.copyWith(favorsStatus: FavorsStatus.loading));
      emit(
        state.copyWith(
          favorsStatus: FavorsStatus.success,
          favors: await favorsRep.fetchFavors(),
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          favorsStatus: FavorsStatus.failure,
          exception:
              e is ClientException
                  ? e
                  : ClientException(errorText: e.toString()),
        ),
      );
    }
  }

  void searched(String value) =>
      emit(state.copyWith(searched: favorsRep.searched(value)));
}
