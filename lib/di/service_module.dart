import 'package:common/di/get_it.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:get_it/get_it.dart';
import 'package:service/device_info/data/data_source/local_data_source.dart';
import 'package:service/device_info/data/repository/device_info_repository_impl.dart';
import 'package:service/device_info/domain/repository/device_info_repository.dart';
import 'package:service/device_info/domain/use_case/get_device_info_use_case.dart';
import 'package:service/device_info/domain/use_case/get_device_uuid.dart';
import 'package:service/service_flutter.dart';

class ServiceDIModule extends BaseDIModule {
  @override
  void updateInjections(GetIt instance) {
    //Region DataSources
    instance.registerLazySingleton<DeviceInfoLocalDataSource>(
      () => DeviceInfoLocalDataSourceImpl(persistentStorageInteractor: getIt()),
    );
    //End region
    //Region Repository
    instance.registerFactory<DeviceInfoRepository>(
      () => DeviceInfoRepositoryImpl(plugin: DeviceInfoPlugin(), localDataSource: getIt()),
    );
    instance.registerFactory<StorageRepository>(() => StorageRepositoryImpl());
    //End region

    //Region UseCases
    instance.registerLazySingleton(() => StorageInteractor(getIt()));
    instance.registerFactory(() => GetDeviceInfoUseCase(getIt()));
    instance.registerFactory(() => GetDeviceUuidUseCase(getIt()));
    instance.registerFactory(() => ClearAllStorageUseCase([SecureStorageRepositoryImpl(), StorageRepositoryImpl()]));
    //End region
  }
}
