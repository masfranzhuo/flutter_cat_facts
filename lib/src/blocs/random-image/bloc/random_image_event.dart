import 'package:meta/meta.dart';

@immutable
abstract class RandomImageEvent {}

class GetRandomImageEvent extends RandomImageEvent {}
