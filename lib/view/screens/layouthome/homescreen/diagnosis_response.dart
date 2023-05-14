import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import '../../../../constant/color_manager.dart';
import '../../../../viewmodel/cubit/layout_cubit/layout_cubit.dart';
import '../../../component/app_component/custom_button.dart';
import '../../../component/app_component/custom_text.dart';

class DiagnosisResponse extends StatefulWidget {
  const DiagnosisResponse({Key? key}) : super(key: key);

  @override
  State<DiagnosisResponse> createState() =>
      _DiagnosisResponseState();
}

class _DiagnosisResponseState extends State<DiagnosisResponse> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var layoutCubit = BlocProvider.of<LayoutCubit>(context, listen: true);

    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: ListView(
        shrinkWrap: true,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 3,horizontal: 5),
            child: Card(
              child: ListTile(
                minVerticalPadding: 20,
                onTap: () {

                },
                title: CustomText(
                  text: layoutCubit.diagnosesResponse!.first.name,
                  fontSize: 18,
                  color: textcolor,
                  fontWeight: FontWeight.bold,
                ),
                // subtitle: CustomText(
                //   text: '''${DateFormat.MMMd().format(
                //     DateTime.parse(layoutCubit.reservationModel[index].date),
                //   )} , From  ${layoutCubit.reservationModel[index].time}''',
                //   fontSize: 14,
                //   color: textcolor,
                // ),
                // trailing: CustomText(
                //   text: layoutCubit.reservationModel[index].type,
                //   fontSize: 14,
                //   color: textseccolor,
                // ),
              ),
            ),
          ),
          SizedBox(
            height: 10.h,
          ), Padding(
            padding: const EdgeInsets.symmetric(vertical: 3,horizontal: 5),
            child: Card(
              child: ListTile(
                minVerticalPadding: 20,
                onTap: () {

                },
                title: CustomText(
                  text: layoutCubit.diagnosesResponse!.second.name,
                  fontSize: 18,
                  color: textcolor,
                  fontWeight: FontWeight.bold,
                ),
                // subtitle: CustomText(
                //   text: '''${DateFormat.MMMd().format(
                //     DateTime.parse(layoutCubit.reservationModel[index].date),
                //   )} , From  ${layoutCubit.reservationModel[index].time}''',
                //   fontSize: 14,
                //   color: textcolor,
                // ),
                // trailing: CustomText(
                //   text: layoutCubit.reservationModel[index].type,
                //   fontSize: 14,
                //   color: textseccolor,
                // ),
              ),
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 3,horizontal: 5),
            child: Card(
              child: ListTile(
                minVerticalPadding: 20,
                onTap: () {

                },
                title: CustomText(
                  text: layoutCubit.diagnosesResponse!.third.name,
                  fontSize: 18,
                  color: textcolor,
                  fontWeight: FontWeight.bold,
                ),
                // subtitle: CustomText(
                //   text: '''${DateFormat.MMMd().format(
                //     DateTime.parse(layoutCubit.reservationModel[index].date),
                //   )} , From  ${layoutCubit.reservationModel[index].time}''',
                //   fontSize: 14,
                //   color: textcolor,
                // ),
                // trailing: CustomText(
                //   text: layoutCubit.reservationModel[index].type,
                //   fontSize: 14,
                //   color: textseccolor,
                // ),
              ),
            ),
          ),

        ],
      ),
    );
  }
}