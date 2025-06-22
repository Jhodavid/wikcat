import 'package:flutter/foundation.dart';

import '../../../../domain/domain.dart';

class BreedsPresenter extends ChangeNotifier {

  final BreedsUseCase useCase;

  RequestStatusEnum breedsLoadingStatus;
  List<BreedModel> catsBreedsList;
  List<BreedModel> filterCatsBreedsList;

  BreedsPresenter({
    required this.useCase,
    this.breedsLoadingStatus = RequestStatusEnum.none,
    this.catsBreedsList = const [],
    this.filterCatsBreedsList = const [],
  });

  void onInit() {
    getCatsBreeds();
  }

  void getCatsBreeds() async {
    breedsLoadingStatus = RequestStatusEnum.isLoading;
    notifyListeners();

    final (errorItem, catBreeds) = await useCase.getBreeds();

    if(errorItem != null) {
      breedsLoadingStatus = RequestStatusEnum.error;
      notifyListeners();
      return;
    }

    catsBreedsList = catBreeds;
    filterCatsBreedsList = catBreeds;
    breedsLoadingStatus = RequestStatusEnum.complete;
    notifyListeners();
  }

  Future<BreedModel> getCatBreedImageUrls(BreedModel breed) async {
    final (errorItem, catBreedImagesUrls) = await useCase.getBreedImages(breed.id);

    if(errorItem != null) {
      breed = breed.copyWith(imagesRequestStatus: RequestStatusEnum.error);
    } else {
      breed = breed.copyWith(
        imagesUrls: catBreedImagesUrls,
        imagesRequestStatus: RequestStatusEnum.complete
      );
    }

    return breed;
  }
}