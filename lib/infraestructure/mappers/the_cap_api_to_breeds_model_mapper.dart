import '../../domain/model/breed_model.dart';
import '../model/breed_image_response.dart';
import '../model/breeds_response.dart';

class TheCapApiToBreedsModelMapper {

  static BreedModel toBreedModel(
    BreedResponse breed 
  ) => BreedModel(
    id: breed.id, 
    name: breed.name, 
    weight: breed.weight.metric, 
    origin: breed.origin, 
    lifeSpan: breed.lifeSpan,
    imagesUrls: const [],
    description: breed.description, 
    adaptability: breed.adaptability, 
    affectionLevel: breed.affectionLevel, 
    childFriendly: breed.childFriendly, 
    dogFriendly: breed.dogFriendly, 
    energyLevel: breed.energyLevel, 
    grooming: breed.grooming, 
    healthIssues: breed.healthIssues, 
    intelligence: breed.intelligence, 
    sheddingLevel: breed.sheddingLevel, 
    socialNeeds: breed.socialNeeds, 
    strangerFriendly: breed.strangerFriendly, 
    vocalisation: breed.vocalisation, 
    experimental: breed.experimental, 
    hairless: breed.hairless, 
    natural: breed.natural, 
    rare: breed.rare, 
    rex: breed.rex, 
    suppressedTail: breed.suppressedTail, 
    shortLegs: breed.shortLegs, 
    hypoallergenic: breed.hypoallergenic,
    cfaUrl: breed.cfaUrl,
    vetStreetUrl: breed.vetstreetUrl,
    vcaHospitalsUrl: breed.vcahospitalsUrl,
    wikipediaUrl: breed.wikipediaUrl
  );

  static String toImageUrl(
    BreedImageResponse breedImages
  ) => breedImages.url;
}