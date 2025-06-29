import 'package:common/usecase/usecase.dart';
import 'package:service/device_info/device_info.dart';
import 'package:service/device_info/domain/entity/device_uuid.dart';

/// Usecase возвращает уникальный id в формате uuid.v4. Если id еще не был сгенерирован происходит его генерация и сохранение,
final class GetDeviceUuidUseCase extends UseCase<DeviceUuid, EmptyUsecaseParams> {
  final DeviceInfoRepository repository;

  GetDeviceUuidUseCase(this.repository);

  @override
  Future<UseCaseResult<DeviceUuid>> call(EmptyUsecaseParams params) => innerCall(() async {
        final deviceUuid = await repository.getDeviceUuid();
        if (deviceUuid == null) {
          final generatedUuid = repository.generateDeviceUuid();
          await repository.saveDeviceUuid(generatedUuid);
          return generatedUuid;
        } else {
          return deviceUuid;
        }
      });
}
