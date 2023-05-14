import 'dart:convert';

class Diagnosis {
  final String name;
  final double prob;

  Diagnosis({required this.name, required this.prob});

  factory Diagnosis.fromMap(Map<String, dynamic> map) {
    return Diagnosis(
      name: map['name'],
      prob: map['prob'],
    );
  }
}

class DiagnosesResponse {
  final Diagnosis first;
  final Diagnosis second;
  final Diagnosis third;

  DiagnosesResponse({required this.first, required this.second, required this.third});

  factory DiagnosesResponse.fromJson(String jsonString) {
    Map<String, dynamic> map = json.decode(jsonString);
    return DiagnosesResponse(
      first: Diagnosis.fromMap(map['first']),
      second: Diagnosis.fromMap(map['second']),
      third: Diagnosis.fromMap(map['third']),
    );
  }
}