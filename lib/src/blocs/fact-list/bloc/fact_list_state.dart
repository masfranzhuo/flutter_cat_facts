import 'package:flutter_cat_facts/src/utils/http_response.dart';
import 'package:meta/meta.dart';

@immutable
abstract class FactListState {}
  
class InitialFactListState extends FactListState {}

class LaodingFactListState extends FactListState {}

class LoadedFactListState extends FactListState {
  final HttpResponse response;

  LoadedFactListState(this.response);
}
