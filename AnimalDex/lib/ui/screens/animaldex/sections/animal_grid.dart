part of '../animaldex.dart';

class _AnimalGrid extends StatefulWidget {
  const _AnimalGrid();

  @override
  _AnimalGridState createState() => _AnimalGridState();
}

class _AnimalGridState extends State<_AnimalGrid> {
  static const double _endReachedThreshold = 200;

  final GlobalKey<NestedScrollViewState> _scrollKey = GlobalKey();

  AnimalBloc get animalBloc => context.read<AnimalBloc>();

  @override
  void initState() {
    super.initState();

    scheduleMicrotask(() {
      animalBloc.add(AnimalLoadStarted());
      _scrollKey.currentState?.innerController.addListener(_onScroll);
    });
  }

  @override
  void dispose() {
    _scrollKey.currentState?.innerController.dispose();
    _scrollKey.currentState?.dispose();

    super.dispose();
  }

  void _onScroll() {
    final innerController = _scrollKey.currentState?.innerController;

    if (innerController == null || !innerController.hasClients) return;

    final thresholdReached = innerController.position.extentAfter < _endReachedThreshold;

    if (thresholdReached) {
      // Load more!
      animalBloc.add(AnimalLoadMoreStarted());
    }
  }

  Future _onRefresh() async {
    animalBloc.add(AnimalLoadStarted());

    return animalBloc.stream.firstWhere((e) => e.status != AnimalStateStatus.loading);
  }

  void _onAnimalPress(Animal animal) {
    animalBloc.add(AnimalSelectChanged(animalId: animal.id));

    AppNavigator.push(Routes.animalInfo, animal);
  }

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      key: _scrollKey,
      headerSliverBuilder: (_, __) => [
        MainSliverAppBar(),
      ],
      body: AnimalStateStatusSelector((status) {
        switch (status) {
          case AnimalStateStatus.loading:
            return _buildLoading();
          case AnimalStateStatus.loadSuccess:
          case AnimalStateStatus.loadMoreSuccess:
          case AnimalStateStatus.loadingMore:
            return _buildGrid();
          case AnimalStateStatus.loadFailure:
          case AnimalStateStatus.loadMoreFailure:
            return _buildError();

          /*case AnimalStateStatus.loading:
            //return _buildLoading();
            return Container(
              constraints: BoxConstraints.expand(),
              padding: EdgeInsets.all(28),
              alignment: Alignment.bottomLeft,
              child: Text(
                'Container carrengando',
                style: TextStyle(
                  fontSize: 30,
                  height: 1.6,
                  fontWeight: FontWeight.w900,
                ),
              ),
            );

          case AnimalStateStatus.loadSuccess:
          case AnimalStateStatus.loadMoreSuccess:
          case AnimalStateStatus.loadingMore:
            //return _buildGrid();
            return Container(
              constraints: BoxConstraints.expand(),
              padding: EdgeInsets.all(28),
              alignment: Alignment.bottomLeft,
              child: Text(
                'Container abriu',
                style: TextStyle(
                  fontSize: 30,
                  height: 1.6,
                  fontWeight: FontWeight.w900,
                ),
              ),
            );

          case AnimalStateStatus.loadFailure:
          case AnimalStateStatus.loadMoreFailure:
            return Container(
              constraints: BoxConstraints.expand(),
              padding: EdgeInsets.all(28),
              alignment: Alignment.bottomLeft,
              child: Text(
                'Container Falhou',
                style: TextStyle(
                  fontSize: 30,
                  height: 1.6,
                  fontWeight: FontWeight.w900,
                ),
              ),
            );
          //return _buildError();*/

          default:
            return Container(
              constraints: BoxConstraints.expand(),
              padding: EdgeInsets.all(28),
              alignment: Alignment.bottomLeft,
              child: Text(
                'Container teste 3',
                style: TextStyle(
                  fontSize: 30,
                  height: 1.6,
                  fontWeight: FontWeight.w900,
                ),
              ),
            );
        }
      }),
    );
  }

  Widget _buildLoading() {
    return Center(
      child: Container(
        constraints: BoxConstraints.expand(),
        padding: EdgeInsets.all(28),
        alignment: Alignment.bottomLeft,
        child: Text(
          'Bem vindo ao \nAnimalDex',
          style: TextStyle(
            fontSize: 30,
            height: 1.6,
            fontWeight: FontWeight.w900,
          ),
        ),
      ), //child: Image(image: AppImages.load),
    );
  }

  Widget _buildGrid() {
    return CustomScrollView(
      slivers: [
        AnimalRefreshControl(onRefresh: _onRefresh),
        SliverPadding(
          padding: EdgeInsets.all(10),
          sliver: NumberOfAnimalsSelector((numberOfAnimals) {
            return SliverGrid(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1.0,
                crossAxisSpacing: 5,
                mainAxisSpacing: 5,
              ),
              delegate: SliverChildBuilderDelegate(
                (_, index) {
                  return AnimalSelector(index, (animal, _) {
                    return AnimalCard(
                      animal,
                      onPress: () => _onAnimalPress(animal),
                    );
                  });
                },
                childCount: numberOfAnimals,
              ),
            );
          }),
        ),
        SliverToBoxAdapter(
          child: AnimalCanLoadMoreSelector((canLoadMore) {
            if (!canLoadMore) {
              return SizedBox.shrink();
            }
            return Container(
              padding: EdgeInsets.only(bottom: 28),
              alignment: Alignment.center,
            );
          }),
        ),
      ],
    );
  }

  Widget _buildError() {
    return CustomScrollView(
      slivers: [
        AnimalRefreshControl(onRefresh: _onRefresh),
        SliverFillRemaining(
          child: Container(
            padding: EdgeInsets.only(bottom: 28),
            alignment: Alignment.center,
            child: Icon(
              Icons.warning_amber_rounded,
              size: 60,
              color: Colors.black26,
            ),
          ),
        ),
      ],
    );
  }
}
