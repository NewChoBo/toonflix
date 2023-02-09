import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:toonflix/models/webtoon_model.dart';

class ApiService {
  final String baseUrl = "https://webtoon-crawler.nomadcoders.workers.dev";
  final String today = "today";

  //API가 반환한 JSON을 콘솔에 프린트?
  Future<List<WebtoonModel>> getTodayToons() async {
    //asynchronous function : 비동기 함수
    //함수를 async로

    List<WebtoonModel> webtoonInstances = [];

    final url = Uri.parse('$baseUrl/$today');

    //Dart에게 결과값을 기다리라고 말할 땐 await
    //await는 asynchronous function(비동기함수)내에서만 사용될 수 있다.
    final response = await http.get(url); //데이터를 받을때까지 기다려야 함
    //future? 이 get 함수는 미래에 완료될 것

    if (response.statusCode == 200) {
      //200은 요청이 성공했다는 뜻

      final List<dynamic> webtoons = jsonDecode(response.body); //리턴값은 dynamic
      for (var webtoon in webtoons) {
        // final toon = WebtoonModel.fromJson(webtoon);
        // print(toon.title);
        webtoonInstances.add(WebtoonModel.fromJson(webtoon));
      }
      return webtoonInstances;
    }
    throw Error();
  }
}
