import 'package:dev_practice/core/cache/shared_pref_helper.dart';
import 'package:dev_practice/core/network/api_consumer.dart';
import 'package:dev_practice/core/network/dio_consumer.dart';
import 'package:dev_practice/core/network/dio_factory.dart';
import 'package:dev_practice/features/profile/data/repository/profile_repo.dart';
import 'package:dev_practice/features/sign_in/data/repository/sign_in_repo.dart';
import 'package:dev_practice/features/sign_up/data/repository/sing_up_repo.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerLazySingleton<ApiConsumer>(
    () => DioConsumer(dio: DioFactory.getDio()),
  );

  getIt.registerLazySingleton<SignInRepo>(
      () => SignInRepo(apiConsumer: getIt<ApiConsumer>()));

  getIt.registerLazySingleton<SharedPrefHelper>(
    () => SharedPrefHelper(),
  );

  getIt.registerLazySingleton<ProfileRepo>(
    () => ProfileRepo(getIt<ApiConsumer>()),
  );

  getIt.registerLazySingleton<SingUpRepo>(
    () => SingUpRepo(getIt<ApiConsumer>()),
  );
}
