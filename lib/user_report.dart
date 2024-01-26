import 'dart:convert';
import 'dart:typed_data';
import 'dart:io';
import 'user_report_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:file_picker/file_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/services.dart';

class UserReportPage extends StatefulWidget {
  @override
  _UserReportPageState createState() => _UserReportPageState();
}

class _UserReportPageState extends State<UserReportPage> {
  TextEditingController descriptionController = TextEditingController();
  Uint8List? selectedImageBytes;

  void _sendReport(UserReportModel userReportModel) async {
    String username = "User1";
    String description = descriptionController.text;

    // Display landslide image
    String base64Image = await _loadLandslideImage();
    userReportModel.updateReport(username, description, base64Image);

    // Show a dialog box
    _showSuccessDialog();

    // Clear the text fields after updating the report
    descriptionController.clear();

    // Clear the selected image
    setState(() {
      selectedImageBytes = null;
    });
  }

  Future<String> _loadLandslideImage() async {
    ByteData data = await rootBundle.load('assets/landslide.jpeg');
    List<int> bytes = data.buffer.asUint8List();
    return base64Encode(Uint8List.fromList(bytes));
  }

  Future<void> _pickImage() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg', 'jpeg', 'png'],
    );

    setState(() {
      if (result != null && result.files.isNotEmpty) {
        selectedImageBytes = result.files.single.bytes;
      } else {
        print('No valid image selected');
      }
    });
  }

  Future<void> _showSuccessDialog() async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Report Sent'),
          content: Text('Your report has been sent successfully!'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'User Report',
          style: TextStyle(color: Colors.white), // Set text color of the title
        ),
        backgroundColor: Colors.blue, // Set the background color of the AppBar
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Consumer<UserReportModel>(
          builder: (context, userReportModel, child) {
            return ListView(
              children: [
                TextField(
                  controller: descriptionController,
                  decoration: InputDecoration(labelText: 'Description'),
                ),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: _pickImage,
                  child: Text('Pick Image'),
                ),
                if (selectedImageBytes != null)
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.memory(selectedImageBytes!),
                  ),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () => _sendReport(userReportModel),
                  child: Text('Send Report'),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
