import 'dart:async';
import 'dart:math';
import 'package:bloc/bloc.dart';
import 'package:flutter_cat_facts/src/blocs/fact-list/bloc/bloc.dart';
import 'package:flutter_cat_facts/src/models/fact_model.dart';
import './bloc.dart';

class FactBloc extends Bloc<FactEvent, FactState> {
  final FactListBloc factListBloc;
  StreamSubscription factListSubscription;
  Random random = Random();
  List<Fact> _facts;
  Fact _fact;

  FactBloc({this.factListBloc}) {
    factListSubscription = factListBloc.listen((state) {
      if (state is LoadedFactListState) {
        _facts = state.facts;
        add(GetFactEvent());
      }
    });
  }

  get fact => _fact;

  @override
  FactState get initialState => InitialFactState();

  @override
  Future<void> close() {
    factListSubscription.cancel();
    return super.close();
  }

  @override
  Stream<FactState> mapEventToState(FactEvent event) async* {
    yield LoadingFactState();
    if (event is GetFactEvent) {
      final int maxIndex = _facts.length;
      final Fact fact = _facts[random.nextInt(maxIndex)];
      _fact = fact;
      yield LoadedFactState(fact);
    }
  }
}
