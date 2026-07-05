import 'package:sahala/features/example/domain/repositories/example_repository.dart';

class ExampleRepositoryImpl implements ExampleRepository {
  @override
  Future<dynamic> example(body) {
    try {
      return Future.value({'message': 'success'});
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
