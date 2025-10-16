part of 'episodes_cubit.dart';

@immutable
sealed class EpisodesState {}

final class EpisodesInitial extends EpisodesState {}

final class EpisodesLoading extends EpisodesState {}

final class EpisodesLoaded extends EpisodesState {
  final List<EpisodeModel> episodes;
  EpisodesLoaded(this.episodes);
}

class EpisodesFiltered extends EpisodesState {
  final List<EpisodeModel> filteredEpisodes;
  EpisodesFiltered(this.filteredEpisodes);
}

final class EpisodesError extends EpisodesState {
  final String message;
  EpisodesError(this.message);
}
