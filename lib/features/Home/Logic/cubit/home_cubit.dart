import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:rick_and_morty_app/features/Home/Data/repo.dart';
import 'package:rick_and_morty_app/models/character_model.dart';
import 'package:rick_and_morty_app/models/season_model.dart';
import 'package:rick_and_morty_app/models/show_model.dart';

part 'cubit_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepository repository = HomeRepository();

  HomeCubit() : super(HomeInitial());
  Future<void> getHomeData() async {
    emit(HomeLoading());
    try {
      final showData = await repository.getShowData();
      final characters = await repository.getCharacters();
      final seasons = await repository.getSeasons();
      emit(HomeLoaded(characters, seasons, showData));
    } catch (e) {
      emit(HomeError(e.toString()));
    }
  }
}
