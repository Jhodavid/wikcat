import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:wikcat/infraestructure/driven_adapters/breeds_the_cap_api.dart';

import '../../domain/domain.dart';
import '../../ui/pages/breeds/breeds_page.dart';
import '../../ui/pages/breeds/presenter/breeds_presenter.dart';
import '../../ui/pages/detail/detail_page.dart';


final appRouter = GoRouter(
  initialLocation: BreedsPage.route,
  routes: [
    GoRoute(
      path: BreedsPage.route,
      builder: (context, state) {
        final breedsPresenterProvider = ChangeNotifierProvider<BreedsPresenter>(
          (ref) => BreedsPresenter(
            useCase: BreedsUseCase(breedsGateway: BreedsTheCapApi())
          ),
        );

        return BreedsPage(breedsPresenterProvider);
      }
    ),
    GoRoute(
      path: DetailPage.route,
      builder: (context, state) {
        final paramBreed = state.extra as BreedModel;

        return DetailPage(
          breed: paramBreed,
        );
      }
    )
  ],
  redirect: (context, state) {
    return null;
  },
);