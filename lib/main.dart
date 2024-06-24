import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:newpoll/createAccount.dart';
import 'package:newpoll/Profile.dart';
import 'package:newpoll/secondpagegetstartedsss.dart';
import 'package:newpoll/TapBar.dart';
import 'package:newpoll/ThoughtPass.dart';
import 'package:provider/provider.dart';
import 'CreatePassword.dart';
import 'Login.dart';
import 'Provider.dart';
import 'fontdoc.dart';
import 'comments.dart';
import 'firstPage.dart';
import 'ForgotMobile.dart';
import 'Homepage.dart';
import 'otp_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: FirebaseOptions(

  apiKey: "AIzaSyDyIc1kOD4qLQeTrSmaXhCAYU2qEASSGVE",
  authDomain: "polling-ad547.firebaseapp.com",
  projectId: "polling-ad547",
  storageBucket: "polling-ad547.appspot.com",
  messagingSenderId: "751099867980",
  appId: "1:751099867980:web:db7e4698566e0d804415e9"
      ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (context) => UserName()),
        ChangeNotifierProvider(
            create: (context) => ProvideNews())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: myTheme,
        home: const enter(),
      ),
    );
  }
}
