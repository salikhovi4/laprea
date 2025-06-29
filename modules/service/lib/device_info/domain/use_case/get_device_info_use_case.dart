import 'package:common/usecase/usecase.dart';
import 'package:service/device_info/domain/entity/common_device_info.dart';
import 'package:service/device_info/domain/repository/device_info_repository.dart';

class GetDeviceInfoUseCase extends UseCase<DeviceInfoCommon, EmptyUsecaseParams> {
  final DeviceInfoRepository repository;

  GetDeviceInfoUseCase(this.repository);

  @override
  Future<UseCaseResult<DeviceInfoCommon>> call(EmptyUsecaseParams params) =>
      innerCall(() => repository.getDeviceInfo());
}
