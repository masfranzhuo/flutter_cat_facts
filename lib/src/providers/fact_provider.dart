import 'package:dio/dio.dart';
import 'package:flutter_cat_facts/src/configs/api.dart';
import 'package:flutter_cat_facts/src/models/fact_model.dart';

class FactProvider {
  static const String providerName = 'facts';

  static BaseOptions options = new BaseOptions(
    baseUrl: FACTS_URL,
    connectTimeout: 5000,
    receiveTimeout: 3000,
  );
  Dio dio = new Dio(options);

  Future<List<Fact>> fetchFacts() async {
    try {
      Response response = await dio.get(providerName);

      List result = response.data as List;
      List<Fact> facts = result.isNotEmpty
          ? result.map((item) => Fact.fromJson(item)).toList()
          : [];
          
      return facts;
    } catch (error) {
      throw (error);
    }
  }
}
