import 'package:flutter/material.dart';

class RealtimedatabaseIn extends StatefulWidget {
  RealtimedatabaseIn({Key? key}) : super(key: key);
  @override
  RealtimedatabaseInState createState() => RealtimedatabaseInState();
}

class RealtimedatabaseInState extends State<RealtimedatabaseIn> {
  var firstnameController = new TextEditingController();
  var secondnameController = new TextEditingController();
  var EmailController = new TextEditingController();
  var passwordController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Text(
              "Enter Data",
              style: TextStyle(fontSize: 28),
            ),
            SizedBox(
              height: 30,
            ),
            TextFormField(
              controller: firstnameController,
              decoration: InputDecoration(
                  labelText: 'First Name', border: OutlineInputBorder()),
            ),
            SizedBox(
              height: 15,
            ),
            TextFormField(
              controller: secondnameController,
              decoration: InputDecoration(
                  labelText: 'Last Name', border: OutlineInputBorder()),
            ),
            SizedBox(
              height: 15,
            ),
            TextFormField(
              controller: EmailController,
              decoration: InputDecoration(
                  labelText: 'Email', border: OutlineInputBorder()),
            ),
            SizedBox(
              height: 15,
            ),
            TextFormField(
              controller: passwordController,
              decoration: InputDecoration(
                  labelText: 'Password', border: OutlineInputBorder()),
            ),
          ],
        ),
      ),
    );
  }
}
