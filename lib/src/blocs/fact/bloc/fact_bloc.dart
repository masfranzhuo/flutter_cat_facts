import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter_cat_facts/src/models/fact_model.dart';
import './bloc.dart';

class FactBloc extends Bloc<FactEvent, FactState> {
  @override
  FactState get initialState => InitialFactState();

  @override
  Stream<FactState> mapEventToState(FactEvent event) async* {
    yield LoadingFactState();
    if (event is GetFactEvent) {
      final Fact fact = null;
      yield LoadedFactState(fact);
    }
  }
}
