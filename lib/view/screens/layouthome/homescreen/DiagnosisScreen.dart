import 'package:chips_choice_null_safety/chips_choice_null_safety.dart';
import 'package:clinicdoctor/view/component/app_component/toast.dart';
import 'package:clinicdoctor/viewmodel/cubit/layout_cubit/layout_cubit.dart';
import 'package:clinicdoctor/viewmodel/cubit/layout_cubit/layout_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../constant/color_manager.dart';
import '../../../component/app_component/custom_button.dart';
import '../../../component/app_component/custom_text.dart';
import '../../../component/app_component/custom_text_form_filed.dart';
import 'diagnosis_response.dart';
class DiagnosisScreen extends StatefulWidget {
  const DiagnosisScreen({Key? key}) : super(key: key);

  @override
  State<DiagnosisScreen> createState() => _DiagnosisScreenState();
}

class _DiagnosisScreenState extends State<DiagnosisScreen> {
  var formKey = GlobalKey<FormState>();
  TextEditingController phoneController = TextEditingController();

  TextEditingController maradController = TextEditingController();
  List<String> tags = [];
  List<String> options = [
    'nodal_skin_eruptions', 'skin_rash', 'itching',

  ];

  @override
  Widget build(BuildContext context) {
    var layoutCubit = BlocProvider.of<LayoutCubit>(context,listen: true);
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      // appBar: AppBar(
      //   elevation: 0,
      //   centerTitle: true,
      //
      //   backgroundColor: Colors.transparent,
      //   title:  CustomText(
      //     text: 'Medical examination',
      //     fontSize: 25,
      //     color: textcolor,
      //     fontWeight: FontWeight.bold,
      //   ),
      //
      //
      // ),
      body: SingleChildScrollView(
        child: Center(
          child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        SizedBox(
                          height: MediaQuery.of(context).size.height / 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 15),
                          child: CustomText(
                            textAlign: TextAlign.center,
                            text: "Please add the patient's number and add the symptoms",
                            fontSize: 16,
                            color: textcolor,
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 10),
                          child: TextFormFieldsCustom(
                            controller: phoneController,
                            hintText: "Phone Number",
                            keyboardType: TextInputType.phone,
                            textInputAction: TextInputAction.next,
                            validator: (value) {
                              if (value!.trim().isEmpty) {
                                return "Phone Number must be not Empty";
                              }
                              return null;
                            },
                          ),
                        ),
                        // Padding(
                        //   padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 10),
                        //   child: TextFormFieldsCustom(
                        //     controller: maradController,
                        //     MaxLines: 8,
                        //     hintText: "Disease Diagnosis",
                        //     keyboardType: TextInputType.text,
                        //     textInputAction: TextInputAction.next,
                        //     validator: (value) {
                        //       if (value!.trim().isEmpty) {
                        //         return "Disease Diagnosis must be not Empty";
                        //       }
                        //       return null;
                        //     },
                        //   ),
                        // ),
                        ChipsChoice<String>.multiple(
                          value: tags,
                          onChanged: (val) => setState(() => tags = val),
                          choiceItems: C2Choice.listFrom<String, String>(
                            source: options,
                            value: (i, v) => v,
                            label: (i, v) => v,
                          ),
                          choiceActiveStyle: C2ChoiceStyle(
                            color: maincolor,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          choiceStyle: C2ChoiceStyle(
                            showCheckmark: false,
                            color: textcolor,
                            backgroundColor: maincolor,
                            borderColor: Color.fromARGB(255, 36, 25, 187),
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                          ),
                          wrapped: true,
                        ),



                        Container(
                          width: MediaQuery.of(context).size.width,
                          padding: const EdgeInsets.symmetric(
                              vertical: 15),
                          child: CustomButton(
                            widget: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20.0, vertical: 15),
                              child: BlocConsumer<LayoutCubit,LayoutStates>(builder: (context,state){
                                return state is !DiseaseLoadingState? CustomText(
                                  text: "Save",
                                  fontSize: 16,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                ):CircularProgressIndicator();
                              }, listener: (context,state){
                                if(state is DiseaseSuccessState){
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>DiagnosisResponse()));
                                }
                              }),
                            ),
                            buttonColor: maincolor,
                            borderRadius: 5,
                            onPressed: () {
                              if(tags.isEmpty){
                                showToast('Select Diagnosis');
                                return;
                              }
                            layoutCubit.getDisease(tags);
                            print(tags);
                              // if (formKey.currentState!.validate()) {
                              //   print("objectvald");
                              // }
                            },
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 20,
                        ),

                      ],
                    ),
                  ),

                ],
              )
          ),
        ),
      ),
    );
  }
}
