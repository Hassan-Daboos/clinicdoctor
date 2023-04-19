
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../../model/medical_history_model.dart';
import '../../../model/patient_booked_apponitments_model.dart';
import '../../../model/reservation_model.dart';
import '../../../model/user_model.dart';
import '../../../view/screens/layouthome/aboutusScreens/AboutusScreen.dart';
import '../../../view/screens/layouthome/homescreen/HomeScreen.dart';
import '../../../view/screens/layouthome/profileScreens/ProfileScreen.dart';
import '../../database/dio_helper.dart';
import 'layout_states.dart';


class LayoutCubit extends Cubit<LayoutStates>{
  LayoutCubit():super(LayoutInitialState());
  static LayoutCubit get(context)=> BlocProvider.of<LayoutCubit>(context);
  // String userToken = CacheHelper.getData(key: 'accessToken') ?? '';


  List<Widget> screen =
  [
    HomeScreen(),
    ProfileScreen(),
    AboutusScreen(),



  ];
  int currentIndex = 0;

  void changeIndex(index) {
    currentIndex = index;
    emit(ChangeIndexState());
  }
  List<UserModel> patientModel=[];
  Future<void> getPatients() async {
    patientModel=[];
    emit(PatientsInfoLoadingState());

    await FirebaseFirestore.instance
        .collection('users')
        .get()
        .then((value) {
      print(value.docs[0].id);
      value.docs.forEach((element) {
        patientModel.add(UserModel.fromMap(element.data()));
      });




      emit(PatientsInfoSuccessState());
    }).catchError((onError) {
      print(onError.toString());
      print('Amr');
      emit(PatientsInfoErrorState());
    });
  }

  List<MedicalHistoryModel> patientMedicalHistoryModel = [];

  Future<void> getPatientMedicalHistory({String? userId}) async {
    patientMedicalHistoryModel = [];
    emit(PatientMedicalHistoryLoadingState());

    await FirebaseFirestore.instance
        .collection('medicalHistory')
        .where(
      'userId',
      isEqualTo: userId,
    )
        .get()
        .then((value) {
          print(value.docs);
          print(value);
      value.docs.forEach((element) {
        patientMedicalHistoryModel
            .add(MedicalHistoryModel.fromMap(element.data()));
      });

      emit(PatientMedicalHistorySuccessState());
    }).catchError((onError) {
      print(onError.toString());
      print('Amr');
      emit(PatientMedicalHistoryErrorState());
    });
  }
  Future<void> getDisease() async {

    emit(DiseaseLoadingState());


    try {
      // Initialize Dio client
      Dio dio = Dio();

      // Define the API URL and parameters
      String url = 'http://tonymalak.pythonanywhere.com/';
      List<String> input = ['itching', 'skin_rash', 'nodal_skin_eruptions'];
      Map<String, dynamic> params = {'input': input};

      // Make the HTTP request
      Response response = await dio.get(url, queryParameters: params);

      // Check if the request was successful
      if (response.statusCode == 200) {
        // Parse the response data
        Map<String, dynamic> data = response.data;

        // Do something with the data
        print(data);
      } else {
        // Handle the error
        print('Request failed with status code: ${response.statusCode}');
      }
    } catch (error) {
      // Handle any errors that occurred during the request
      print('Error occurred: $error');
    }

  }
  List<ReservationModel> reservationModel =[];
  DateTime checkTime =DateTime.now();


  Future<void> getReservation() async {
    reservationModel=[];
    emit(GetReservationLoadingState());

    await FirebaseFirestore.instance
        .collection('checked').where('date',isEqualTo: DateTime(
      checkTime.year,
      checkTime.month,
      checkTime.day,
      0, // 5 PM is hour 17 in 24-hour time
      0,
      0,
    ).toString()).get()
        .then((value) async {





      if(!value.docs.isEmpty)
      {
        value.docs.forEach((elementOne) {
          DateTime dateTime = DateTime(
            DateTime.now().year,
            DateTime.now().month,
            DateTime.now().day,
            DateFormat('hh:mm:ss a').parse(elementOne.data()['time']).hour,
            DateFormat('hh:mm:ss a').parse(elementOne.data()['time']).minute,
            DateFormat('hh:mm:ss a').parse(elementOne.data()['time']).second,
          );
          if (dateTime == DateTime.now()) {
            print('The dates are equal');
            deleteDoc(doc: elementOne.id);
            //delete
          } else if (dateTime.isBefore(DateTime.now())) {
            print('The date in the string is earlier');
            print(dateTime);

            deleteDoc(doc: elementOne.id);
          } else {
            print(dateTime);

            reservationModel
                .add(ReservationModel.fromMap(elementOne.data()));

            print('The date in the string is later');
          }

        });
      }else
      {

      }




      emit(GetReservationSuccessState());
    }).catchError((onError) {
      print('${onError.toString()}');
      emit(GetReservationErrorState());
    });
  }
  Future<void> deleteDoc({String? doc}) {

    return FirebaseFirestore.instance.collection('checked')
        .doc(doc)
        .delete()
        .then((value) {
      getReservation();
    })
        .catchError((error) => print("Failed to delete user: $error"));
  }


// void setState(() {
 //  choice
 //      .forEach((element) {
 //  for (var element in element.subTitle) {
 //  element.select = false;
 //  }
 //  });
 //  choice[index].subTitle[index2].select =
 //  !choice[index]
 //      .subTitle[index2]
 //      .select;
 //  });





}