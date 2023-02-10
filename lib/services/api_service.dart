import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:toonflix/models/webtoon_detail_model.dart';
import 'package:toonflix/models/webtoon_episode_model.dart';
import 'package:toonflix/models/webtoon_model.dart';

class ApiService {
  static const String baseUrl =
      "https://webtoon-crawler.nomadcoders.workers.dev";
  static const String today = "today";

  //API가 반환한 JSON을 콘솔에 프린트?
  static Future<List<WebtoonModel>> getTodayToons() async {
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
        final instance = WebtoonModel.fromJson(webtoon);
        webtoonInstances.add(instance);
      }
      return webtoonInstances;
    }
    throw Error();
  }

  static Future<WebtoonDetailModel> getToonById(String id) async {
    final url = Uri.parse("$baseUrl/$id");
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final webtoon = jsonDecode(response.body);
      return WebtoonDetailModel.fromJson(webtoon);
    }
    throw Error();
  }

  static Future<List<WebtoonEpisodeModel>> getLatesetEpisodesById(
      String id) async {
    List<WebtoonEpisodeModel> episodesInstances = [];

    final url = Uri.parse("$baseUrl/$id/episodes");
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final episodes = jsonDecode(response.body);
      for (var episode in episodes) {
        episodesInstances.add(WebtoonEpisodeModel.fromJson(episode));
      }
      return episodesInstances;
    }
    throw Error();
  }
}
