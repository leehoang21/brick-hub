import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';

@RoutePage()
class EmptyProvider extends StatelessWidget {
  const EmptyProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text('Empty page')),
    );
  }
}
