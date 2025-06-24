
import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:mocktail/mocktail.dart';
import 'package:wikcat/domain/domain.dart';
import 'package:wikcat/infraestructure/driven_adapters/breeds_the_cap_api.dart';
import 'package:wikcat/infraestructure/endpoints/wik_cat_endpoints.dart';

import '../../mocks/breeds_data_mock.dart';

void main() {
  late MockHttpClient client;

  setUp(() {
    client = MockHttpClient();
  },);

  group(
    'get Breeds test',
    () {
      test(
        'test when success get Breeds data',
            () async {
          final gateway = BreedsTheCapApi(client);

          when(() => client.get(
            Uri.parse(WikCatEndpoints.breeds),
            headers: BreedsTheCapApi.getHeaders(''),
          )).thenAnswer((_)
          async => Response.bytes(BreedsDataMocks.breedsListMapBytes, 200));

          final (error, data) = await gateway.getBreeds();

          expect(error, null);
          expect(data, isA<List<BreedModel>>());
          expect(data.length, BreedsDataMocks.breedsList.length);
        },
      );

      test(
        'test when Breeds data is empty',
            () async {
          final gateway = BreedsTheCapApi(client);

          when(() => client.get(
            Uri.parse(WikCatEndpoints.breeds),
            headers: BreedsTheCapApi.getHeaders(''),
          )).thenAnswer((_)
          async => Response.bytes(BreedsDataMocks.breedsEmptyListMapBytes, 200));

          final (error, data) = await gateway.getBreeds();

          expect(error, null);
          expect(data, isA<List<BreedModel>>());
          expect(data.length, 0);
        },
      );

      test(
        'test when error get Breeds data',
            () async {
          final gateway = BreedsTheCapApi(client);

          when(() => client.get(
            Uri.parse(WikCatEndpoints.breeds),
            headers: BreedsTheCapApi.getHeaders(''),
          )).thenAnswer((_)
          async => Response.bytes(BreedsDataMocks.breedsListMapBytes, 401));

          final (error, data) = await gateway.getBreeds();

          expect(error, isA<ErrorModel>());
          expect(data, isA<List<BreedModel>>());
          expect(data.length, 0);
        },
      );
    },
  );

  group(
    'get Breed Images test',
        () {
      test(
        'test when success get Breed Images data',
            () async {
          final gateway = BreedsTheCapApi(client);

          when(() => client.get(
            Uri.parse(WikCatEndpoints.images),
            headers: BreedsTheCapApi.getHeaders(''),
          )).thenAnswer((_)
          async => Response.bytes(BreedsDataMocks.breedImagesListMapBytes, 200));

          final (error, data) = await gateway.getBreedImages('');

          expect(error, null);
          expect(data, isA<List<String>>());
          expect(data.length, BreedsDataMocks.breedImagesListMap.length);
        },
      );

      test(
        'test when Breed Images data is empty',
            () async {
          final gateway = BreedsTheCapApi(client);

          when(() => client.get(
            Uri.parse(WikCatEndpoints.images),
            headers: BreedsTheCapApi.getHeaders(''),
          )).thenAnswer((_)
          async => Response.bytes(BreedsDataMocks.breedImagesEmptyListMapBytes, 200));

          final (error, data) = await gateway.getBreedImages('');

          expect(error, null);
          expect(data, isA<List<String>>());
          expect(data.length, 0);
        },
      );

      test(
        'test when error get Breed Images data',
            () async {
          final gateway = BreedsTheCapApi(client);

          when(() => client.get(
            Uri.parse(WikCatEndpoints.images),
            headers: BreedsTheCapApi.getHeaders(''),
          )).thenAnswer((_)
          async => Response.bytes(BreedsDataMocks.breedImagesEmptyListMapBytes, 401));

          final (error, data) = await gateway.getBreedImages('');

          expect(error, isA<ErrorModel>());
          expect(data, isA<List<String>>());
          expect(data.length, 0);
        },
      );
    },
  );
}