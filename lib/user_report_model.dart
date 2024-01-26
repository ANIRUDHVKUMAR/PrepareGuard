import 'package:flutter/material.dart';

class Report {
  String username;
  String description;
  String image;

  Report({
    required this.username,
    required this.description,
    required this.image,
  });
}

class UserReportModel extends ChangeNotifier {
  List<Report> reports = [];

  void updateReport(String username, String description, String image) {
    Report newReport = Report(
      username: username,
      description: description,
      image: image,
    );
    reports.add(newReport);
    notifyListeners();
  }
}
