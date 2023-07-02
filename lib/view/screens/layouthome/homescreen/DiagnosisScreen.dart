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
    'itching',
    'skin_rash',
    'nodal_skin_eruptions',
    'continuous_sneezing',
    'shivering',
    'chills',
    'joint_pain',
    'stomach_pain',
    'acidity',
    'ulcers_on_tongue',
    'muscle_wasting',
    'vomiting',
    'burning_micturition',
    'spotting_ urination',
    'fatigue',
    'weight_gain',
    'anxiety',
    'cold_hands_and_feets',
    'mood_swings',
    'weight_loss',
    'restlessness',
    'lethargy',
    'patches_in_throat',
    'irregular_sugar_level',
    'cough',
    'high_fever',
    'sunken_eyes',
    'breathlessness',
    'sweating',
    'dehydration',
    'indigestion',
    'headache',
    'yellowish_skin',
    'dark_urine',
    'nausea',
    'loss_of_appetite',
    'pain_behind_the_eyes',
    'back_pain',
    'constipation',
    'abdominal_pain',
    'diarrhoea',
    'mild_fever',
    'yellow_urine',
    'yellowing_of_eyes',
    'acute_liver_failure',
    'fluid_overload',
    'swelling_of_stomach',
    'swelled_lymph_nodes',
    'malaise',
    'blurred_and_distorted_vision',
    'phlegm',
    'throat_irritation',
    'redness_of_eyes',
    'sinus_pressure',
    'runny_nose',
    'congestion',
    'chest_pain',
    'weakness_in_limbs',
    'fast_heart_rate',
    'pain_during_bowel_movements',
    'pain_in_anal_region',
    'bloody_stool',
    'irritation_in_anus',
    'neck_pain',
    'dizziness',
    'cramps',
    'bruising',
    'obesity',
    'swollen_legs',
    'swollen_blood_vessels',
    'puffy_face_and_eyes',
    'enlarged_thyroid',
    'brittle_nails',
    'swollen_extremeties',
    'excessive_hunger',
    'extra_marital_contacts',
    'drying_and_tingling_lips',
    'slurred_speech',
    'knee_pain',
    'hip_joint_pain',
    'muscle_weakness',
    'stiff_neck',
    'swelling_joints',
    'movement_stiffness',
    'spinning_movements',
    'loss_of_balance',
    'unsteadiness',
    'weakness_of_one_body_side',
    'loss_of_smell',
    'bladder_discomfort',
    'foul_smell_of urine',
    'continuous_feel_of_urine',
    'passage_of_gases',
    'internal_itching',
    'toxic_look_(typhos)',
    'depression',
    'irritability',
    'muscle_pain',
    'altered_sensorium',
    'red_spots_over_body',
    'belly_pain',
    'abnormal_menstruation',
    'dischromic _patches',
    'watering_from_eyes',
    'increased_appetite',
    'polyuria',
    'family_history',
    'mucoid_sputum',
    'rusty_sputum',
    'lack_of_concentration',
    'visual_disturbances',
    'receiving_blood_transfusion',
    'receiving_unsterile_injections',
    'coma',
    'stomach_bleeding',
    'distention_of_abdomen',
    'history_of_alcohol_consumption',
    'fluid_overload.1',
    'blood_in_sputum',
    'prominent_veins_on_calf',
    'palpitations',
    'painful_walking',
    'pus_filled_pimples',
    'blackheads',
    'scurring',
    'skin_peeling',
    'silver_like_dusting',
    'small_dents_in_nails',
    'inflammatory_nails',
    'blister',
    'red_sore_around_nose',
    'yellow_crust_ooze'
  ];

  @override
  Widget build(BuildContext context) {
    var layoutCubit = BlocProvider.of<LayoutCubit>(context, listen: true);
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
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20.0, vertical: 15),
                            child: CustomText(
                              textAlign: TextAlign.center,
                              text: "Please Select Diagnosis",
                              fontSize: 24,
                              color: textcolor,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 20,
                        ),
                        // Padding(
                        //   padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 10),
                        //   child: TextFormFieldsCustom(
                        //     controller: phoneController,
                        //     hintText: "Phone Number",
                        //     keyboardType: TextInputType.phone,
                        //     textInputAction: TextInputAction.next,
                        //     validator: (value) {
                        //       if (value!.trim().isEmpty) {
                        //         return "Phone Number must be not Empty";
                        //       }
                        //       return null;
                        //     },
                        //   ),
                        // ),
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
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          child: CustomButton(
                            widget: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20.0, vertical: 15),
                              child: BlocConsumer<LayoutCubit, LayoutStates>(
                                  builder: (context, state) {
                                return state is! DiseaseLoadingState
                                    ? CustomText(
                                        text: "Save",
                                        fontSize: 16,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600,
                                      )
                                    : CircularProgressIndicator();
                              }, listener: (context, state) {
                                if (state is DiseaseSuccessState) {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              DiagnosisResponse()));
                                }
                              }),
                            ),
                            buttonColor: maincolor,
                            borderRadius: 5,
                            onPressed: () {
                              if (tags.isEmpty) {
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
              )),
        ),
      ),
    );
  }
}
