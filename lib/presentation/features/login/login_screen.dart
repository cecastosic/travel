import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:travel/presentation/features/list/list_screen.dart';
import 'package:travel/presentation/widgets/button.dart';
import 'package:go_router/go_router.dart';
import 'package:travel/providers/google_sign_in_provider.dart';
import 'package:travel/providers/login_provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  static const path = '/login';
  static const name = 'login';

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text("Book a Hotel"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AppButton(
                label: 'Login as guest',
                onPressed: () => {
                  context.read<LoginInfo>().login('guest'),
                },
              ),
              ElevatedButton.icon(
                  label: const Text('Sign up with Google'),
                  icon: const FaIcon(FontAwesomeIcons.google),
                  onPressed: () {
                    final provider = Provider.of<GoogleSignInProvider>(context,
                        listen: false);
                    provider.googleLogin();
                  }),
            ],
          ),
        ),
      );
}
