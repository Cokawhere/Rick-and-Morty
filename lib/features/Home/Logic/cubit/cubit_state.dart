part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class HomeLoading extends HomeState {}

final class HomeLoaded extends HomeState {
  final ShowModel showData;
  final List<SeasonModel> seasons;
  final List<CharacterModel> characters;
  HomeLoaded(this.characters, this.seasons, this.showData);
}

final class HomeError extends HomeState {
  final String message;
  HomeError(this.message);
}
