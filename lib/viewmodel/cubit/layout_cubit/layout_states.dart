abstract class LayoutStates{}
class LayoutInitialState extends LayoutStates{}
class ChangeIndexState extends LayoutStates{}

//sessions

class GetSessionsLoadingState extends LayoutStates {}
class GetSessionsSuccessState extends LayoutStates {}
class GetSessionsErrorState extends LayoutStates {

}

class DeleteSessionsLoadingState extends LayoutStates {}
class DeleteSessionsSuccessState extends LayoutStates {}
class DeleteSessionsErrorState extends LayoutStates {

}

class DeleteAllSessionsLoadingState extends LayoutStates {}
class DeleteAllSessionsSuccessState extends LayoutStates {}
class DeleteAllSessionsErrorState extends LayoutStates {

}
class PatientsInfoLoadingState extends LayoutStates {}
class PatientsInfoSuccessState extends LayoutStates {}
class PatientsInfoErrorState extends LayoutStates {

}

class PatientMedicalHistoryLoadingState extends LayoutStates {}
class PatientMedicalHistorySuccessState extends LayoutStates {}
class PatientMedicalHistoryErrorState extends LayoutStates {

}
class DiseaseLoadingState extends LayoutStates {}
class DiseaseSuccessState extends LayoutStates {}
class DiseaseErrorState extends LayoutStates {

}
class GetReservationLoadingState extends LayoutStates {}
class GetReservationSuccessState extends LayoutStates {}
class GetReservationErrorState extends LayoutStates {

}

