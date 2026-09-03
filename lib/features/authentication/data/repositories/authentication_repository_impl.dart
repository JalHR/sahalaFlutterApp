import 'package:dio/dio.dart';
import 'package:sahala/core/api/api_client.dart';
import 'package:sahala/features/authentication/data/models/login_request_model.dart';
import 'package:sahala/features/authentication/domain/repositories/authentication_repository.dart';

class AuthenticationRepositoryImpl implements AuthenticationRepository {
  final ApiClient apiClient = ApiClient();
  @override
  Future<dynamic> login(LoginRequestModel body) async {
    try {
      final response = await apiClient.dio.post(
        'user/loginRegister',
        data: body.toJson(),
      );
      return response;
    } on DioException catch (e) {
      throw Exception(e.response?.data ?? e.message);
    }
  }
}
