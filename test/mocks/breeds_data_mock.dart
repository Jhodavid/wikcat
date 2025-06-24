import 'dart:convert';

import 'package:http/http.dart';
import 'package:mocktail/mocktail.dart';
import 'package:wikcat/domain/domain.dart';

class MockBreedsGateway extends Mock implements BreedsGateway {}

class MockHttpClient extends Mock implements Client {}

class BreedsDataMocks {

  static final List<BreedModel> emptyList = [];

  static final ErrorModel defaultError = ErrorModel(name: 'Default error');

  static final withImageBreedObject = BreedModel(
    id: 'abys',
    name: 'Abyssinian',
    weight: '3 - 5 kg',
    origin: 'Egypt',
    lifeSpan: '14 - 15',
    description: 'Active, Energetic, Independent, Intelligent, Gentle',
    imagesUrls: ['https://example.com/image.jpg'],
    imagesRequestStatus: RequestStatusEnum.complete,
    adaptability: 5,
    affectionLevel: 5,
    childFriendly: 4,
    dogFriendly: 4,
    energyLevel: 5,
    grooming: 1,
    healthIssues: 2,
    intelligence: 5,
    sheddingLevel: 2,
    socialNeeds: 4,
    strangerFriendly: 5,
    vocalisation: 3,
    experimental: 0,
    hairless: 0,
    natural: 1,
    rare: 0,
    rex: 0,
    suppressedTail: 0,
    shortLegs: 0,
    hypoallergenic: 0,
    cfaUrl: 'https://cfa.org/abyssinian/',
    vetStreetUrl: 'https://www.vetstreet.com/cats/abyssinian',
    vcaHospitalsUrl: 'https://vcahospitals.com/know-your-pet/cat-breeds/abyssinian',
    wikipediaUrl: 'https://en.wikipedia.org/wiki/Abyssinian_(cat)',
  );

  static final firstBreedObject = BreedModel(
    id: 'abys',
    name: 'Abyssinian',
    weight: '3 - 5 kg',
    origin: 'Egypt',
    lifeSpan: '14 - 15',
    description: 'Active, Energetic, Independent, Intelligent, Gentle',
    imagesUrls: [],
    imagesRequestStatus: RequestStatusEnum.complete,
    adaptability: 5,
    affectionLevel: 5,
    childFriendly: 4,
    dogFriendly: 4,
    energyLevel: 5,
    grooming: 1,
    healthIssues: 2,
    intelligence: 5,
    sheddingLevel: 2,
    socialNeeds: 4,
    strangerFriendly: 5,
    vocalisation: 3,
    experimental: 0,
    hairless: 0,
    natural: 1,
    rare: 0,
    rex: 0,
    suppressedTail: 0,
    shortLegs: 0,
    hypoallergenic: 0,
    cfaUrl: 'https://cfa.org/abyssinian/',
    vetStreetUrl: 'https://www.vetstreet.com/cats/abyssinian',
    vcaHospitalsUrl: 'https://vcahospitals.com/know-your-pet/cat-breeds/abyssinian',
    wikipediaUrl: 'https://en.wikipedia.org/wiki/Abyssinian_(cat)',
  );

  static final secondBreedObject = BreedModel(
    id: 'beng',
    name: 'Bengal',
    weight: '4 - 7 kg',
    origin: 'United States',
    lifeSpan: '12 - 16',
    description: 'Alert, Agile, Energetic, Demanding, Intelligent',
    imagesUrls: [],
    imagesRequestStatus: RequestStatusEnum.complete,
    adaptability: 4,
    affectionLevel: 5,
    childFriendly: 4,
    dogFriendly: 5,
    energyLevel: 5,
    grooming: 1,
    healthIssues: 3,
    intelligence: 5,
    sheddingLevel: 3,
    socialNeeds: 5,
    strangerFriendly: 3,
    vocalisation: 4,
    experimental: 0,
    hairless: 0,
    natural: 0,
    rare: 0,
    rex: 0,
    suppressedTail: 0,
    shortLegs: 0,
    hypoallergenic: 0,
    cfaUrl: 'https://cfa.org/bengal/',
    vetStreetUrl: 'https://www.vetstreet.com/cats/bengal',
    vcaHospitalsUrl: 'https://vcahospitals.com/know-your-pet/cat-breeds/bengal',
    wikipediaUrl: 'https://en.wikipedia.org/wiki/Bengal_cat',
  );

  static final List<BreedModel> breedsList = <BreedModel>[
    firstBreedObject,
    secondBreedObject,
    BreedModel(
      id: 'norw',
      name: 'Norwegian Forest Cat',
      weight: '4 - 9 kg',
      origin: 'Norway',
      lifeSpan: '14 - 16',
      description: 'Sweet, Active, Intelligent, Social, Playful',
      imagesUrls: [],
      imagesRequestStatus: RequestStatusEnum.complete,
      adaptability: 5,
      affectionLevel: 4,
      childFriendly: 5,
      dogFriendly: 4,
      energyLevel: 3,
      grooming: 2,
      healthIssues: 2,
      intelligence: 4,
      sheddingLevel: 4,
      socialNeeds: 4,
      strangerFriendly: 4,
      vocalisation: 2,
      experimental: 0,
      hairless: 0,
      natural: 1,
      rare: 0,
      rex: 0,
      suppressedTail: 0,
      shortLegs: 0,
      hypoallergenic: 0,
      cfaUrl: 'https://cfa.org/norwegian-forest-cat/',
      vetStreetUrl: 'https://www.vetstreet.com/cats/norwegian-forest-cat',
      vcaHospitalsUrl: 'https://vcahospitals.com/know-your-pet/cat-breeds/norwegian-forest-cat',
      wikipediaUrl: 'https://en.wikipedia.org/wiki/Norwegian_Forest_cat',
    ),
  ];

  static final breedsListMapBytes = utf8.encode(jsonEncode(BreedsDataMocks.breedsListMap));
  static final breedsEmptyListMapBytes = utf8.encode(jsonEncode(BreedsDataMocks.breedsEmptyListMap));

  static final List<Map<String, dynamic>> breedsEmptyListMap = [];
  static final List<Map<String, dynamic>> breedsListMap = [{
      'weight': {
        'imperial': '7  -  10',
        'metric': '3 - 5'
      },
      'id': 'abys',
      'name': 'Abyssinian',
      'cfa_url': '',
      'vetstreet_url': '',
      'vcahospitals_url': '',
      'temperament': 'Active, Energetic, Independent, Intelligent, Gentle',
      'origin': 'Egypt',
      'country_codes': 'EG',
      'country_code': 'EG',
      'description': 'The Abyssinian is easy to care for, and a joy to have in your home. They’re affectionate cats and love both people and other animals.',
      'life_span': '14 - 15',
      'indoor': 0,
      'lap': 1,
      'alt_names': '',
      'adaptability': 5,
      'affection_level': 5,
      'child_friendly': 3,
      'dog_friendly': 4,
      'energy_level': 5,
      'grooming': 1,
      'health_issues': 2,
      'intelligence': 5,
      'shedding_level': 2,
      'social_needs': 5,
      'stranger_friendly': 5,
      'vocalisation': 1,
      'experimental': 0,
      'hairless': 0,
      'natural': 1,
      'rare': 0,
      'rex': 0,
      'suppressed_tail': 0,
      'short_legs': 0,
      'wikipedia_url': '',
      'hypoallergenic': 0,
      'reference_image_id': '0XYvRd7oD'
    },
    {
      'weight': {
        'imperial': '7 - 10',
        'metric': '3 - 5'
      },
      'id': 'aege',
      'name': 'Aegean',
      'vetstreet_url': '',
      'temperament': 'Affectionate, Social, Intelligent, Playful, Active',
      'origin': 'Greece',
      'country_codes': 'GR',
      'country_code': 'GR',
      'description': 'Native to the Greek islands known as the Cyclades in the Aegean Sea, these are natural cats, meaning they developed without humans getting involved in their breeding. As a breed, Aegean Cats are rare, although they are numerous on their home islands. They are generally friendly toward people and can be excellent cats for families with children.',
      'life_span': '9 - 12',
      'indoor': 0,
      'alt_names': '',
      'adaptability': 5,
      'affection_level': 4,
      'child_friendly': 4,
      'dog_friendly': 4,
      'energy_level': 3,
      'grooming': 3,
      'health_issues': 1,
      'intelligence': 3,
      'shedding_level': 3,
      'social_needs': 4,
      'stranger_friendly': 4,
      'vocalisation': 3,
      'experimental': 0,
      'hairless': 0,
      'natural': 0,
      'rare': 0,
      'rex': 0,
      'suppressed_tail': 0,
      'short_legs': 0,
      'wikipedia_url': '',
      'hypoallergenic': 0,
      'reference_image_id': 'ozEvzdVM-'
    },
    {
      'weight': {
        'imperial': '7 - 16',
        'metric': '3 - 7'
      },
      'id': 'abob',
      'name': 'American Bobtail',
      'cfa_url': '',
      'vetstreet_url': '',
      'vcahospitals_url': '',
      'temperament': 'Intelligent, Interactive, Lively, Playful, Sensitive',
      'origin': 'United States',
      'country_codes': 'US',
      'country_code': 'US',
      'description': 'American Bobtails are loving and incredibly intelligent cats possessing a distinctive wild appearance. They are extremely interactive cats that bond with their human family with great devotion.',
      'life_span': '11 - 15',
      'indoor': 0,
      'lap': 1,
      'alt_names': '',
      'adaptability': 5,
      'affection_level': 5,
      'child_friendly': 4,
      'dog_friendly': 5,
      'energy_level': 3,
      'grooming': 1,
      'health_issues': 1,
      'intelligence': 5,
      'shedding_level': 3,
      'social_needs': 3,
      'stranger_friendly': 3,
      'vocalisation': 3,
      'experimental': 0,
      'hairless': 0,
      'natural': 0,
      'rare': 0,
      'rex': 0,
      'suppressed_tail': 1,
      'short_legs': 0,
      'wikipedia_url': '',
      'hypoallergenic': 0,
      'reference_image_id': 'hBXicehMA'
    }
  ];

  static final breedImagesListMapBytes = utf8.encode(jsonEncode(BreedsDataMocks.breedImagesListMap));
  static final breedImagesEmptyListMapBytes = utf8.encode(jsonEncode(BreedsDataMocks.breedImagesEmptyListMap));

  static final List<Map<String, dynamic>> breedImagesEmptyListMap = [];
  static final List<Map<String, dynamic>> breedImagesListMap = [
    {
      "id":"1u0",
      "url":"https://cdn2.thecatapi.com/images/1u0.jpg",
      "width":765,
      "height":850
    },
    {
      "id":"32c",
      "url":"https://cdn2.thecatapi.com/images/32c.jpg",
      "width":570,
      "height":463
    },
    {
      "id":"7hk",
      "url":"https://cdn2.thecatapi.com/images/7hk.jpg",
      "width":558,
      "height":639
    },
    {
      "id":"c2v",
      "url":"https://cdn2.thecatapi.com/images/c2v.jpg",
      "width":1024,
      "height":681
    },
    {
      "id":"da0",
      "url":"https://cdn2.thecatapi.com/images/da0.jpg",
      "width":500,
      "height":333
    },
    {
      "id":"efl",
      "url":"https://cdn2.thecatapi.com/images/efl.jpg",
      "width":460,
      "height":631
    },
    {
      "id":"eh3",
      "url":"https://cdn2.thecatapi.com/images/eh3.jpg",
      "width":500,
      "height":333
    },
    {
      "id":"MTUwMjYzMg",
      "url":"https://cdn2.thecatapi.com/images/MTUwMjYzMg.jpg",
      "width":522,
      "height":640
    },
    {
      "id":"MTk0NTExOQ",
      "url":"https://cdn2.thecatapi.com/images/MTk0NTExOQ.jpg",
      "width":500,
      "height":333
    },
    {
      "id":"7afi4uNFM",
      "url":"https://cdn2.thecatapi.com/images/7afi4uNFM.jpg",
      "width":576,
      "height":570
    }
  ];
}
