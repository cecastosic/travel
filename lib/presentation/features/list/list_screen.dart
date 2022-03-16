import 'package:flutter/material.dart';
import 'package:travel/presentation/features/details/details_screen.dart';
import 'package:travel/presentation/widgets/button.dart';
import 'package:go_router/go_router.dart';

class ListScreen extends StatelessWidget {
  const ListScreen({Key? key}) : super(key: key);

  static const path = '/';
  static const name = 'list';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Book a Hotel"),
      ),
      body: Center(
        child: AppButton(
          label: 'Details page',
          onPressed: () => context.pushNamed(DetailsScreen.name),
        ),
      ),
    );
  }
}
