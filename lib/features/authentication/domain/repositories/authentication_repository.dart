import 'package:sahala/features/authentication/data/models/login_request_model.dart';

abstract class AuthenticationRepository {
  Future<dynamic> login(LoginRequestModel body);
}
