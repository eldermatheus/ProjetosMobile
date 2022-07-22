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
              label: 'Taxonomia',
              child: _AnimalAbout(animal),
            ),
            MainTabData(
              label: 'Distribuição',
              child: _AnimalBaseStats(animal),
            ),
            MainTabData(
              label: 'Copyright',
              child: _AnimalCopyright(animal),
            ),
            /*MainTabData(
              label: 'Guia 4',
              child: Align(
                alignment: Alignment.topCenter,
                child: Text('Under development'),
              ),
            ),*/
          ],
        );
      }),
    );
  }
}
