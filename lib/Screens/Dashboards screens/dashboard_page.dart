import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taskflow_application/API/login_user_detail.dart';
import 'package:taskflow_application/Classes/Device_Info.dart';
import 'package:taskflow_application/Drawers/app_drawer.dart';
import 'package:taskflow_application/Screens/Dashboards%20screens/dashboard%20widget/admin_option_widget.dart';
import 'package:taskflow_application/Screens/Dashboards%20screens/dashboard%20widget/team_lead_option_widget.dart';
import 'package:taskflow_application/Screens/Dashboards%20screens/dashboard%20widget/user_option_widget.dart';

class DashboardPage extends StatefulWidget {

  DashboardPage({super.key, required this.role});
  String role = "1";
  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(role: int.parse(widget.role)),
      body: Column(
        children: [
          pageHeaderContainer(),
        ],
      ),
    );
  }

  Widget customNavigationBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Builder(
              builder: (context) => IconButton(
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                  icon: const Icon(CupertinoIcons.line_horizontal_3)),
            ),
            const SizedBox(
              width: 10,
            ),
            //code for the greeting user
            RichText(
              text: TextSpan(children: [
                TextSpan(
                    text: "Hello, ",
                    style: TextStyle(
                        fontSize: DeviceInfo.fontSize + 1,
                        color: Colors.redAccent.shade700.withOpacity(0.7),
                        fontWeight: FontWeight.w500)),
                TextSpan(
                    text: Provider.of<UserDetail>(context, listen: false)
                            .fullname
                            .toString() ??
                        "User",
                    style: TextStyle(
                        fontSize: DeviceInfo.fontSize + 1,
                        color: Colors.black,
                        fontWeight: FontWeight.w500))
              ]),
            ),
          ],
        ),
        Row(
          children: [
            IconButton(onPressed: () {}, icon: const Icon(CupertinoIcons.bell)),
            const SizedBox(
              width: 10,
            ),
            Material(
              elevation: 4,
              borderRadius: BorderRadius.circular(20),
              child: const CircleAvatar(
                  backgroundImage: AssetImage("assets/images/icreativez.png")),
            )
          ],
        )
      ],
    );
  }

  Widget gridButtons() {
    return widget.role == "1"
        ? const AdminDashboardButtons()
        : widget.role == "2"
            ? const TeamLeadDashboardButtons()
            : const UserDashboardButtons();
  }

  //code for the page header which contains the navigation bar and the gridview buttons
  Widget pageHeaderContainer() {
    return Material(
      elevation: 6,
      borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(40), bottomRight: Radius.circular(40)),
      child: Container(
          height: MediaQuery.of(context).size.height / 2 + 40,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40)),
              color: Colors.white),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                SizedBox(
                  height: DeviceInfo.height * 0.05,
                ),
                //my custom navigation bar
                customNavigationBar(),

                //here is the code for the custom gridview boxes
                gridButtons()
              ],
            ),
          )),
    );
  }
}
