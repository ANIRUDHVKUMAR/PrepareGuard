import 'package:flutter/material.dart';
import 'user_relief_camp.dart';
import 'user_emergency_help.dart';
import 'user_warning_system.dart';
import 'user_report.dart'; // Import the UserReportPage
import 'provider.dart';

class UserPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Assuming you have a list of markers
    List<Marker> markers = [
      // Initialize your markers here
    ];

    return DefaultTabController(
      length: 4, // Increased the length to accommodate the new tab
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'PreparGuard',
            style:
                TextStyle(color: Colors.white), // Set text color of the title
          ),
          backgroundColor:
              Colors.blueGrey, // Set the background color of the AppBar
        ),
        body: Column(
          children: [
            Expanded(
              child: TabBarView(
                children: [
                  UserWarningSystem(),
                  UserReliefCampPage(),
                  UserEmergencyHelp(),
                  UserReportPage(), // Added UserReportPage as a tab
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
                    icon: Icon(Icons.report),
                    text: 'Report',
                  ), // Added a tab for UserReportPage
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
