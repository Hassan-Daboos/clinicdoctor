import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constant/color_manager.dart';
import '../../../viewmodel/cubit/layout_cubit/layout_cubit.dart';
import '../../../viewmodel/cubit/layout_cubit/layout_states.dart';

class LayoutScreen extends StatelessWidget {
  const LayoutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LayoutCubit, LayoutStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var layoutCubit = BlocProvider.of<LayoutCubit>(context);
        // var lang = AppLocalizations.of(context)!;
        return Scaffold(
          backgroundColor: Colors.white,
          bottomNavigationBar: ConvexAppBar(
            items: [
              TabItem(
                  icon: Icons.schedule_outlined,
                  activeIcon: Icons.schedule,
                  title: 'examination'),
              TabItem(
                  icon: Icons.person_outline_outlined,
                  activeIcon: Icons.person,
                  title: 'Profile'),
              TabItem(
                  icon: Icons.settings_outlined,
                  activeIcon: Icons.settings,
                  title: 'Settings'),
            ],
            elevation: 5,
            shadowColor: maincolor.withOpacity(0.6),
            activeColor: textcolor,
            color: textcolor,
            backgroundColor: background,
            // currentIndex: layoutCubit.currentIndex,
            //     type: BottomNavigationBarType.fixed,
            //     selectedItemColor: textcolor,
            //     unselectedItemColor: Color(0xffBEBEBE),
            //     backgroundColor: Colors.white,
            //     showSelectedLabels: false,
            //     showUnselectedLabels: false,

            onTap: (index) {
              layoutCubit.changeIndex(index);
            },
          ),
          body: layoutCubit.screen[layoutCubit.currentIndex],
        );
      },
    );
  }
}
