import '../../domain/domain.dart';
import '../model/breed_image_response.dart';

class BreedImageResponseMapper implements Mapper<BreedImageResponse> {

  @override
  BreedImageResponse fromMap(Map<String, dynamic> json) => BreedImageResponse(
    id: json["id"],
    url: json["url"],
    width: json["width"],
    height: json["height"],
  );

  @override
  Map<String, dynamic>? toMap(BreedImageResponse data) => {
    "id": data.id,
    "url": data.url,
    "width": data.width,
    "height": data.height,
  };
}