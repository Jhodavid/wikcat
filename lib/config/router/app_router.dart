import 'package:go_router/go_router.dart';

import '../../domain/domain.dart';
import '../../ui/pages/breeds/breeds_page.dart';
import '../../ui/pages/detail/detail_page.dart';

final appRouter = GoRouter(
  initialLocation: BreedsPage.route,
  routes: [
    GoRoute(
      path: BreedsPage.route,
      builder: (context, state) => BreedsPage()
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