import 'dart:math';

import 'package:flutter/material.dart' hide AnimatedSlide;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:animaldex/configs/colors.dart';
import 'package:animaldex/domain/entities/animal.dart';
import 'package:animaldex/states/animal/animal_bloc.dart';
import 'package:animaldex/states/animal/animal_event.dart';
import 'package:animaldex/states/animal/animal_selector.dart';
import 'package:animaldex/ui/screens/animal_info/state_provider.dart';
import 'package:animaldex/ui/widgets/animated_fade.dart';
import 'package:animaldex/ui/widgets/animated_slide.dart';
import 'package:animaldex/ui/widgets/auto_slideup_panel.dart';
import 'package:animaldex/ui/widgets/hero.dart';
import 'package:animaldex/ui/widgets/main_app_bar.dart';
import 'package:animaldex/ui/widgets/main_tab_view.dart';
import 'package:animaldex/ui/widgets/animal_image.dart';
import 'package:animaldex/ui/widgets/progress.dart';

part 'sections/background_decoration.dart';
part 'sections/animal_overall_info.dart';
part 'sections/animal_info_card.dart';
part 'sections/animal_info_card_taxon.dart';
part 'sections/animal_info_card_distri.dart';
part 'sections/animal_info_card_copyright.dart';

class AnimalInfo extends StatefulWidget {
  @override
  _AnimalInfoState createState() => _AnimalInfoState();
}

class _AnimalInfoState extends State<AnimalInfo> with TickerProviderStateMixin {
  late AnimationController _slideController;
  late AnimationController _rotateController;

  @override
  void initState() {
    _slideController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    );

    _rotateController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 5000),
    )..repeat();

    super.initState();
  }

  @override
  void dispose() {
    _slideController.dispose();
    _rotateController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimalInfoStateProvider(
      slideController: _slideController,
      rotateController: _rotateController,
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            _BackgroundDecoration(), // decoracao
            _AnimalInfoCard(), // card inferior
            _AnimalOverallInfo(), // card superior
          ],
        ),
      ),
    );
  }
}
