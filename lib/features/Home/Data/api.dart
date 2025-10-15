import 'package:dio/dio.dart';
import 'package:rick_and_morty_app/models/character_model.dart';
import 'package:rick_and_morty_app/models/season_model.dart';
import 'package:rick_and_morty_app/models/show_model.dart';
import '../../../constents/strings.dart';

class HomeDataSource {
  final dio = Dio();

  Future<ShowModel> getShowData() async {
    try {
      final respons = await dio.get(description);
      return ShowModel.fromJson(respons.data);
    } catch (e) {
      throw Exception('faild to load seasons$e');
    }
  }

  Future<List<SeasonModel>> getSeasons() async {
    try {
      final respons = await dio.get(seasons);
      return (respons.data as List).map((json) => SeasonModel.fromJson(json)).toList();
    } catch (e) {
      throw Exception('Failed to load seasons: $e');
    }
  }

  Future<List<CharacterModel>> getCharacters() async {
    try {
      final response = await dio.get(charactersUrl);
      final resaults = response.data["results"] as List;
      return resaults.map((json) => CharacterModel.fromJson(json)).toList();
    } catch (e) {
      throw Exception('Failed to load characters: $e');
    }
  }
}
