import 'package:flutter/material.dart';
import 'package:sahala/core/widgets/background.dart';
import 'package:sahala/core/widgets/countdown_timer.dart';
import 'package:sahala/core/widgets/otp_input.dart';

class OTPScreen extends StatefulWidget {
  const OTPScreen({super.key});

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context)?.settings.arguments;
    debugPrint('OTP arguments: $arguments');
    final phoneNumber =
        ModalRoute.of(context)!.settings.arguments as String? ?? "";
    return AppBackground(
      child: Padding(
        padding: EdgeInsets.all(24.0),

        child: Container(
          padding: EdgeInsets.all(30),
          width: double.infinity,
          height: 330,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            borderRadius: BorderRadius.all(Radius.circular(30.0)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            spacing: 10,
            children: [
              const Text(
                'Verify Mobile Number',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              Row(
                spacing: 5,
                children: [
                  Text(
                    'A 4-digit code sent to',
                    style: TextStyle(color: const Color(0xFFDEDEDE)),
                  ),
                  Text(
                    '+966 $phoneNumber',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ],
              ),

              const Text('Enter code here', style: TextStyle(fontSize: 16)),

              OtpInput(
                length: 4,
                onCompleted: (value) {
                  debugPrint(value);
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 5,
                children: [
                  Text(
                    "Haven’t received?",
                    style: TextStyle(color: const Color(0xFFDEDEDE)),
                  ),
                  CountdownTimer(duration: const Duration(seconds: 36)),
                ],
              ),
              OutlinedButton(onPressed: () {}, child: Text("Continue")),
            ],
          ),
        ),
      ),
    );
  }
}
