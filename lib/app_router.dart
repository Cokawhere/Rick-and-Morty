import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:rick_and_morty_app/features/Home/Logic/cubit/home_cubit.dart';
import 'package:rick_and_morty_app/features/SeasonDetailsFeature/logic/cubit/episodes_cubit.dart';
import 'package:rick_and_morty_app/features/SeasonDetailsFeature/screens/SeasonDetailsScreen.dart';
import 'package:rick_and_morty_app/features/episode_details/presentation/screens/episode_details.dart';
import 'package:rick_and_morty_app/models/character_model.dart';
import 'package:flutter/material.dart';
import 'package:rick_and_morty_app/models/episode_model.dart';
import 'package:rick_and_morty_app/models/season_model.dart';
import 'features/CharacterDetailsFeature/presentation/screens/character_details.dart';
import 'features/Home/presentation/screens/home.dart';

final GoRouter appRouter = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      name: 'home',
      builder: (context, state) {
        return BlocProvider(
          create: (context) => HomeCubit()..getHomeData(),
          child: HomeScreen(),
        );
      },
    ),
    GoRoute(
      path: "/characterDetails",
      name: "characterDetails",
      builder: (context, state) {
        final character = state.extra;
        if (character is! CharacterModel) {
          return const Scaffold(body: Center(child: Text('No character data')));
        }
        return CharacterDetailsScreen(character: character);
      },
    ),
    GoRoute(
      path: "/seasonDetails",
      name: "seasonDetails",
      builder: (context, state) {
        final season = state.extra;
        if (season is! SeasonModel) {
          return const Scaffold(body: Center(child: Text('No season data')));
        }
        return BlocProvider(
          create: (context) =>
              EpisodesCubit()..getAllEpisodes(season.number ?? 0),
          child: SeasonDetailsScreen(season: season),
        );
      },
    ),
    GoRoute(
      path: '/episodeDetails',
      name: 'episodeDetails',
      builder: (context, state) {
        final episode = state.extra;
        if (episode is! EpisodeModel) {
          return const Scaffold(body: Center(child: Text('No episode data')));
        }
        return EpisodeDetails(episode: episode);
      },
    ),
  ],
);
