abstract class AnimalEvent {
  const AnimalEvent();
}

class AnimalLoadStarted extends AnimalEvent {
  final bool loadAll;

  const AnimalLoadStarted({this.loadAll = false});
}

class AnimalLoadMoreStarted extends AnimalEvent {}

class AnimalSelectChanged extends AnimalEvent {
  final String animalId;

  const AnimalSelectChanged({required this.animalId});
}
