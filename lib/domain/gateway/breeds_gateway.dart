import '../model/breed_model.dart';
import '../model/error_model.dart';

abstract class BreedsGateway {
  Future<(ErrorModel?, List<BreedModel>)> getBreeds();
  Future<(ErrorModel?, List<String>?)> getBreedImages(String breedId);
}