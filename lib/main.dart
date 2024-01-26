import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'message_provider.dart';
import 'marker_provider.dart';
import 'login_page.dart';
import 'user_report_model.dart'; // Import the UserReportModel

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => MessageProvider()),
        ChangeNotifierProvider(create: (context) => MarkerProvider()),
        ChangeNotifierProvider(
          create: (context) => UserReportModel(),
        ), // Add this line
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PrepareGuard',
      theme: ThemeData(
        primarySwatch: Colors.blue, // You can customize this color
      ),
      home: LoginPage(),
    );
  }
}
