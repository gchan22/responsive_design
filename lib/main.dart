import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:responsive_design/firebase_options.dart';
import 'package:responsive_design/profile_card.dart';

void main()  async {

  //initialize the firbeas ervice before we display widgets
  //make sure flutter is ready before we call login service
  WidgetsFlutterBinding.ensureInitialized();
  

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Responsive Design',
      home: FutureBuilder(
        future: Firebase.initializeApp(
          options: DefaultFirebaseOptions.currentPlatform,
        ).then((value) {
          debugPrint("Firebase initialized successfully");
          return value;
        }),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Scaffold(
              body: Center(child: Text('Error: ${snapshot.error}')),
            );
          }
          if (snapshot.connectionState == ConnectionState.done) {
            return const ProfileCard();
          }
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        },
      ),
    );
  }
}


      
      