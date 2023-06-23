import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:login/camera.dart';
import 'package:login/home.dart';
import 'package:login/loginsignup.dart';
import 'package:login/profile.dart';
import 'package:login/register.dart';
import 'package:login/shopping_cart_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: 'login',
    routes: {
      'login': (context) => const Mylogin(),
      'register': (context) => const MyRegister(),
      'home': (context) => MyHomePage(),
      'camera': (context) => ImagePickerExample(),
      'Profile': (context) => Profile(),
      'shopping': (context) => ShoppingCartPage(),
      'location': (context) => MyLocation(),
    },
  ));
}

void addUser(String email, String password) {
  FirebaseFirestore.instance.collection('users').add({
    'email': email,
    'password': password,
  }).then((value) {
    print("User added successfully");
  }).catchError((error) {
    print("Failed to add user: $error");
  });
}

class MyApp extends StatelessWidget {
  const MyApp({required Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Mylogin(),
    );
  }
}

class Shopping extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shopping',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/cart': (context) => ShoppingCartPage(),
      },
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text('Shopping'),
          onPressed: () {
            Navigator.pushNamed(context, '/cart');
          },
        ),
      ),
    );
  }
}

class MyLocation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '',
      initialRoute: '/',
      routes: {
        '/': (context) => Location(),
        '/my_location': (context) => MyLocation(),
      },
    );
  }
}

class Location extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, '/my_location');
          },
          child: Text('location'),
        ),
      ),
    );
  }
}
