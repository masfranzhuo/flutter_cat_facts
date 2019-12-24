import 'package:dio/dio.dart';
import 'package:flutter_cat_facts/src/configs/api.dart';
import 'package:flutter_cat_facts/src/models/random_image_model.dart';
import 'package:flutter_cat_facts/src/utils/http_response.dart';

class RandomImageProvider {
  static const String providerName = 'images/search';

  static BaseOptions options = new BaseOptions(
    baseUrl: RANDOM_IMAGE_URL,
    connectTimeout: 5000,
    receiveTimeout: 3000,
  );
  Dio dio = new Dio(options);

  Future<HttpResponse> getRandomImage() async {
    try {
      Response response = await dio.get(providerName);

      var result = response.data[0];
      RandomImage randomImage = RandomImage.fromJson(result);

      return HttpResponse(isSuccess: true, data: randomImage);
    } catch (error) {
      return HttpResponse(message: error);
    }
  }
}
