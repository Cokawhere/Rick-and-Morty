import 'package:rick_and_morty_app/features/SeasonDetailsFeature/data/api.dart';
import '../../../models/episode_model.dart';

class EpisodesRepository {
  final episodesDataSource = EpisodesDataSource();

  Future<List<EpisodeModel>> getEpisodes() async {
    return await episodesDataSource.getEpisodes();
  }
}
