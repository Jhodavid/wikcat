
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:wikcat/config/config.dart';
import 'package:wikcat/domain/domain.dart';
import 'package:wikcat/ui/common/common.dart';
import 'package:wikcat/ui/common/presenter/breeds_presenter.dart';
import 'package:wikcat/ui/pages/breeds/breeds_page.dart';
import 'package:wikcat/ui/pages/breeds/widgets/breed_card.dart';
import 'package:wikcat/ui/pages/breeds/widgets/no_results_message.dart';

import '../../../mocks/breeds_data_mock.dart';

void main() {
  late MockBreedsGateway mockGateway;

  setUp(() {
    mockGateway = MockBreedsGateway();
  },);

  Widget createTestWidget({List<Locale> supportedLocales = AppLocalizations.supportedLocales}) {
    return ProviderScope(
      overrides: [
        Providers.breedsPresenterProvider.overrideWith(
              (ref) => BreedsPresenter(
              useCase: BreedsUseCase(breedsGateway: mockGateway)
          ),
        ),
      ],
      child: MaterialApp(
          home: BreedsPage(),
          supportedLocales: supportedLocales,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          theme: AppTheme(false).getTheme()
      ),
    );
  }

  testWidgets(
    'test BreedsPage when getBreeds return a empty data',
    (widgetTester) async {
      when(() => mockGateway.getBreeds()).thenAnswer(
        (_) async => (null, BreedsDataMocks.emptyList));

      await widgetTester.pumpWidget(createTestWidget());
      await widgetTester.pump(const Duration(milliseconds: 500));

      expect(find.byType(BreedsPage), findsOneWidget);
      expect(find.byType(NoResultsMessage), findsOneWidget);
    },
  );

  testWidgets(
    'test BreedsPage when getBreeds return a empty data  - es locale',
        (widgetTester) async {
      when(() => mockGateway.getBreeds()).thenAnswer(
        (_) async => (null, BreedsDataMocks.emptyList));

      await widgetTester.pumpWidget(
        createTestWidget(supportedLocales: <Locale>[
          Locale('es')
        ]),
      );
      await widgetTester.pump(const Duration(milliseconds: 500));

      expect(find.byType(BreedsPage), findsOneWidget);
      expect(find.byType(NoResultsMessage), findsOneWidget);
    },
  );


  testWidgets(
    'test BreedsPage when getBreeds return a error data',
        (widgetTester) async {
      when(() => mockGateway.getBreeds()).thenAnswer(
        (_) async => (BreedsDataMocks.defaultError, BreedsDataMocks.emptyList));

      await widgetTester.pumpWidget(createTestWidget());
      await widgetTester.pump(const Duration(milliseconds: 500));

      expect(find.byType(BreedsPage), findsOneWidget);
      expect(find.byType(NetworkErrorMessage), findsOneWidget);
    },
  );

  testWidgets(
    'test BreedsPage when getBreeds return list of breeds data',
      (widgetTester) async {
      when(() => mockGateway.getBreeds()).thenAnswer(
        (_) async => (null, BreedsDataMocks.breedsList));

      await widgetTester.pumpWidget(createTestWidget());
      await widgetTester.pump(const Duration(milliseconds: 500));

      expect(find.byType(BreedsPage), findsOneWidget);
      expect(find.byType(BreedCard), findsWidgets);
    },
  );
}