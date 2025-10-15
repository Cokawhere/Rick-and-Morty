import 'package:rick_and_morty_app/features/Home/Data/api.dart';

import '../../../models/character_model.dart';
import '../../../models/season_model.dart';

class HomeRepository {
  HomeDataSource dataSource = HomeDataSource();

  Future<dynamic> getShowData() async {
    try {
      return await dataSource.getShowData();
    } catch (e) {
      throw Exception('Repository error: $e');
    }
  }

  Future<List<SeasonModel>> getSeasons() async {
    try {
      return await dataSource.getSeasons();
    } catch (e) {
      throw Exception('repository error $e');
    }
  }

  Future<List<CharacterModel>> getCharacters() async {
    try {
      return await dataSource.getCharacters();
    } catch (e) {
      throw Exception('Repository error $e');
    }
  }
}
