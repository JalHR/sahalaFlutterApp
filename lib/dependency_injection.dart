import 'package:get_it/get_it.dart';
import 'package:sahala/features/example/data/repositories/example_repository_impl.dart';
import 'package:sahala/features/example/domain/repositories/example_repository.dart';

final sl = GetIt.instance;

void setup() {
  sl.registerLazySingleton<ExampleRepository>(() => ExampleRepositoryImpl());
}
