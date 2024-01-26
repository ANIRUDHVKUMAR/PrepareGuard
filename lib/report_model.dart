// user_report_model.dart
import 'package:flutter/material.dart';

class UserReportModel with ChangeNotifier {
  String username = '';
  String description = '';
  String image = '';

  void updateReport(
      String newUsername, String newDescription, String newImage) {
    username = newUsername;
    description = newDescription;
    image = newImage;
    notifyListeners();
  }
}
