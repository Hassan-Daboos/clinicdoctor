import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';
import 'package:flutter/material.dart';

import '../../../../constant/color_manager.dart';
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
