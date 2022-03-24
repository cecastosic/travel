import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travel/injection/injection.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:travel/presentation/routing/routing.dart';
import 'package:travel/providers/google_sign_in_provider.dart';
import 'package:travel/providers/login_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  const firebaseConfig = FirebaseOptions(
      apiKey: "AIzaSyCDRqFNK5PE8RkrnDn1zpjVpDzYFlZRhkU",
      authDomain: "travel-app-75543.firebaseapp.com",
      projectId: "travel-app-75543",
      storageBucket: "travel-app-75543.appspot.com",
      messagingSenderId: "938334089870",
      appId: "1:938334089870:web:c660e58b1ef69e4fca8fdf");

  try {
    if (Firebase.apps.isEmpty) {
      await Firebase.initializeApp(options: firebaseConfig).whenComplete(() {
        print("completedAppInitialize");
      });
    }
  } catch (e) {
    print(e);
  }
  configureDependencies();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final loginInfo = inject<LoginInfo>();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<LoginInfo>.value(
      value: loginInfo,
      child: ChangeNotifierProvider(
        create: (context) => GoogleSignInProvider(),
        child: MaterialApp.router(
          routeInformationParser: router.routeInformationParser,
          routerDelegate: router.routerDelegate,
          title: 'Travel app',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
        ),
      ),
    );
  }
}
