class LoginRequestModel {
  final String phoneNumber;
  final int deviceType;
  final double latitude;
  final double longitude;
  final String? deviceToken;
  LoginRequestModel({
    required this.phoneNumber,
    required this.deviceType,
    required this.latitude,
    required this.longitude,
    required this.deviceToken,
  });

  Map<String, dynamic> toJson() {
    return {
      'mobile_number': phoneNumber,
      'device_type': deviceType,
      'latitude': latitude,
      'longitude': longitude,
      'device_token': deviceToken,
    };
  }
}
