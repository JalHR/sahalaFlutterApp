import 'dart:async';
import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'dart:developer' as developer;

class FirebaseMessagingService {
  final FirebaseMessaging _messaging = FirebaseMessaging.instance;
  StreamSubscription<String>? _tokenRefreshSubscription;
  Future<void> initialize() async {
    if (Platform.isIOS) {
      await _requestPermission();
    }

    final token = await _messaging.getToken();

    developer.log('FCM Token: $token');
    _listenToTokenRefresh();
  }

  Future<void> _requestPermission() async {
    final settings = await _messaging.requestPermission(
      alert: true,
      badge: true,
      sound: true,
    );

    developer.log(
      'Notification permission: '
      '${settings.authorizationStatus}',
    );
  }

  void _listenToTokenRefresh() {
    _tokenRefreshSubscription?.cancel();

    _tokenRefreshSubscription = _messaging.onTokenRefresh.listen((newToken) {
      developer.log('FCM Token refreshed: $newToken');
    });
  }

  Future<String?> getToken() async {
    return await _messaging.getToken();
  }

  Future<void> dispose() async {
    await _tokenRefreshSubscription?.cancel();
    _tokenRefreshSubscription = null;
  }
}
