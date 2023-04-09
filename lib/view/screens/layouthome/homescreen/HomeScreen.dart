import 'package:flutter/material.dart';

import '../../../../constant/color_manager.dart';
import '../../../component/app_component/custom_button.dart';
import '../../../component/app_component/custom_text.dart';
import '../../../component/app_component/custom_text_form_filed.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var formKey = GlobalKey<FormState>();
  TextEditingController phoneController = TextEditingController();

  TextEditingController maradController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,

        backgroundColor: Colors.transparent,
        title:  CustomText(
          text: 'Medical examination',
          fontSize: 25,
          color: textcolor,
          fontWeight: FontWeight.bold,
        ),


      ),
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
                            text: "Please add the patient's number and add the symptoms, and between each symptom and the other put( / )",
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
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 10),
                          child: TextFormFieldsCustom(
                            controller: maradController,
                            MaxLines: 8,
                            hintText: "Disease Diagnosis",
                            keyboardType: TextInputType.text,
                            textInputAction: TextInputAction.next,
                            validator: (value) {
                              if (value!.trim().isEmpty) {
                                return "Disease Diagnosis must be not Empty";
                              }
                              return null;
                            },
                          ),
                        ),



                        Container(
                          width: MediaQuery.of(context).size.width,
                          padding: const EdgeInsets.symmetric(
                           vertical: 15),
                          child: CustomButton(
                            widget: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20.0, vertical: 15),
                              child: CustomText(
                                text: "Save",
                                fontSize: 16,
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            buttonColor: maincolor,
                            borderRadius: 5,
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                print("objectvald");
                              }
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
