import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter_cat_facts/src/models/fact_model.dart';
import 'package:flutter_cat_facts/src/repositories/fact_repository.dart';
import 'package:flutter_cat_facts/src/utils/http_response.dart';
import './bloc.dart';

class FactListBloc extends Bloc<FactListEvent, FactListState> {
  final factRepository = FactRepository();
  
  @override
  FactListState get initialState => InitialFactListState();

  @override
  Stream<FactListState> mapEventToState(FactListEvent event) async* {
    yield LoadingFactListState();
    if (event is GetFactListEvent) {
      List<Fact> facts = [];
      final HttpResponse response = await factRepository.fetchFacts();
      facts = response.data;
      yield LoadedFactListState(facts);
    }
  }
}
