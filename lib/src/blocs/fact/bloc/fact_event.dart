import 'package:meta/meta.dart';

@immutable
abstract class FactEvent {}

class GetFactEvent extends FactEvent {}
