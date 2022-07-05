import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:animaldex/domain/entities/animal.dart';
import 'package:animaldex/states/animal/animal_bloc.dart';
import 'package:animaldex/states/animal/animal_state.dart';

class AnimalStateSelector<T> extends BlocSelector<AnimalBloc, AnimalState, T> {
  AnimalStateSelector({
    required T Function(AnimalState) selector,
    required Widget Function(T) builder,
  }) : super(
          selector: selector,
          builder: (_, value) => builder(value),
        );
}

class AnimalStateStatusSelector extends AnimalStateSelector<AnimalStateStatus> {
  AnimalStateStatusSelector(Widget Function(AnimalStateStatus) builder)
      : super(
          selector: (state) => state.status,
          builder: builder,
        );
}

class AnimalCanLoadMoreSelector extends AnimalStateSelector<bool> {
  AnimalCanLoadMoreSelector(Widget Function(bool) builder)
      : super(
          selector: (state) => state.canLoadMore,
          builder: builder,
        );
}

class NumberOfAnimalsSelector extends AnimalStateSelector<int> {
  NumberOfAnimalsSelector(Widget Function(int) builder)
      : super(
          selector: (state) => state.animals.length,
          builder: builder,
        );
}

class CurrentAnimalSelector extends AnimalStateSelector<Animal> {
  CurrentAnimalSelector(Widget Function(Animal) builder)
      : super(
          selector: (state) => state.selectedAnimal,
          builder: builder,
        );
}

class AnimalSelector extends AnimalStateSelector<AnimalSelectorState> {
  AnimalSelector(int index, Widget Function(Animal, bool) builder)
      : super(
          selector: (state) => AnimalSelectorState(
            state.animals[index],
            state.selectedAnimalIndex == index,
          ),
          builder: (value) => builder(value.animal, value.selected),
        );
}

class AnimalSelectorState {
  final Animal animal;
  final bool selected;

  const AnimalSelectorState(this.animal, this.selected);

  @override
  bool operator ==(Object other) =>
      other is AnimalSelectorState && animal == other.animal && selected == other.selected;
}
