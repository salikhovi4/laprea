import 'package:common/usecase/usecase.dart';
import 'package:service/storage/domain/repository/storage_repository.dart';

class ClearAllStorageUseCase extends UseCase<EmptyUseCaseResult, EmptyUsecaseParams> {
  final List<StorageRepository> _repositories;

  ClearAllStorageUseCase(this._repositories);

  @override
  Future<UseCaseResult<EmptyUseCaseResult>> call(EmptyUsecaseParams params) => innerCall(() async {
        await Future.wait(_repositories.map((e) => e.deleteAll()));
        return const EmptyUseCaseResult();
      });
}
