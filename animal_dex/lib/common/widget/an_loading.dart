import 'package:flutter/material.dart';

class AnLoading extends StatelessWidget {
  const AnLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: CircularProgressIndicator()),
    );
  }
}
