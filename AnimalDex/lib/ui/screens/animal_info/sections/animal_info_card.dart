part of '../animal_info.dart';

class _AnimalInfoCard extends StatefulWidget {
  static const double minCardHeightFraction = 0.54;

  const _AnimalInfoCard();

  @override
  State<_AnimalInfoCard> createState() => _AnimalInfoCardState();
}

class _AnimalInfoCardState extends State<_AnimalInfoCard> {
  AnimationController get slideController => AnimalInfoStateProvider.of(context).slideController;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final safeArea = MediaQuery.of(context).padding;
    final appBarHeight = AppBar().preferredSize.height;

    final cardMinHeight = screenHeight * _AnimalInfoCard.minCardHeightFraction;
    final cardMaxHeight = screenHeight - appBarHeight - safeArea.top;

    return AutoSlideUpPanel(
      minHeight: cardMinHeight,
      maxHeight: cardMaxHeight,
      onPanelSlide: (position) => slideController.value = position,
      child: CurrentAnimalSelector((animal) {
        return MainTabView(
          paddingAnimation: slideController,
          tabs: [
            MainTabData(
              label: 'Guia 1',
              child: _AnimalAbout(animal),
            ),
            MainTabData(
              label: 'Guia 2',
              child: _AnimalBaseStats(animal),
            ),
            MainTabData(
              label: 'Guia 3',
              child: Text('Under development'),
            ),
            MainTabData(
              label: 'Guia 4',
              child: Align(
                alignment: Alignment.topCenter,
                child: Text('Under development'),
              ),
            ),
          ],
        );
      }),
    );
  }
}
