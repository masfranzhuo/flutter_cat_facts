import 'package:flutter_cat_facts/src/providers/random_image_provider.dart';

class RandomImageRepository {
  final randomImageRepositry = RandomImageProvider();

  Future getRandomImage() => randomImageRepositry.getRandomImage();
}