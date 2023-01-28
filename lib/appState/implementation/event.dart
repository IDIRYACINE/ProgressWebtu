

import 'package:progresswebtu/core/api/feature.dart';

class AppEvent {}

class LoadAppData extends AppEvent {}

class LoginEvent extends AppEvent {
  final String username;
  final String password;

  LoginEvent({required this.username, required this.password});
}

class LogoutEvent extends AppEvent {}

class UpdateBacSummary extends AppEvent {
  final BacSummary response;

  UpdateBacSummary(this.response);
}

class UpdateAuthState extends AppEvent{
  final LoginResponse response;

  UpdateAuthState(this.response);
}