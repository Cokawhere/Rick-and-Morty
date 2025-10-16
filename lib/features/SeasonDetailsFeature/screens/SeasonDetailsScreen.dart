import 'dart:ui' show ImageFilter;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_app/features/SeasonDetailsFeature/logic/cubit/episodes_cubit.dart';
import 'package:rick_and_morty_app/models/season_model.dart';
import '../../../constents/colors.dart';

class SeasonDetailsScreen extends StatelessWidget {
  final SeasonModel season;
  const SeasonDetailsScreen({super.key, required this.season});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,

      body: Stack(
        children: [
          Image.network(
            (season.image != null && season.image!.isNotEmpty)
                ? season.image!
                : 'https://i.pinimg.com/736x/f2/83/6c/f2836c465d821c92b5267faa7daaefb2.jpg',
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 11, sigmaY: 11),
            child: Container(),
          ),
          Positioned(
            top: 10,
            right: 0,
            left: 0,
            child: Center(
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.only(right: 8, left: 8, top: 8),
                  child: Column(
                    children: [
                      const Divider(
                        color: AppColors.text,
                        // height: 2,
                        thickness: 3,
                        endIndent: 10,
                        indent: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '${season.episodeOrder} Episodes',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 23,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const Divider(
                        color: AppColors.text,
                        // height: 2,
                        thickness: 3,
                        endIndent: 10,
                        indent: 10,
                      ),
                      Column(
                        children: [
                          BlocBuilder<EpisodesCubit, EpisodesState>(
                            builder: (context, state) {
                              final cubit = context.read<EpisodesCubit>();
                              if (state is EpisodesLoading) {
                                return const Center(
                                  child: CircularProgressIndicator(),
                                );
                              } else if (state is EpisodesLoaded) {
                                cubit.filterBySeason(season.number ?? 0);
                                return const Center(
                                  child: Text('Filtering...'),
                                );
                              } else if (state is EpisodesFiltered) {
                                final episodes = state.filteredEpisodes ?? [];
                                print(episodes);
                                return ListView.builder(
                                  scrollDirection: Axis.vertical,
                                  itemCount: episodes.length,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        width: 400,
                                        height: 200,
                                        color: AppColors.background,
                                      ),
                                    );
                                  },
                                );
                              }
                              return const Center();
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
