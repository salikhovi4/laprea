part of 'favors_cubit.dart';

enum FavorsStatus {
  init,
  loading,
  success,
  failure;

  bool isLoading() => this == loading;

  bool isSuccess() => this == success;

  bool isFailure() => this == failure;
}

@freezed
class FavorsState with _$FavorsState {
  const FavorsState({
    this.favorsStatus = FavorsStatus.init,
    this.exception,
    this.favors = const <FavorData>[],
    this.searched = const <ServiceData>[],
  });

  @override
  final FavorsStatus favorsStatus;
  @override
  final ClientException? exception;
  @override
  final List<FavorData> favors;
  @override
  final List<ServiceData> searched;
}
