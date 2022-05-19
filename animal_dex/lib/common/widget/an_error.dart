import 'package:flutter/material.dart';

class AnError extends StatelessWidget {
  const AnError({Key? key, this.error}) : super(key: key);
  final String? error;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text(error ?? 'Erro ao carregar dados!')),
    );
  }
}
