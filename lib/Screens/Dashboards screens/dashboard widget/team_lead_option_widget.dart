import 'package:flutter/material.dart';
import 'package:taskflow_application/Screens/Manage%20User%20Screens/add_user_page.dart';
import 'package:taskflow_application/Screens/Manage%20User%20Screens/manage_user_page.dart';
import 'package:taskflow_application/Screens/Project%20screens/add_project_page.dart';
import 'package:taskflow_application/Widgets/dashboard_button.dart';

class TeamLeadDashboardButtons extends StatefulWidget {
  const TeamLeadDashboardButtons({super.key});

  @override
  State<TeamLeadDashboardButtons> createState() => _TeamLeadDashboardButtons();
}

class _TeamLeadDashboardButtons extends State<TeamLeadDashboardButtons> {
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
              btnName: "Create Project",
              ontap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const AddProjectPage()));
              }),
          CustomDashboardButton(
              colors: Colors.red,
              btnName: "Manage Team",
              ontap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const ManageUserPage()));
              }),
          CustomDashboardButton(
              colors: Colors.yellow,
              btnName: "View Leave",
              ontap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const AddUser()));
              }),
          CustomDashboardButton(
              colors: Colors.green,
              btnName: "Assigned Projects",
              ontap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const AddUser()));
              }),
        ],
      ),
    );
  }
}
