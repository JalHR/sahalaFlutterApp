import 'package:sahala/features/example/data/models/example_request_model.dart';
import 'package:sahala/features/example/domain/entities/example_entity.dart';
import 'package:sahala/features/example/domain/repositories/example_repository.dart';

class ExampleUseCase {
  final ExampleRepository repository;

  ExampleUseCase({required this.repository});

  Future<ExampleEntity> execute(ExampleRequestModel body) async {
    return await repository.example(body);
  }
}
