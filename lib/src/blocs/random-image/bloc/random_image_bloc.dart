import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter_cat_facts/src/repositories/random_image_repository.dart';
import './bloc.dart';

class RandomImageBloc extends Bloc<RandomImageEvent, RandomImageState> {
  final randomImageRepository = RandomImageRepository();
  
  @override
  RandomImageState get initialState => InitialRandomImageState();

  @override
  Stream<RandomImageState> mapEventToState(RandomImageEvent event) async* {
    // TODO: Add Logic
  }
}
