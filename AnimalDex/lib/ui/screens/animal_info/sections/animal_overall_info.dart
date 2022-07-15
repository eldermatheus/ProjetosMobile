part of '../animal_info.dart';

class _AnimalOverallInfo extends StatefulWidget {
  const _AnimalOverallInfo();

  @override
  _AnimalOverallInfoState createState() => _AnimalOverallInfoState();
}

class _AnimalOverallInfoState extends State<_AnimalOverallInfo> with TickerProviderStateMixin {
  static const double _animalSliderViewportFraction = 0.56;
  static const int _endReachedThreshold = 4;

  final GlobalKey _currentTextKey = GlobalKey();
  final GlobalKey _targetTextKey = GlobalKey();

  double textDiffLeft = 0.0;
  double textDiffTop = 0.0;
  late PageController _pageController;
  late AnimationController _horizontalSlideController;

  AnimalBloc get animalBloc => context.read<AnimalBloc>();
  AnimationController get slideController => AnimalInfoStateProvider.of(context).slideController;
  AnimationController get rotateController => AnimalInfoStateProvider.of(context).rotateController;

  Animation<double> get textFadeAnimation => Tween(begin: 1.0, end: 0.0).animate(slideController);
  Animation<double> get sliderFadeAnimation => Tween(begin: 1.0, end: 0.0).animate(CurvedAnimation(
        parent: slideController,
        curve: Interval(0.0, 0.5, curve: Curves.ease),
      ));

  @override
  void initState() {
    _horizontalSlideController = AnimationController(
      vsync: this,
      duration: Duration(microseconds: 300),
    )..forward();

    super.initState();
  }

  @override
  void didChangeDependencies() {
    final pageIndex = animalBloc.state.selectedAnimalIndex;

    _pageController = PageController(
      viewportFraction: _animalSliderViewportFraction,
      initialPage: pageIndex,
    );

    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _horizontalSlideController.dispose();
    _pageController.dispose();

    super.dispose();
  }

  void _calculateAnimalNamePosition() {
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      final targetTextBox = _targetTextKey.currentContext?.findRenderObject() as RenderBox?;
      final currentTextBox = _currentTextKey.currentContext?.findRenderObject() as RenderBox?;

      if (targetTextBox == null || currentTextBox == null) return;

      final targetTextPosition = targetTextBox.localToGlobal(Offset.zero);
      final currentTextPosition = currentTextBox.localToGlobal(Offset.zero);

      final newDiffLeft = targetTextPosition.dx - currentTextPosition.dx;
      final newDiffTop = targetTextPosition.dy - currentTextPosition.dy;

      if (newDiffLeft != textDiffLeft || newDiffTop != textDiffTop) {
        setState(() {
          textDiffLeft = newDiffLeft;
          textDiffTop = newDiffTop;
        });
      }
    });
  }

  void _onSelectedAnimalChanged(int index) {
    final animals = animalBloc.state.animals;
    final selectedAnimal = animals[index];

    animalBloc.add(AnimalSelectChanged(animalId: selectedAnimal.id));

    final shouldLoadMore = index >= animals.length - _endReachedThreshold;

    if (shouldLoadMore) {
      animalBloc.add(AnimalLoadMoreStarted());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        _buildAppBar(),
        SizedBox(height: 2),
        _buildAnimalName(),
        SizedBox(height: 9),
        _buildAnimalSlider(),
      ],
    );
  }

  AppBar _buildAppBar() {
    return MainAppBar(
      // A placeholder for easily calculate the translate of the animal name
      title: CurrentAnimalSelector((animal) {
        _calculateAnimalNamePosition();

        return Text(
          animal.name,
          key: _targetTextKey,
          style: TextStyle(
            color: Colors.transparent,
            fontWeight: FontWeight.w900,
            fontSize: 20,
          ),
        );
      }),
      rightIcon: Icons.favorite_border,
    );
  }

  Widget _buildAnimalName() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 26),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          AnimatedBuilder(
            animation: slideController,
            builder: (_, __) {
              final value = slideController.value;

              return Transform.translate(
                offset: Offset(textDiffLeft * value, textDiffTop * value),
                child: CurrentAnimalSelector((animal) {
                  return HeroText(
                    animal.commonName,
                    textKey: _currentTextKey,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w900,
                      fontSize: 28,
                      //fontSize: 36 - (36 - 28) * value,
                    ),
                  );
                }),
              );
            },
          ),
          AnimatedSlide(
            animation: _horizontalSlideController,
            child: AnimatedFade(
              animation: textFadeAnimation,
              child: CurrentAnimalSelector((animal) {
                return HeroText(
                  animal.id,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w900,
                    fontSize: 18,
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAnimalSlider() {
    final screenSize = MediaQuery.of(context).size;
    final sliderHeight = screenSize.height * 0.24;
    final animalSize = screenSize.height * 0.3;

    return AnimatedFade(
      animation: sliderFadeAnimation,
      child: SizedBox(
        width: screenSize.width,
        height: sliderHeight,
        child: Stack(
          children: <Widget>[
            NumberOfAnimalsSelector((numberOfAnimals) {
              return PageView.builder(
                allowImplicitScrolling: true,
                physics: BouncingScrollPhysics(),
                controller: _pageController,
                itemCount: numberOfAnimals,
                onPageChanged: _onSelectedAnimalChanged,
                itemBuilder: (_, index) {
                  return AnimalSelector(index, (animal, selected) {
                    return Container();
                    /*return AnimalImage(
                      animal: animal,
                      size: Size.square(animalSize),
                      padding: EdgeInsets.symmetric(
                        vertical: selected ? 0 : screenSize.height * 0.04,
                      ),
                      useHero: selected,
                    );*/
                  });
                },
              );
            }),
          ],
        ),
      ),
    );
  }
}
