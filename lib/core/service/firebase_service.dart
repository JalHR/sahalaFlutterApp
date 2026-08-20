import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FirebaseService {
  static Future<void> fetchFirebaseToken() async {
    try {
      final messaging = FirebaseMessaging.instance;

      // iOS requires permission
      await messaging.requestPermission();

      final token = await messaging.getToken();

      if (token != null) {
        print('Device Token: $token');

        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('deviceToken', token);
      }
    } catch (e) {
      print('Error fetching FCM token: $e');
    }
  }
}
