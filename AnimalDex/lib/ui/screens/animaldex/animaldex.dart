import 'dart:async';

import 'package:animaldex/configs/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:animaldex/configs/durations.dart';
import 'package:animaldex/core/extensions/animation.dart';
import 'package:animaldex/domain/entities/animal.dart';
import 'package:animaldex/routes.dart';
import 'package:animaldex/states/animal/animal_bloc.dart';
import 'package:animaldex/states/animal/animal_event.dart';
import 'package:animaldex/states/animal/animal_selector.dart';
import 'package:animaldex/states/animal/animal_state.dart';
import 'package:animaldex/ui/modals/search_modal.dart';
import 'package:animaldex/ui/widgets/animal_card.dart';
import 'package:animaldex/ui/widgets/animated_overlay.dart';
import 'package:animaldex/ui/widgets/fab.dart';
import 'package:animaldex/ui/widgets/main_app_bar.dart';
import 'package:animaldex/ui/widgets/animal_refresh_control.dart';

part 'sections/menu_suspenso.dart';
part 'sections/animal_grid.dart';

class AnimaldexScreen extends StatefulWidget {
  const AnimaldexScreen();

  @override
  State<StatefulWidget> createState() => _AnimaldexScreenState();
}

class _AnimaldexScreenState extends State<AnimaldexScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _AnimalGrid(),
          _FabMenu(),
        ],
      ),
    );
  }
}
