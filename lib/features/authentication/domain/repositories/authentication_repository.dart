import 'package:sahala/features/authentication/data/models/example_request_model.dart';

abstract class AuthenticationRepository {
  Future<dynamic> login(LoginRequestModel body);
}
