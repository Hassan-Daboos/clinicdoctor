
import 'package:clinicdoctor/model/user_model.dart';

class ReservationModel {
  String time;
  String userId;
  String date;
  String type;
  int docId;
  UserModel userModel;



  ReservationModel({
    required this.time,
    required this.date,
    required this.userModel,
    required this.type,
    required this.docId,

    required this.userId,

  });

  Map<String, dynamic> toMap() {
    return {
      'time': this.time,
      'date': this.date,
      'docId': this.docId,
      'userData': this.userModel,

      'userId': this.userId,
      'type': this.type,

    };
  }

  factory ReservationModel.fromMap(Map<String, dynamic> map) {
    return ReservationModel(
      time: map['time'] as String,
      docId: map['docId'] as int,
      date: map['date'] as String,
      type: map['type'] as String,
      userModel: UserModel.fromMap(map['userData']),

      userId: map['userId'] as String,

    );
  }
}
