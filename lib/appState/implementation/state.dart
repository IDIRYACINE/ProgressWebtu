import 'package:progresswebtu/core/api/feature.dart';

import '../models/models.dart';

enum StateStatus { loading, ready }

class AppState {
  const AppState({
    required this.examNotes,
    required this.sectionsState,
    required this.authState,
    required this.bacSummaryState,
    required this.studentCardState,
  });

  final AuthState authState;
  final BacSummaryState bacSummaryState;
  final SectionState sectionsState;
  final ExamsNotesState examNotes;
  final StudentCardState studentCardState;

  AppState copyWith(
      {AuthState? authState,
      BacSummaryState? bacSummaryState,
      SectionState? sectionsState,
      StudentCardState? studentCardState,
      ExamsNotesState? examNotes}) {
    return AppState(
      bacSummaryState: bacSummaryState ?? this.bacSummaryState,
      authState: authState ?? this.authState,
      sectionsState: sectionsState ?? this.sectionsState,
      examNotes: examNotes ?? this.examNotes,
      studentCardState: studentCardState ?? this.studentCardState,
    );
  }

  factory AppState.defaultState() {
    return AppState(
      authState: AuthState.defaultState(),
      bacSummaryState: BacSummaryState.defaultState(),
      sectionsState: SectionState.defaultState(),
      examNotes: ExamsNotesState.defaultState(),
      studentCardState: StudentCardState.defaultState(),
    );
  }
}

class StudentCardState {
  final StateStatus stateStatus;

  final List<StudentCardModel> studentCardSections;

  StudentCardState(this.stateStatus, this.studentCardSections);

  factory StudentCardState.defaultState() {
    return StudentCardState(StateStatus.loading, []);
  }

  factory StudentCardState.fromStudentCardResponse(
      List<StudentCardSection> response) {
    final studentCardSections =
        response.map((e) => StudentCardModel.fromApiResponse(e)).toList();

    return StudentCardState(
      StateStatus.ready,
      studentCardSections,
    );
  }
}

class ExamsNotesState {
  final StateStatus stateStatus;
  final List<ExamsNoteModel> examResults;

  ExamsNotesState(this.stateStatus, this.examResults);

  factory ExamsNotesState.defaultState() {
    return ExamsNotesState(StateStatus.loading, []);
  }

  factory ExamsNotesState.fromApi(List<ExamNote> response) {
    final examResults =
        response.map((e) => ExamsNoteModel.fromApiResponse(e)).toList();

    return ExamsNotesState(
      StateStatus.ready,
      examResults,
    );
  }
}

class SectionState {
  final StateStatus stateStatus;
  final List<SectionModel> sections;

  SectionState({required this.stateStatus, required this.sections});

  SectionState copyWith(
      {StateStatus? stateStatus, List<SectionModel>? sections}) {
    return SectionState(
      stateStatus: stateStatus ?? this.stateStatus,
      sections: sections ?? this.sections,
    );
  }

  factory SectionState.defaultState() {
    return SectionState(
      stateStatus: StateStatus.loading,
      sections: [],
    );
  }

  factory SectionState.fromSectionResponse(List<Section> response) {
    final sections =
        response.map((e) => SectionModel.fromSectionApi(e)).toList();

    return SectionState(
      stateStatus: StateStatus.ready,
      sections: sections,
    );
  }
}

class AuthState {
  final int etablissementId;
  final String expirationDate;
  final int idIndividu;
  final String token;
  final int userId;
  final String userName;
  final StateStatus stateStatus;

  AuthState(
      {required this.etablissementId,
      required this.expirationDate,
      required this.idIndividu,
      required this.token,
      required this.userId,
      required this.stateStatus,
      required this.userName});

  factory AuthState.fromLoginResponse(LoginResponse response) {
    return AuthState(
        stateStatus: StateStatus.ready,
        etablissementId: response.etablissementId,
        expirationDate: response.expirationDate,
        idIndividu: response.idIndividu,
        token: response.token,
        userId: response.userId,
        userName: response.userName);
  }

  factory AuthState.defaultState() {
    return AuthState(
        stateStatus: StateStatus.loading,
        etablissementId: 0,
        expirationDate: "",
        idIndividu: 0,
        token: "",
        userId: 0,
        userName: "");
  }

  AuthState copyWith({
    int? etablissementId,
    String? expirationDate,
    int? idIndividu,
    String? token,
    int? userId,
    String? userName,
    StateStatus? stateStatus,
  }) {
    return AuthState(
      etablissementId: etablissementId ?? this.etablissementId,
      expirationDate: expirationDate ?? this.expirationDate,
      idIndividu: idIndividu ?? this.idIndividu,
      token: token ?? this.token,
      userId: userId ?? this.userId,
      userName: userName ?? this.userName,
      stateStatus: stateStatus ?? this.stateStatus,
    );
  }
}

class BacSummaryState {
  final String anneeBac;
  final String dateNaissance;
  final int id;
  final String libelleSerieBac;
  final String matricule;
  final String moyenneBac;
  final double moyenneGeneraleBac;
  final String nin;
  final String nomAr;
  final String nomFr;
  final String prenomAr;
  final String prenomFr;
  final String refCodeSerieBac;
  final String refCodeWilayaBac;
  final StateStatus stateStatus;

  BacSummaryState({
    required this.stateStatus,
    required this.anneeBac,
    required this.dateNaissance,
    required this.id,
    required this.libelleSerieBac,
    required this.matricule,
    required this.moyenneBac,
    required this.moyenneGeneraleBac,
    required this.nin,
    required this.nomAr,
    required this.nomFr,
    required this.prenomAr,
    required this.prenomFr,
    required this.refCodeSerieBac,
    required this.refCodeWilayaBac,
  });

  factory BacSummaryState.defaultState() {
    return BacSummaryState(
        anneeBac: '',
        dateNaissance: '',
        id: 0,
        libelleSerieBac: '',
        matricule: '',
        moyenneBac: '',
        moyenneGeneraleBac: 0,
        nin: '',
        nomAr: '',
        nomFr: '',
        prenomAr: '',
        prenomFr: '',
        refCodeSerieBac: '',
        refCodeWilayaBac: '',
        stateStatus: StateStatus.loading);
  }

  factory BacSummaryState.fromBacSummaryResponse(BacSummary response) {
    return BacSummaryState(
        stateStatus: StateStatus.ready,
        anneeBac: response.anneeBac,
        dateNaissance: response.dateNaissance,
        id: response.id,
        libelleSerieBac: response.libelleSerieBac,
        matricule: response.matricule,
        moyenneBac: response.moyenneBac,
        moyenneGeneraleBac: response.moyenneGeneraleBac,
        nin: response.nin,
        nomAr: response.nomAr,
        nomFr: response.nomFr,
        prenomAr: response.prenomAr,
        prenomFr: response.prenomFr,
        refCodeSerieBac: response.refCodeSerieBac,
        refCodeWilayaBac: response.refCodeWilayaBac);
  }
  BacSummaryState copyWith({
    String? anneeBac,
    String? dateNaissance,
    int? id,
    String? libelleSerieBac,
    String? matricule,
    String? moyenneBac,
    double? moyenneGeneraleBac,
    String? nin,
    String? nomAr,
    String? nomFr,
    String? prenomAr,
    String? prenomFr,
    String? refCodeSerieBac,
    String? refCodeWilayaBac,
    StateStatus? stateStatus,
  }) {
    return BacSummaryState(
      anneeBac: anneeBac ?? this.anneeBac,
      dateNaissance: dateNaissance ?? this.dateNaissance,
      id: id ?? this.id,
      libelleSerieBac: libelleSerieBac ?? this.libelleSerieBac,
      matricule: matricule ?? this.matricule,
      moyenneBac: moyenneBac ?? this.moyenneBac,
      moyenneGeneraleBac: moyenneGeneraleBac ?? this.moyenneGeneraleBac,
      nin: nin ?? this.nin,
      nomAr: nomAr ?? this.nomAr,
      nomFr: nomFr ?? this.nomFr,
      prenomAr: prenomAr ?? this.prenomAr,
      prenomFr: prenomFr ?? this.prenomFr,
      refCodeSerieBac: refCodeSerieBac ?? this.refCodeSerieBac,
      refCodeWilayaBac: refCodeWilayaBac ?? this.refCodeWilayaBac,
      stateStatus: stateStatus ?? this.stateStatus,
    );
  }
}
