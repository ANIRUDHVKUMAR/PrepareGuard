import 'package:flutter/material.dart';
import 'user_page.dart';
import 'admin_page.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PrepareGuard'),
        backgroundColor: Colors.blue, // Set the background color of the AppBar
        centerTitle: true, // Center the title in the AppBar
        elevation: 0, // Remove the shadow below the AppBar
      ),
      body: Center(
        child: LoginForm(),
      ),
    );
  }
}

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/pg.png', height: 200, width: 200),
          SizedBox(height: 40),
          TextField(
            controller: _usernameController,
            decoration: InputDecoration(labelText: 'Username'),
          ),
          SizedBox(height: 10),
          TextField(
            controller: _passwordController,
            obscureText: true,
            decoration: InputDecoration(labelText: 'Password'),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              if (_usernameController.text == 'User1' &&
                  _passwordController.text == 'asd') {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => UserPage()),
                );
              } else if (_usernameController.text == 'Admin1' &&
                  _passwordController.text == 'asd') {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AdminPage()),
                );
              } else {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Login Failed'),
                      content: Text(
                          'Incorrect username or password. Please try again.'),
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
            },
            style: ElevatedButton.styleFrom(
              primary: Colors.blue, // Set the button color to blue
            ),
            child: Text('Login'),
          ),
        ],
      ),
    );
  }
}
