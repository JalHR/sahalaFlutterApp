import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sahala/dependency_injection.dart';
import 'package:sahala/features/authentication/domain/use_cases/login_use_case.dart';

final loginProvider = NotifierProvider(LoginNotifer.new);

class LoginState {
  final bool isLoading;

  const LoginState({this.isLoading = false});

  LoginState copyWith({bool? isLoading}) {
    return LoginState(isLoading: isLoading ?? this.isLoading);
  }
}

class LoginNotifer extends Notifier<LoginState> {
  late final LoginUseCase _loginUseCase;
  final phoneController = TextEditingController();
  @override
  LoginState build() {
    _loginUseCase = sl<LoginUseCase>();

    ref.onDispose(() {
      phoneController.dispose();
    });

    return const LoginState();
  }

  bool get isPhoneValid => phoneController.text.length == 9;

  void onPhoneChanged(String value) {
    state = state.copyWith();
  }

  Future<void> login() async {
    if (!isPhoneValid || state.isLoading) return;
    state = state.copyWith(isLoading: true);

    try {
      await _loginUseCase(phoneController.text);
    } finally {
      state = state.copyWith(isLoading: false);
    }
  }
}
