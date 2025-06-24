
import 'package:flutter_test/flutter_test.dart';
import 'package:wikcat/domain/domain.dart';

import '../../mocks/breeds_data_mock.dart';

void main() {

  test(
    'test BreedModel copyWith',
    () {
      BreedModel object = BreedsDataMocks.firstBreedObject;

      expect(object.name, 'Abyssinian');
      expect(object.origin, 'Egypt');
      expect(object.description, 'Active, Energetic, Independent, Intelligent, Gentle');

      object = object.copyWith(
        name: 'Mestizo',
        origin: 'Colombia',
        description: 'Funny',
      );

      expect(object.name, 'Mestizo');
      expect(object.origin, 'Colombia');
      expect(object.description, 'Funny');
    },
  );
}