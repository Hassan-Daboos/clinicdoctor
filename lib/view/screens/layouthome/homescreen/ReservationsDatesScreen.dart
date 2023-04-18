import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import '../../../../constant/color_manager.dart';
import '../../../../viewmodel/cubit/layout_cubit/layout_cubit.dart';
import '../../../component/app_component/custom_button.dart';
import '../../../component/app_component/custom_text.dart';
class ReservationsDatesScreen extends StatefulWidget {
  const ReservationsDatesScreen({Key? key}) : super(key: key);

  @override
  State<ReservationsDatesScreen> createState() => _ReservationsDatesScreenState();
}

class _ReservationsDatesScreenState extends State<ReservationsDatesScreen> {
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    LayoutCubit.get(context).getReservation();
  }
  @override
  Widget build(BuildContext context) {
    var layoutCubit =BlocProvider.of<LayoutCubit>(context,listen: true);

    return  Scaffold(
      backgroundColor: Colors.grey.shade100,
      body:ListView.separated(
        itemBuilder: (context, index) => Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15.r),
          ),
          height: 130,
          width: double.infinity,
          padding: EdgeInsets.all(15),
          child: Column(
            children: [
              Row(
                mainAxisAlignment:
                MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        height: 60,
                        width: 60,
                        clipBehavior:
                        Clip.antiAliasWithSaveLayer,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle),
                        child: Image.network(
                          layoutCubit.reservationModel[index].userModel.photo,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      CustomText(
                        text:
                        layoutCubit.reservationModel[index].userModel.fullName,
                        fontSize: 16,
                        color: textcolor,
                        fontWeight: FontWeight.w600,
                      ),
                    ],
                  ),

                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                    text:  '${DateFormat("dd/MM/yyyy").format(
                      DateTime.parse(layoutCubit.reservationModel[index].date),
                    )} ${layoutCubit.reservationModel[index].time}',
                    fontSize: 16,
                    color: textcolor,
                    fontWeight: FontWeight.w600,
                  ),
                  CustomText(
                    text:  layoutCubit.reservationModel[index].type,
                    fontSize: 16,
                    color: textcolor,
                    fontWeight: FontWeight.w600,
                  ),
                ],
              ),
            ],
          ),
        ),
        separatorBuilder: (context, index) => SizedBox(
          height: 10.h,
        ),
        itemCount: layoutCubit.reservationModel.length,
        shrinkWrap: true,
        padding: EdgeInsets.symmetric(
            horizontal: 10.w, vertical: 10.h),
      ),




    );
  }
}
