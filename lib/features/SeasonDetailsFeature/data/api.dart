import 'package:dio/dio.dart';
import 'package:rick_and_morty_app/constents/strings.dart';
import 'package:rick_and_morty_app/models/episode_model.dart';

class EpisodesDataSource {
  final dio = Dio();

  Future<List<EpisodeModel>> getEpisodes() async {
    try {
      final response = await dio.get(episodes);
      return (response.data as List)
          .map((ep) => EpisodeModel.fromJson(ep))
          .toList();
    } catch (e) {
      throw Exception('faild to load episodes from data layer: $e');
    }
  }
}
