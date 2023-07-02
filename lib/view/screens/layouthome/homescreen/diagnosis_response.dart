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
  State<DiagnosisResponse> createState() => _DiagnosisResponseState();
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
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.transparent,
        title: CustomText(
          text: 'Diagnosis',
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
      body: ListView(
        shrinkWrap: true,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 5),
            child: Card(
              child: ListTile(
                minVerticalPadding: 20,
                onTap: () {},
                title: CustomText(
                  text: layoutCubit.diagnosesResponse!.first.name,
                  fontSize: 18,
                  color: textcolor,
                  fontWeight: FontWeight.bold,
                ),
                subtitle: CustomText(
                  text: "${layoutCubit.diagnosesResponse!.first.prob}",
                  fontSize: 14,
                  color: textcolor,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 5),
            child: Card(
              child: ListTile(
                minVerticalPadding: 20,
                onTap: () {},
                title: CustomText(
                  text: layoutCubit.diagnosesResponse!.second.name,
                  fontSize: 18,
                  color: textcolor,
                  fontWeight: FontWeight.bold,
                ),
                subtitle: CustomText(
                  text: "${layoutCubit.diagnosesResponse!.second.prob}",
                  fontSize: 14,
                  color: textcolor,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 5),
            child: Card(
              child: ListTile(
                minVerticalPadding: 20,
                onTap: () {},
                title: CustomText(
                  text: layoutCubit.diagnosesResponse!.third.name,
                  fontSize: 18,
                  color: textcolor,
                  fontWeight: FontWeight.bold,
                ),
                subtitle: CustomText(
                  text: "${layoutCubit.diagnosesResponse!.third.prob}",
                  fontSize: 14,
                  color: textcolor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
