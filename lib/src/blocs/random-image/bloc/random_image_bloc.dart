import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter_cat_facts/src/repositories/random_image_repository.dart';
import 'package:flutter_cat_facts/src/utils/http_response.dart';
import './bloc.dart';

class RandomImageBloc extends Bloc<RandomImageEvent, RandomImageState> {
  final RandomImageRepository randomImageRepository;

  RandomImageBloc(this.randomImageRepository);
  
  @override
  RandomImageState get initialState => InitialRandomImageState();

  @override
  Stream<RandomImageState> mapEventToState(RandomImageEvent event) async* {
    yield LoadingRandomImageState();
    if (event is GetRandomImageEvent) {
      final HttpResponse response = await randomImageRepository.getRandomImage();
      yield LoadedRandomImageState(response);
    }
  }
}
