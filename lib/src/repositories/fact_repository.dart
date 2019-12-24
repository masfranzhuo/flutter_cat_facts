import 'package:flutter_cat_facts/src/providers/fact_provider.dart';

class FactRepository {
  final factRepository = FactProvider();

  Future fetchFacts() => factRepository.fetchFacts();
}