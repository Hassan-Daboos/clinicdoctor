import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

import '../../../../constant/color_manager.dart';
import '../../../../viewmodel/cubit/layout_cubit/layout_cubit.dart';
import '../../../component/app_component/custom_button.dart';
import '../../../component/app_component/custom_text.dart';
import '../../../component/app_component/custom_text_form_filed.dart';
import 'DiagnosisScreen.dart';
import 'ReservationsDatesScreen.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    var layoutCubit =BlocProvider.of<LayoutCubit>(context,listen: true);

    return Scaffold(
        backgroundColor: Colors.grey.shade100,
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,

          backgroundColor: Colors.transparent,
          title:  CustomText(
            text: 'Patient profile',
            fontSize: 25,
            color: textcolor,
            fontWeight: FontWeight.bold,
          ),
          actions: [
            IconButton(
              icon: Icon(
                Icons.date_range,
                color: maincolor,
              ),
              onPressed: () {
                DatePicker.showDatePicker(
                  context,
                  currentTime: layoutCubit.checkTime,
                  locale: LocaleType.en,
                  maxTime: DateTime(2030, 1, 1),
                  minTime: DateTime.now(),
                  onChanged: (data) {
                    setState(() {
                      print(data.weekday.toString());
                      layoutCubit.checkTime = data;
                      // dateTime = "${data.year}/${data.month}/${data.day}";
                      // dateTimeController.text = dateTime;
                      // print(dateTimeController.text);
                      print(layoutCubit.checkTime);
                    });
                  },
                  onConfirm: (data) {
                    layoutCubit.checkTime = data;
                    layoutCubit.getReservation();
                  },
                );
              },
            )
          ],


        ),
        body: ContainedTabBarView(
          tabs: [
            Text('Diagnosis '),
            Text('Reservations '),
          ],
          tabBarProperties: TabBarProperties(
            width: MediaQuery.of(context).size.width/1.2,
            height: 50,
            background: Container(
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.all(Radius.circular(8.0)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade300,
                    spreadRadius: 0.5,
                    blurRadius: 5,
                    offset: Offset(1, -1),
                  ),
                ],
              ),
            ),
            position: TabBarPosition.top,
            alignment: TabBarAlignment.center,
            indicatorColor: background,
            labelColor: maincolor,

            unselectedLabelColor: textcolor,
          ),
          views: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: DiagnosisScreen(),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: ReservationsDatesScreen(),
            ),

          ],
        )


    );
  }
}
