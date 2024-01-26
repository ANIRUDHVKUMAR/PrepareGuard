import 'package:flutter/material.dart';
import 'admin_warning_system.dart';
import 'admin_relief_camp.dart';
import 'admin_emergency_help.dart';
import 'admin_report.dart'; // Import the AdminReportPage

class AdminPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'PreparGuard',
          style: TextStyle(color: Colors.white), // Set text color of the title
        ),
        backgroundColor:
            Colors.blueGrey, // Set the background color of the AppBar
      ),
      body: DefaultTabController(
        length: 4, // Assuming you have four tabs including the reports
        child: Column(
          children: [
            Expanded(
              child: TabBarView(
                physics: NeverScrollableScrollPhysics(),
                children: [
                  AdminWarningSystem(),
                  AdminReliefCampPage(),
                  AdminEmergencyHelp(),
                  AdminReportPage(), // Use the AdminReportPage
                ],
              ),
            ),
            Container(
              color: Colors.blue, // Set the background color of the TabBar
              child: TabBar(
                labelColor: Colors.white, // Set text color of selected tab
                unselectedLabelColor:
                    Colors.white70, // Set text color of unselected tabs
                indicatorColor:
                    Colors.white, // Set the color of the indicator line
                tabs: [
                  Tab(
                    icon: Icon(Icons.warning),
                    text: 'Warning System',
                  ),
                  Tab(
                    icon: Icon(Icons.location_on),
                    text: 'Relief Camp',
                  ),
                  Tab(
                    icon: Icon(Icons.chat),
                    text: 'Emergency Help',
                  ),
                  Tab(
                    icon: Icon(Icons.description),
                    text: 'Reports',
                  ), // Tab for Reports
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
