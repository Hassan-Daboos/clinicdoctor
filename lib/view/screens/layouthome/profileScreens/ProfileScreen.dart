import 'package:cached_network_image/cached_network_image.dart';
import 'package:clinicdoctor/viewmodel/cubit/layout_cubit/layout_cubit.dart';
import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timeline_list/timeline.dart';
import 'package:timeline_list/timeline_model.dart';

import '../../../../constant/NavigationService.dart';
import '../../../../constant/color_manager.dart';
import '../../../component/app_component/custom_text.dart';
import 'MedicalHistoryScreen.dart';
import 'editprofile.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    LayoutCubit.get(context).getPatients();
  }

  @override
  Widget build(BuildContext context) {
    var layoutCubit = BlocProvider.of<LayoutCubit>(context, listen: true);
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.transparent,
        title: CustomText(
          text: 'Patients',
          fontSize: 25,
          color: textcolor,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: ListView.builder(
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.symmetric(vertical: 3,horizontal: 5),
            child: Card(
                  child: ListTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MedicalHistoryScreen(
                                  userId:
                                      layoutCubit.patientModel[index].userId)));
                    },

                    leading: Container(
                      height: 60,
                      width: 60,
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      decoration: BoxDecoration(shape: BoxShape.circle),
                      child: Image.network(
                        layoutCubit.patientModel[index].photo,
                        fit: BoxFit.cover,
                      ),
                    ),
                    title: CustomText(
                      text: layoutCubit.patientModel[index].fullName,
                      fontSize: 16,
                      color: textcolor,
                      fontWeight: FontWeight.bold,
                    ),
                    subtitle: CustomText(
                      text: '8/9/2022',
                      fontSize: 14,
                      color: textcolor,
                    ),
                  ),
                ),
          ),
          shrinkWrap: true,
          itemCount: layoutCubit.patientModel.length,
          physics: BouncingScrollPhysics()),
    );
  }
}
