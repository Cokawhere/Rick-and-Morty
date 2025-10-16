import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:rick_and_morty_app/features/SeasonDetailsFeature/data/repo.dart';
import 'package:rick_and_morty_app/models/episode_model.dart';
part 'episodes_state.dart';

class EpisodesCubit extends Cubit<EpisodesState> {
  final episodesRepository = EpisodesRepository();
  EpisodesCubit() : super(EpisodesInitial());
  List<EpisodeModel> allEpisodes = [];

  Future<void> getAllEpisodes() async {
    emit(EpisodesLoading());
    try {
      allEpisodes = await episodesRepository.getEpisodes();
      emit(EpisodesLoaded(allEpisodes));
    } catch (e) {
      emit(EpisodesError(e.toString()));
    }
    
  }
  void filterBySeason(int seasonNumber) {
      final filteredEpisodes = allEpisodes
          .where((epi) => epi.season == seasonNumber)
          .toList();
      emit(EpisodesFiltered(filteredEpisodes));
    }
}
