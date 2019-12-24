import 'package:flutter_cat_facts/src/utils/http_response.dart';
import 'package:meta/meta.dart';

@immutable
abstract class RandomImageState {}
  
class InitialRandomImageState extends RandomImageState {}

class LoadingRandomImageState extends RandomImageState {}

class LoadedRandomImageState extends RandomImageState {
  final HttpResponse response;

  LoadedRandomImageState(this.response);
}