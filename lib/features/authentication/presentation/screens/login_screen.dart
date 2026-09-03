import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sahala/core/routing/app_routes.dart';
import 'package:sahala/core/widgets/background.dart';
import 'package:sahala/features/authentication/presentation/providers/login_provider.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  // final TextEditingController phoneController = TextEditingController();

  @override
  void dispose() {
    // phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final loginNotifier = ref.read(loginProvider.notifier);
    final loginState = ref.watch(loginProvider);

    ref.listen<LoginState>(loginProvider, (previous, next) {
      if (next.loginSuccess && previous?.loginSuccess != true) {
        Navigator.pushNamed(
          context,
          AppRoutes.otp,
          arguments: loginNotifier.phoneController.text,
        );
      }
    });

    return AppBackground(
      child: Padding(
        padding: EdgeInsets.all(24.0),
        child: Container(
          padding: EdgeInsets.all(16),
          width: double.infinity,
          height: 275,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            borderRadius: BorderRadius.all(Radius.circular(30.0)),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Welcome to Sahala',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Image.asset('assets/icons/splash.png', width: 50, height: 50),
                ],
              ),
              const SizedBox(height: 28),
              TextField(
                keyboardType: TextInputType.phone,
                controller: loginNotifier.phoneController,
                onChanged: (_) => setState(() {}),
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  LengthLimitingTextInputFormatter(9),
                ],
                decoration: const InputDecoration(
                  hintText: 'Enter mobile number',
                  prefixText: '+966 ',
                ),
              ),
              SizedBox(height: 24),

              OutlinedButton(
                onPressed: loginNotifier.isPhoneValid && !loginState.isLoading
                    ? loginNotifier.login
                    : null,
                child: loginState.isLoading
                    ? const SizedBox(
                        width: 24,
                        height: 24,
                        child: CircularProgressIndicator(strokeWidth: 2.5),
                      )
                    : const Text('Continue'),
              ),
              SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
