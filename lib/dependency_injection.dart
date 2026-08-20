import 'package:get_it/get_it.dart';
import 'package:sahala/features/authentication/data/repositories/authentication_repository_impl.dart';
import 'package:sahala/features/authentication/domain/repositories/authentication_repository.dart';
import 'package:sahala/features/authentication/domain/use_cases/login_use_case.dart';
import 'package:sahala/features/example/data/repositories/example_repository_impl.dart';
import 'package:sahala/features/example/domain/repositories/example_repository.dart';

final sl = GetIt.instance;

void setup() {
  sl.registerLazySingleton<ExampleRepository>(() => ExampleRepositoryImpl());
  sl.registerLazySingleton<AuthenticationRepository>(
    () => AuthenticationRepositoryImpl(),
  );

  sl.registerLazySingleton<LoginUseCase>(
    () => LoginUseCase(sl<AuthenticationRepository>()),
  );
}
