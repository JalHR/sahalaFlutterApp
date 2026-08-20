import 'package:sahala/features/example/data/models/example_request_model.dart';
import 'package:sahala/features/example/domain/repositories/example_repository.dart';

class ExampleUseCase {
  final ExampleRepository repository;

  ExampleUseCase({required this.repository});

  Future<dynamic> execute(ExampleRequestModel body) async {
    return await repository.example(body);
  }
}
