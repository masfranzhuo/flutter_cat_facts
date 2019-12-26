import 'dart:async';
import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:flutter_cat_facts/src/configs/constants.dart';
import 'package:flutter_cat_facts/src/models/fact_model.dart';
import 'package:flutter_cat_facts/src/repositories/fact_repository.dart';
import 'package:flutter_cat_facts/src/utils/http_response.dart';
import 'package:shared_preferences/shared_preferences.dart';
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

      final prefs = await SharedPreferences.getInstance();
      // prefs.remove(APP_NAME);
      if (prefs.containsKey(APP_NAME)) {
        await jsonDecode(prefs.getString(APP_NAME)).forEach((item) {
          facts.add(Fact.fromJson(item));
        });
      } else {
        final HttpResponse response = await factRepository.fetchFacts();
        facts = response.data;
        facts = facts.where((item) => item.type == 'cat').toList();
        prefs.setString(
            APP_NAME, jsonEncode(facts.map((item) => item.toJson()).toList()));
      }

      yield LoadedFactListState(facts);
    }
  }
}
