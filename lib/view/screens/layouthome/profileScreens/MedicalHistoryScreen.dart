import 'package:clinicdoctor/viewmodel/cubit/layout_cubit/layout_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timeline_list/timeline.dart';
import 'package:timeline_list/timeline_model.dart';

import '../../../../constant/NavigationService.dart';
import '../../../../constant/color_manager.dart';
import '../../../../viewmodel/cubit/layout_cubit/layout_cubit.dart';
import '../../../component/app_component/custom_text.dart';
import 'descriptionhistory.dart';
class MedicalHistoryScreen extends StatefulWidget {
String? userId;

MedicalHistoryScreen({this.userId});

@override
  State<MedicalHistoryScreen> createState() => _MedicalHistoryScreenState();
}

class _MedicalHistoryScreenState extends State<MedicalHistoryScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    LayoutCubit.get(context).getPatientMedicalHistory(userId:widget.userId );
  }
  @override
  Widget build(BuildContext context) {
    var layoutCubit =BlocProvider.of<LayoutCubit>(context,listen: true);
    return Scaffold(
    appBar:  AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.transparent,
        title: CustomText(
          text: 'Patient profile',
          fontSize: 25,
          color: textcolor,
          fontWeight: FontWeight.bold,
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios, color: textcolor),
        ),
      ),
      backgroundColor: Colors.grey.shade100,


      body: BlocConsumer<LayoutCubit,LayoutStates>(
        listener: (context,state){},
        builder: (context,state){
          return state is !PatientMedicalHistoryLoadingState?layoutCubit.patientMedicalHistoryModel.isNotEmpty? Timeline.builder(itemBuilder: (context,index)=>TimelineModel(

            GestureDetector(
              onTap: ()
              {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>DescriptionHistory(index: index,)));
              },
              child: Container(
                color: Colors.transparent,
                height: MediaQuery.of(context).size.width / 2,
                width: MediaQuery.of(context).size.width / 2,
                padding: EdgeInsets.all(5),
                child: Card(
                  shadowColor: grey,
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Column(
                    children: [
                      Image.network(
                        layoutCubit.patientMedicalHistoryModel[index].medicalPhoto,
                        height: MediaQuery.of(context).size.width / 3,
                        width: MediaQuery.of(context).size.width / 4,
                      ),
                      CustomText(
                        text: layoutCubit.patientMedicalHistoryModel[index].date,
                        fontSize: 16,
                        color: textcolor,
                        fontWeight: FontWeight.w600,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            icon: Icon(Icons.receipt, color: Colors.white),
            iconBackground: maincolor,

          ),itemCount: layoutCubit.patientMedicalHistoryModel.length,shrinkWrap: true,
            primary: true,

            position: TimelinePosition.Center,
            iconSize: 50,
            lineColor: textcolor,
          ):Center(child: Text('There is no medical history',style: TextStyle(color: textcolor),)):Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
