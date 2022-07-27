import 'package:animaldex/ui/screens/splash/splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Animaldex Text', (tester) async {
    await tester.pumpWidget(MaterialApp(
      home: SplashScreen(),
    ));

    expect(find.text("Animaldex"), findsOneWidget);
    expect(find.byType(Image), findsOneWidget);
  });
}
