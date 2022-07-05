import 'package:flutter/material.dart';

class AnimalInfoStateProvider extends InheritedWidget {
  final AnimationController slideController;
  final AnimationController rotateController;

  const AnimalInfoStateProvider({
    Key? key,
    required this.slideController,
    required this.rotateController,
    required Widget child,
  }) : super(child: child);

  static AnimalInfoStateProvider of(BuildContext context) {
    final result = context.dependOnInheritedWidgetOfExactType<AnimalInfoStateProvider>();

    return result!;
  }

  @override
  bool updateShouldNotify(covariant AnimalInfoStateProvider oldWidget) => false;
}
