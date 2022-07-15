import '../../core/usecase.dart';
import '../../data/repositories/animal_repository.dart';
import '../entities/animal.dart';

class GetAllAnimalsUseCase extends NoParamsUseCase<List<Animal>> {
  const GetAllAnimalsUseCase(this.repository);

  final AnimalRepository repository;

  @override
  Future<List<Animal>> call() {
    return repository.getAllAnimals();
  }
}

class GetAnimalsParams {
  const GetAnimalsParams({
    required this.page,
    required this.limit,
  });

  final int page;
  final int limit;
}

class GetAnimalsUseCase extends UseCase<List<Animal>, GetAnimalsParams> {
  const GetAnimalsUseCase(this.repository);

  final AnimalRepository repository;

  @override
  Future<List<Animal>> call(GetAnimalsParams params) {
    return repository.getAnimals(page: params.page, limit: params.limit);
  }
}

class GetAnimalParam {
  final String id;

  const GetAnimalParam(this.id);
}

class GetAnimalUseCase extends UseCase<Animal?, GetAnimalParam> {
  final AnimalRepository repository;

  const GetAnimalUseCase(this.repository);

  @override
  Future<Animal?> call(GetAnimalParam params) {
    return repository.getAnimal(params.id);
  }
}
