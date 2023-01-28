

import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'event.dart';
import 'state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc([AppState? appState]) : super(appState ?? AppState.defaultState()){
    on<LoadAppData>(_loadAppData);
    on<LoginEvent>(_login);
    on<LogoutEvent>(_logout);
    on<UpdateBacSummary>(_updateBacSummary);
    on<UpdateAuthState>(_updateAuthState);
  }

  FutureOr<void> _loadAppData(LoadAppData event, Emitter<AppState> emit) {

  }

  FutureOr<void> _login(LoginEvent event, Emitter<AppState> emit) {

  }

  FutureOr<void> _logout(LogoutEvent event, Emitter<AppState> emit) {

  }


  FutureOr<void> _updateBacSummary(UpdateBacSummary event, Emitter<AppState> emit) {
    BacSummaryState newBacSummaryState = BacSummaryState.fromBacSummaryResponse(event.response);
    emit(state.copyWith(bacSummaryState: newBacSummaryState));
  }

  FutureOr<void> _updateAuthState(UpdateAuthState event, Emitter<AppState> emit) {
    AuthState newAuthState = AuthState.fromLoginResponse(event.response);
    emit(state.copyWith(authState: newAuthState));
  }
  
}