

import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'event.dart';
import 'state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc([AppState? appState]) : super(appState ?? AppState.defaultState()){
    on<UpdateBacSummary>(_updateBacSummary);
    on<UpdateSections>(_updateSections);
    on<UpdateAuthState>(_updateAuthState);
    on<UpdateExamNotes>(_updateExamNotes);
    on<UpdateStudentCard>(_updateStudentCard);
    on<UpdateExamSessions>(_updateExamSessions);
  }



  FutureOr<void> _updateBacSummary(UpdateBacSummary event, Emitter<AppState> emit) {
    BacSummaryState newBacSummaryState = BacSummaryState.fromBacSummaryResponse(event.response);
    emit(state.copyWith(bacSummaryState: newBacSummaryState));
  }

  FutureOr<void> _updateAuthState(UpdateAuthState event, Emitter<AppState> emit) {
    AuthState newAuthState = AuthState.fromLoginResponse(event.response);
    emit(state.copyWith(authState: newAuthState));
  }
  

  FutureOr<void> _updateSections(UpdateSections event, Emitter<AppState> emit) {
    SectionState newSectionState = SectionState.fromSectionResponse(event.response);
    emit(state.copyWith(sectionsState: newSectionState));
  }

  FutureOr<void> _updateStudentCard(UpdateStudentCard event, Emitter<AppState> emit) {
    StudentCardState newStudentCardState = StudentCardState.fromStudentCardResponse(event.response);
    emit(state.copyWith(studentCardState: newStudentCardState));
  }

  FutureOr<void> _updateExamNotes(UpdateExamNotes event, Emitter<AppState> emit) {
    ExamsNotesState newExamNotesState = ExamsNotesState.fromApi(event.response);
    emit(state.copyWith(examNotesState: newExamNotesState));
  }

  FutureOr<void> _updateExamSessions(UpdateExamSessions event, Emitter<AppState> emit) {
    ExamsSessionsState newExamSessionsState = ExamsSessionsState.fromApi(event.response);
    emit(state.copyWith(examSessionsState: newExamSessionsState));
  }
}