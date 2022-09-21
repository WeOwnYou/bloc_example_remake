import 'package:dio/dio.dart';
import 'models/nasa_photos.g.dart';

class ImagesRequestFailure implements Exception {}

class ImagesNotFound implements Exception {}

class NasaApiClient {
  static const _baseUrl = 'https://images-api.nasa.gov/';
  final Dio _dio;
  NasaApiClient() : _dio = Dio(BaseOptions(baseUrl: _baseUrl));
  Future<NasaPhotos> searchPhotos({
    required String searchName,
    int pageIndex = 1,
    String keyWord = '',
    String nasaId = '',
  }) async {
    final response = await _dio.get<NasaPhotos>(
      'search',
      queryParameters: <String, dynamic>{
        'q': searchName,
        'media_type': 'image',
        'page': pageIndex.toString(),
        'keywords': keyWord,
        'nasa_id': nasaId,
      },
    );
    if (response.statusCode != 200 || response.data == null) {
      throw ImagesRequestFailure();
    }
    if (response.data!.collection.items.isEmpty) {
      throw ImagesNotFound();
    }
    return response.data!;
  }
}
