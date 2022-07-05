import 'package:animaldex/domain/entities/animal.dart';

enum AnimalStateStatus {
  initial,
  loading,
  loadSuccess,
  loadFailure,
  loadingMore,
  loadMoreSuccess,
  loadMoreFailure,
}

class AnimalState {
  final AnimalStateStatus status;
  final List<Animal> animals;
  final int selectedAnimalIndex;
  final int page;
  final Exception? error;
  final bool canLoadMore;

  Animal get selectedAnimal => animals[selectedAnimalIndex];

  const AnimalState._({
    this.status = AnimalStateStatus.initial,
    this.animals = const [],
    this.selectedAnimalIndex = 0,
    this.page = 1,
    this.canLoadMore = true,
    this.error,
  });

  const AnimalState.initial() : this._();

  AnimalState asLoading() {
    return copyWith(
      status: AnimalStateStatus.loading,
    );
  }

  AnimalState asLoadSuccess(List<Animal> animals, {bool canLoadMore = true}) {
    return copyWith(
      status: AnimalStateStatus.loadSuccess,
      animals: animals,
      page: 1,
      canLoadMore: canLoadMore,
    );
  }

  AnimalState asLoadFailure(Exception e) {
    return copyWith(
      status: AnimalStateStatus.loadFailure,
      error: e,
    );
  }

  AnimalState asLoadingMore() {
    return copyWith(status: AnimalStateStatus.loadingMore);
  }

  AnimalState asLoadMoreSuccess(List<Animal> newAnimals, {bool canLoadMore = true}) {
    return copyWith(
      status: AnimalStateStatus.loadMoreSuccess,
      animals: [...animals, ...newAnimals],
      page: canLoadMore ? page + 1 : page,
      canLoadMore: canLoadMore,
    );
  }

  AnimalState asLoadMoreFailure(Exception e) {
    return copyWith(
      status: AnimalStateStatus.loadMoreFailure,
      error: e,
    );
  }

  AnimalState copyWith({
    AnimalStateStatus? status,
    List<Animal>? animals,
    int? selectedAnimalIndex,
    int? page,
    bool? canLoadMore,
    Exception? error,
  }) {
    return AnimalState._(
      status: status ?? this.status,
      animals: animals ?? this.animals,
      selectedAnimalIndex: selectedAnimalIndex ?? this.selectedAnimalIndex,
      page: page ?? this.page,
      canLoadMore: canLoadMore ?? this.canLoadMore,
      error: error ?? this.error,
    );
  }
}
