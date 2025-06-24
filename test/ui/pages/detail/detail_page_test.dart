import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail_image_network/mocktail_image_network.dart';

import 'package:wikcat/config/config.dart';
import 'package:wikcat/domain/domain.dart';
import 'package:wikcat/ui/common/presenter/breeds_presenter.dart';
import 'package:wikcat/ui/pages/detail/detail_page.dart';
import 'package:wikcat/ui/pages/detail/widgets/description_card.dart';

import '../../../mocks/breeds_data_mock.dart';

void main() {
  late MockBreedsGateway mockGateway;

  setUp(() {
    mockGateway = MockBreedsGateway();
  },);

  Widget createTestWidget(BreedModel breed, {List<Locale> supportedLocales = AppLocalizations.supportedLocales}) {
    return ProviderScope(
      overrides: [
        Providers.breedsPresenterProvider.overrideWith(
            (ref) => BreedsPresenter(
            useCase: BreedsUseCase(breedsGateway: mockGateway)
          ),
        ),
      ],
      child: MaterialApp(
        home: DetailPage(breed: breed,),
        supportedLocales: supportedLocales,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        theme: AppTheme(false).getTheme()
      ),
    );
  }

  testWidgets(
    'test DetailPage for success showed data',
    (widgetTester) async {
      await mockNetworkImages(() async {
        await widgetTester.pumpWidget(createTestWidget(BreedsDataMocks.withImageBreedObject));
      });
      await widgetTester.pump(const Duration(milliseconds: 100));

      expect(find.byType(DetailPage), findsOneWidget);
      expect(find.text(BreedsDataMocks.withImageBreedObject.name), findsOneWidget);
      expect(find.byType(DescriptionCard), findsOneWidget);
      expect(find.text(BreedsDataMocks.withImageBreedObject.description), findsOneWidget);
      expect(find.byType(Image), findsOneWidget);
    },
  );

  testWidgets(
    'test DetailPage for success showed data - es locale',
        (widgetTester) async {
      await mockNetworkImages(() async {
        await widgetTester.pumpWidget(createTestWidget(
          BreedsDataMocks.withImageBreedObject,
          supportedLocales: <Locale>[
            Locale('es')
          ],
        ));
      });
      await widgetTester.pump(const Duration(milliseconds: 100));

      expect(find.byType(DetailPage), findsOneWidget);
      expect(find.text(BreedsDataMocks.withImageBreedObject.name), findsOneWidget);
      expect(find.byType(DescriptionCard), findsOneWidget);
      expect(find.text(BreedsDataMocks.withImageBreedObject.description), findsOneWidget);
      expect(find.byType(Image), findsOneWidget);
    },
  );

  testWidgets(
    'test DetailPage for success showed data object two',
        (widgetTester) async {
      await widgetTester.pumpWidget(createTestWidget(BreedsDataMocks.secondBreedObject));
      await widgetTester.pump(const Duration(milliseconds: 100));

      expect(find.byType(DetailPage), findsOneWidget);
      expect(find.text(BreedsDataMocks.secondBreedObject.name), findsOneWidget);
      expect(find.byType(DescriptionCard), findsOneWidget);
      expect(find.text(BreedsDataMocks.secondBreedObject.description), findsOneWidget);
    },
  );
}