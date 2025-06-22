import '../gateway/breeds_gateway.dart';
import '../model/breed_model.dart';
import '../model/error_model.dart';

class BreedsUseCase {
  final BreedsGateway breedsGateway;

  BreedsUseCase({
    required this.breedsGateway,
  });

  Future<(ErrorModel?, List<BreedModel>)> getBreeds()
    async => breedsGateway.getBreeds();

  Future<(ErrorModel?, List<String>?)> getBreedImages(String breedId)
    async => breedsGateway.getBreedImages(breedId);

}