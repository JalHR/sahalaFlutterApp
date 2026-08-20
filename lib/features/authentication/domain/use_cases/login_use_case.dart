import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:sahala/features/authentication/data/models/example_request_model.dart';
import 'package:sahala/features/authentication/domain/repositories/authentication_repository.dart';
import 'dart:io';

class LoginUseCase {
  final AuthenticationRepository repository;

  LoginUseCase(this.repository);

  Future<dynamic> call(String phoneNumber) async {
    final int deviceType = Platform.isIOS ? 1 : 0;
    String? deviceToken;
    if (Platform.isIOS) {
      deviceToken = await FirebaseMessaging.instance.getAPNSToken();

      if (deviceToken != null) {
        deviceToken = await FirebaseMessaging.instance.getToken();
      }
    } else {
      deviceToken = await FirebaseMessaging.instance.getToken();
    }

    final body = LoginRequestModel(
      phoneNumber: phoneNumber,
      deviceType: deviceType,
      latitude: 0.0,
      longitude: 0.0,
      deviceToken: deviceToken,
    );

    print(body);

    return await repository.login(body);
  }
}
