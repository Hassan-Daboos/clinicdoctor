import 'package:cached_network_image/cached_network_image.dart';
import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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

class _ProfileScreenState extends State<ProfileScreen>
    with SingleTickerProviderStateMixin {
  int segmentedControlGroupValue = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.transparent,
        title: CustomText(
          text: 'Patient profile',
          fontSize: 25,
          color: textcolor,
          fontWeight: FontWeight.bold,
        ),
        // actions: [
        //   IconButton(
        //       onPressed: () {
        //         NavigationService.instance.navigationKey!.currentState!
        //             .pushNamed(
        //           "EditprofileScreen",
        //         );
        //       },
        //       icon: Icon(
        //         Icons.edit,
        //         color: textcolor,
        //       ))
        //
        //
        // ],
      ),
      body: ListView(
        children: [
          Card(
            child: ListTile(
              onTap: () {
                NavigationService.instance.navigationKey!.currentState!
                    .pushNamed(
                  "MedicalHistoryScreen",
                );
              },
              leading: CircleAvatar(
                radius: 56,
                backgroundColor: textcolor,
                child: Padding(
                  padding: const EdgeInsets.all(4), // Border radius
                  child: ClipOval(
                      child:
                          Image.network('https://i.stack.imgur.com/0VpX0.png')),
                ),
              ),
              // leading: CircleAvatar(
              //   radius: 45,
              //   backgroundColor: Colors.deepOrangeAccent,
              //   child: ClipOval(
              //     child: CachedNetworkImage(
              //       imageUrl: "https://i.stack.imgur.com/0VpX0.png",
              //       fit: BoxFit.cover,
              //       width: 80,
              //       height: 80,
              //     ),
              //   ),
              // ),
              title: CustomText(
                text: 'Hassan Mohamed',
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
          Card(
            child: ListTile(
              leading: CircleAvatar(
                radius: 56,
                backgroundColor: textcolor,
                child: Padding(
                  padding: const EdgeInsets.all(4), // Border radius
                  child: ClipOval(
                      child:
                          Image.network('https://i.stack.imgur.com/0VpX0.png')),
                ),
              ),
              // leading: CircleAvatar(
              //   radius: 45,
              //   backgroundColor: Colors.deepOrangeAccent,
              //   child: ClipOval(
              //     child: CachedNetworkImage(
              //       imageUrl: "https://i.stack.imgur.com/0VpX0.png",
              //       fit: BoxFit.cover,
              //       width: 80,
              //       height: 80,
              //     ),
              //   ),
              // ),
              title: CustomText(
                text: 'Hassan Mohamed',
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
          Card(
            child: ListTile(
              leading: CircleAvatar(
                radius: 56,
                backgroundColor: textcolor,
                child: Padding(
                  padding: const EdgeInsets.all(4), // Border radius
                  child: ClipOval(
                      child:
                          Image.network('https://i.stack.imgur.com/0VpX0.png')),
                ),
              ),
              // leading: CircleAvatar(
              //   radius: 45,
              //   backgroundColor: Colors.deepOrangeAccent,
              //   child: ClipOval(
              //     child: CachedNetworkImage(
              //       imageUrl: "https://i.stack.imgur.com/0VpX0.png",
              //       fit: BoxFit.cover,
              //       width: 80,
              //       height: 80,
              //     ),
              //   ),
              // ),
              title: CustomText(
                text: 'Hassan Mohamed',
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
          Card(
            child: ListTile(
              leading: CircleAvatar(
                radius: 56,
                backgroundColor: textcolor,
                child: Padding(
                  padding: const EdgeInsets.all(4), // Border radius
                  child: ClipOval(
                      child:
                          Image.network('https://i.stack.imgur.com/0VpX0.png')),
                ),
              ),
              // leading: CircleAvatar(
              //   radius: 45,
              //   backgroundColor: Colors.deepOrangeAccent,
              //   child: ClipOval(
              //     child: CachedNetworkImage(
              //       imageUrl: "https://i.stack.imgur.com/0VpX0.png",
              //       fit: BoxFit.cover,
              //       width: 80,
              //       height: 80,
              //     ),
              //   ),
              // ),
              title: CustomText(
                text: 'Hassan Mohamed',
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
        ],
      ),
    );
  }
}
