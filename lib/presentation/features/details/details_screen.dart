import 'package:flutter/material.dart';
import 'package:travel/presentation/features/list/list_screen.dart';
import 'package:travel/presentation/widgets/button.dart';
import 'package:go_router/go_router.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({Key? key}) : super(key: key);

  static const path = 'details';
  static const name = 'details';

  @override
  Widget build(BuildContext context) {
    final router = GoRouter.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Book a Hotel"),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AppButton(
              label: 'Go back',
              onPressed: () => context.goNamed(ListScreen.name),
            ),
            Text(router.location),
          ],
        ),
      ),
    );
  }
}
