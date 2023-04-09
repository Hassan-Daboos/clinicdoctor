import 'package:flutter/material.dart';

import '../../../../constant/color_manager.dart';
import '../../../../constant/data.dart';
import '../../../component/app_component/custom_button.dart';
import '../../../component/app_component/custom_text.dart';
import '../../../component/app_component/custom_text_form_filed.dart';
import '../../../component/app_component/maxtextcolor.dart';

class EditprofileScreen extends StatefulWidget {
  const EditprofileScreen({Key? key}) : super(key: key);

  @override
  State<EditprofileScreen> createState() => _EditprofileScreenState();
}

class _EditprofileScreenState extends State<EditprofileScreen> {
  var formKey = GlobalKey<FormState>();

  TextEditingController FacebookController = TextEditingController();

  TextEditingController fullNameController = TextEditingController();

  TextEditingController phoneController = TextEditingController();

  TextEditingController addressController = TextEditingController();

  TextEditingController passwordController = TextEditingController();
  TextEditingController whatsappController = TextEditingController();
  TextEditingController twitterController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.transparent,
        title: CustomText(
          text: 'Edit profile',
          fontSize: 25,
          color: textcolor,
          fontWeight: FontWeight.bold,
        ),
        leading:  IconButton(
            onPressed: () {
           Navigator.of(context).pop();
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: textcolor,
            )),

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
                          height: MediaQuery.of(context).size.height / 10,
                        ),

                        CustomText(
                          text: "Edit Profile",
                          fontSize: 20,
                          color: textcolor,
                          fontWeight: FontWeight.w600,
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          child: TextFormFieldsCustom(
                            controller: fullNameController,
                            hintText: "Full Name",
                            keyboardType: TextInputType.text,
                            textInputAction: TextInputAction.next,
                            validator: (value) {
                              if (value!.trim().isEmpty) {
                                return "Full Name must be not Empty";
                              }
                              return null;
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5),
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
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          child: TextFormFieldsCustom(
                            controller: whatsappController,
                            hintText: "whatsapp",
                            keyboardType: TextInputType.phone,
                            textInputAction: TextInputAction.next,
                            validator: (value) {
                              if (value!.trim().isEmpty) {
                                return "Whatsapp must be not Empty";
                              }
                              return null;
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          child: TextFormFieldsCustom(
                            controller: FacebookController,
                            hintText: "Facebook",
                            keyboardType: TextInputType.url,
                            textInputAction: TextInputAction.next,
                            validator: (value) {
                              if (value!.trim().isEmpty) {
                                return "Email must be not Empty";
                              } else if (RegExp(validatorEmail)
                                  .hasMatch(value.trim())) {
                                return "Email is not Valid";
                              }
                              return null;
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          child: TextFormFieldsCustom(
                            controller: twitterController,
                            hintText: "Twitter",
                            keyboardType: TextInputType.url,
                            textInputAction: TextInputAction.next,
                            validator: (value) {
                              if (value!.trim().isEmpty) {
                                return "twitter must be not Empty";
                              } else if (RegExp(validatorEmail)
                                  .hasMatch(value.trim())) {
                                return "Twitter is not Valid";
                              }
                              return null;
                            },
                          ),
                        ),


                        SizedBox(
                          height: MediaQuery.of(context).size.height / 90,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          child: CustomButton(
                            widget: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20.0, vertical: 15),
                              child: CustomText(
                                text: "Save",
                                fontSize: 12,
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            buttonColor: maincolor,
                            borderRadius: 7,
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
