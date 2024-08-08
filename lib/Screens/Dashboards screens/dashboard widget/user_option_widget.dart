import 'package:flutter/material.dart';
import 'package:taskflow_application/Screens/Manage%20User%20Screens/add_user_page.dart';
import 'package:taskflow_application/Widgets/dashboard_button.dart';

class UserDashboardButtons extends StatefulWidget {
  const UserDashboardButtons({super.key});

  @override
  State<UserDashboardButtons> createState() => _UserDashboardButtons();
}

class _UserDashboardButtons extends State<UserDashboardButtons> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 15,
            crossAxisSpacing: 15,
            mainAxisExtent: 110),
        children: [
          CustomDashboardButton(
              colors: Colors.blue,
              btnName: "Attendance",
              ontap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const AddUser()));
              }),
          CustomDashboardButton(
              colors: Colors.red,
              btnName: "Leave",
              ontap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const AddUser()));
              }),
          CustomDashboardButton(
              colors: Colors.yellow,
              btnName: "Manage Task",
              ontap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const AddUser()));
              }),
          CustomDashboardButton(
              colors: Colors.green,
              btnName: "Project",
              ontap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const AddUser()));
              }),
        ],
      ),
    );
  }
}
