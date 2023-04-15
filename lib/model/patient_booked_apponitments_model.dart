
class PatientBookedAppointmentModel {
  String dayDate ;
  String nightDate ;

  String medicalPhoto;

  String userId;

  PatientBookedAppointmentModel({
    required this.dayDate,
    required this.nightDate,
    required this.medicalPhoto,
    required this.userId,

  });

  Map<String, dynamic> toMap() {
    return {
      'nightDate': this.nightDate,
      'dayDate':this.dayDate,
      'medicalPhoto':this.medicalPhoto,
      'userId': this.userId,

    };
  }

  factory PatientBookedAppointmentModel.fromMap(Map<String, dynamic> map) {
    return PatientBookedAppointmentModel(
      dayDate: map['dayDate'] as String,
      nightDate: map['nightDate'] as String,
      medicalPhoto: map['medicalPhoto'] as String,
      userId: map['userId'] as String,

    );
  }
}
