import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stream_transform/stream_transform.dart';
import 'package:animaldex/data/repositories/animal_repository.dart';
import 'package:animaldex/states/animal/animal_event.dart';
import 'package:animaldex/states/animal/animal_state.dart';

class AnimalBloc extends Bloc<AnimalEvent, AnimalState> {
  static const int animalsPerPage = 10;

  final AnimalRepository _animalRepository;

  AnimalBloc(this._animalRepository) : super(AnimalState.initial()) {
    on<AnimalLoadStarted>(
      _onLoadStarted,
      transformer: (events, mapper) => events.switchMap(mapper),
    );
    on<AnimalLoadMoreStarted>(
      _onLoadMoreStarted,
      transformer: (events, mapper) => events.switchMap(mapper),
    );
    on<AnimalSelectChanged>(_onSelectChanged);
  }

  void _onLoadStarted(AnimalLoadStarted event, Emitter<AnimalState> emit) async {
    try {
      emit(state.asLoading());

      final animals = event.loadAll
          ? await _animalRepository.getAllAnimals()
          : await _animalRepository.getAnimals(page: 1, limit: animalsPerPage);

      final canLoadMore = animals.length >= animalsPerPage;

      emit(state.asLoadSuccess(animals, canLoadMore: canLoadMore));
    } on Exception catch (e) {
      emit(state.asLoadFailure(e));
    }
  }

  void _onLoadMoreStarted(AnimalLoadMoreStarted event, Emitter<AnimalState> emit) async {
    try {
      if (!state.canLoadMore) return;

      emit(state.asLoadingMore());

      final animals = await _animalRepository.getAnimals(
        page: state.page + 1,
        limit: animalsPerPage,
      );

      final canLoadMore = animals.length >= animalsPerPage;

      emit(state.asLoadMoreSuccess(animals, canLoadMore: canLoadMore));
    } on Exception catch (e) {
      emit(state.asLoadMoreFailure(e));
    }
  }

  void _onSelectChanged(AnimalSelectChanged event, Emitter<AnimalState> emit) async {
    try {
      final animalIndex = state.animals.indexWhere(
        (animal) => animal.id == event.animalId,
      );

      if (animalIndex < 0 || animalIndex >= state.animals.length) return;

      final animal = await _animalRepository.getAnimal(event.animalId);

      if (animal == null) return;

      emit(state.copyWith(
        animals: state.animals..setAll(animalIndex, [animal]),
        selectedAnimalIndex: animalIndex,
      ));
    } on Exception catch (e) {
      emit(state.asLoadMoreFailure(e));
    }
  }
}
