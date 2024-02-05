const isTestMode = false;

const postmanApiHeader = "x-api-key";
const postmanApiKey = "PMAK-63d67c24f053b916ff08c1e2-00c535e67254db3d91ed56cf764bd46a37";
const utf8ContentType = "application/json; charset=utf-8";

const postManMockServer =
    "c86732fd-63b3-44e8-af00-6e0e82236525.mock.pstmn.io";
const progressServer = "progres.mesrs.dz";

const host = isTestMode ? postManMockServer : progressServer;

const contentTypeHeader = "Content-Type";

const bacYearToken = "{bacYear}";
const usernameToken = "{username}";
const studentIdToken = "{studentId}";
const academicYearIdToken = "{academicYearId}";
const formationOffreToken = "{formationOffre}";
const studyLevelToken = "{studyLevel}";
const bacIdToken = "{bacId}";

enum Apis {
  allSessions,
  examsSchedule,
  dias,
  currentAcademiqueYearCycles,
  sectionAndGroups,
  currentAcademiqueYear,
  examsResults,
  authenticate,
  profile,
  bacResults
}

abstract class Api {
  String get url;
}

class AllSessionsApi implements Api {
  @override
  String get url =>
      "api/infos/bac/$bacYearToken/$usernameToken/bilans";
}

class ExamsScheduleApi implements Api {
  @override
  String get url =>
      "api/infos/offreFormation/$formationOffreToken/niveau/$studentIdToken/planningExamens";
}

class StudentCardApi implements Api {
  @override
  String get url =>
      "api/infos/bac/$bacYearToken/$bacIdToken/dias";
}

class AcademiqueYearCyclesApi implements Api {
  @override
  String get url => "api/infos/niveau/$studyLevelToken/periode";
}

class SectionsAndGroupsApi implements Api {
  @override
  String get url => "api/infos/dia/$studentIdToken/groups";
}

class CurrentAcademiqueYearApi implements Api {
  @override
  String get url =>
      "api/etudiant/$bacYearToken/$usernameToken/annee";
}

class ExamsResultsApi implements Api {
  @override
  String get url =>
      "api/infos/planningSession/dia/$studentIdToken/noteExamens";
}

class AuthenticateApi implements Api {
  @override
  String get url => "api/authentication/v1/";
}

class ExamsNotesApi implements Api {
  @override
  String get url =>
      "api/infos/planningSession/dia/$studentIdToken/noteExamens";
}

class ExamsSessionApi implements Api {
  @override
  String get url =>
      "api/etudiant/$bacYearToken/$usernameToken/profile";
}

class CurrentAcademicYearApi implements Api {
  @override
  String get url =>
      "api/etudiant/$bacYearToken/$usernameToken/bac";
}

class BacSummaryApi implements Api {
  @override
  String get url =>
      "api/infos/bac/$bacYearToken/$usernameToken";
}

class BacNotesApi implements Api {
  @override
  String get url =>
      "api/infos/bac/$bacYearToken/$usernameToken/notes";
}
