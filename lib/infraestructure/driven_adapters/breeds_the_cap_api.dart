import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'package:wikcat/infraestructure/endpoints/wik_cat_endpoints.dart';
import 'package:wikcat/infraestructure/mappers/breed_image_response_mapper.dart';

import '../../domain/domain.dart';
import '../mappers/the_cap_api_to_breeds_model_mapper.dart';
import '../model/breed_image_response.dart';
import '../model/breeds_response.dart';

class BreedsTheCapApi extends BreedsGateway {

  Client httpClient;
  String apiKey;

  BreedsTheCapApi(this.httpClient, {this.apiKey = ''});

  static Map<String, String> getHeaders(String apiKey) => {
    "Content-type": "application/json",
    "Accept": "application/json",
    "x-api-key": apiKey
  };

  @override
  Future<(ErrorModel?, List<BreedModel>)> getBreeds() async {
    try {
      final response = await httpClient.get(
        Uri.parse(WikCatEndpoints.breeds),
        headers: getHeaders(apiKey)
      );

      if(response.statusCode != 200) {
        throw Exception(response.body);
      }

      final data = jsonDecode(response.body);
      final breedsResponse = List<BreedResponse>.from(
        data.map((json) => BreedResponse.fromJson(json))
      );

      final breedList = List<BreedModel>.from(
        breedsResponse.map((breed) => TheCapApiToBreedsModelMapper.toBreedModel(breed))
      );

      return (null, breedList);
    } catch (e) {
      if(kDebugMode) print(e);
      return (ErrorModel(name: e.toString()), <BreedModel>[]);
    }
  }

  @override
  Future<(ErrorModel?, List<String>)> getBreedImages(String breedId) async {
    try {
      final response = await httpClient.get(
        Uri.parse('${WikCatEndpoints.images}$breedId'),
        headers: getHeaders(apiKey)
      );

      if(response.statusCode != 200) {
        throw Exception(response.body);
      }

      final data = jsonDecode(response.body);
      final breedImagesResponse = List<BreedImageResponse>.from(
        data.map((json) => BreedImageResponseMapper().fromMap(json))
      );

      final breedImages = List<String>.from(
        breedImagesResponse.map((image) => TheCapApiToBreedsModelMapper.toImageUrl(image))
      );

      return (null, breedImages);
    } catch (e) {
      if(kDebugMode) print(e);
      return (ErrorModel(name: e.toString()), <String>[]);
    }
  }
}