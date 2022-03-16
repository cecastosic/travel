import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:travel/presentation/widgets/button.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  static const path = '/profile';
  static const name = 'profile';

  @override
  Widget build(BuildContext context) {
    final User? user = FirebaseAuth.instance.currentUser;

    return Scaffold(
      appBar: AppBar(
        title: Text('Hello ${user!.displayName}'),
      ),
      body: Center(
        child: AppButton(
          label: 'Log out',
          onPressed: () => FirebaseAuth.instance.signOut(),
        ),
      ),
    );
  }
}
