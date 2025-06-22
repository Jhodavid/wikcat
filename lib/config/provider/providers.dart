import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/domain.dart';
import '../../infraestructure/driven_adapters/breeds_the_cap_api.dart';
import '../../ui/common/presenter/breeds_presenter.dart';

class Providers {

  static final breedsPresenterProvider = ChangeNotifierProvider<BreedsPresenter>(
      (ref) => BreedsPresenter(
      useCase: BreedsUseCase(breedsGateway: BreedsTheCapApi())
    ),
  );
}