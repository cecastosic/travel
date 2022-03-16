import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travel/injection/injection.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:travel/presentation/routing/routing.dart';
import 'package:travel/providers/google_sign_in_provider.dart';
import 'package:travel/providers/login_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
