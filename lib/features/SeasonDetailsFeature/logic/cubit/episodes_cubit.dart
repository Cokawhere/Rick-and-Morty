import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:rick_and_morty_app/features/SeasonDetailsFeature/data/repo.dart';
import 'package:rick_and_morty_app/models/episode_model.dart';
part 'episodes_state.dart';

class EpisodesCubit extends Cubit<EpisodesState> {
  final episodesRepository = EpisodesRepository();
  EpisodesCubit() : super(EpisodesInitial());
  List<EpisodeModel> allEpisodes = [];

  Future<void> getAllEpisodes(int seasonNumber) async {
    emit(EpisodesLoading());
    try {
      allEpisodes = await episodesRepository.getEpisodes();
      final filteredEpisodes = allEpisodes
          .where((epi) => epi.season == seasonNumber)
          .toList();
      emit(EpisodesFiltered(filteredEpisodes));
    } catch (e) {
      emit(EpisodesError(e.toString()));
    }
  }

  
}
