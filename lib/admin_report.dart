import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'user_report_model.dart';

class AdminReportPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Admin Report',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Consumer<UserReportModel>(
          builder: (context, userReportModel, child) {
            return ListView(
              children: userReportModel.reports.map((report) {
                return GestureDetector(
                  onTap: () {
                    _showDetailedReportDialog(context, report);
                  },
                  child: Container(
                    margin: EdgeInsets.only(bottom: 16),
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      '${report.description.split(' ').take(2).join(' ')}',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                );
              }).toList(),
            );
          },
        ),
      ),
    );
  }

  void _showDetailedReportDialog(BuildContext context, Report report) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Detailed Report'),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Username: ${report.username}'),
              SizedBox(height: 8),
              Text('Description: ${report.description}'),
              SizedBox(height: 8),
              if (report.image != null)
                Container(
                  width: double.infinity,
                  child: Image.asset(
                    'assets/landslide.jpeg', // Adjust the path accordingly
                    fit: BoxFit
                        .cover, // Use BoxFit.cover to maintain aspect ratio
                  ),
                ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Close'),
            ),
          ],
        );
      },
    );
  }
}
