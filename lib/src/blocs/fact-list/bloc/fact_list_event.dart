import 'package:meta/meta.dart';

@immutable
abstract class FactListEvent {}

class GetFactListEvent extends FactListEvent {}
