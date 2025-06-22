import 'package:flutter/foundation.dart';

import '../../../../domain/domain.dart';
import '../interface/breeds_page_interface.dart';


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

  late final BreedsPageInterface interface;

  void onInit(BreedsPageInterface interface) {
    interface = interface;

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

    _getCatsBreedsImagesUrls();
  }

  void _getCatsBreedsImagesUrls() async {
    final auxCatsBreedsState = List<BreedModel>.from(catsBreedsList);

    for(var i=0; i<catsBreedsList.length; i++) {
      try {
        final (errorItem, catBreedImagesUrls) = await useCase.getBreedImages(catsBreedsList[i].id);

        if(errorItem != null) {
          auxCatsBreedsState[i] = auxCatsBreedsState[i].copyWith(
            imagesRequestStatus: RequestStatusEnum.error
          );
          continue;
        }

        auxCatsBreedsState[i] = auxCatsBreedsState[i].copyWith(
            imagesUrls: catBreedImagesUrls,
            imagesRequestStatus: RequestStatusEnum.complete
        );
      } catch(e) {
        auxCatsBreedsState[i] = auxCatsBreedsState[i].copyWith(
            imagesRequestStatus: RequestStatusEnum.error
        );
      }
    }

    catsBreedsList = auxCatsBreedsState;
    notifyListeners();
  }
  
}