import 'dart:ui' show ImageFilter;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_app/features/SeasonDetailsFeature/logic/cubit/episodes_cubit.dart';
import 'package:rick_and_morty_app/features/SeasonDetailsFeature/widgets/episode.dart';
import 'package:rick_and_morty_app/models/season_model.dart';
import '../../../constents/colors.dart';

class SeasonDetailsScreen extends StatelessWidget {
  final SeasonModel season;
  const SeasonDetailsScreen({super.key, required this.season});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        toolbarHeight: 45,
        backgroundColor: const Color.fromARGB(27, 242, 242, 243),
        elevation: 6,
        title: Text(
          '${season.number} Seasons',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: AppColors.text,
            fontSize: 25,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            Icons.arrow_back_ios_new_outlined,
            size: 25,
            color: AppColors.text,
          ),
        ),
      ),
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
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: BlocBuilder<EpisodesCubit, EpisodesState>(
                builder: (context, state) {
                  if (state is EpisodesLoading) {
                    return const Center(
                      child: CircularProgressIndicator(color: AppColors.text),
                    );
                  } else if (state is EpisodesFiltered) {
                    final episodes = state.filteredEpisodes;
                    if (episodes.isEmpty) {
                      return const Center(
                        child: Text(
                          'No episodes found',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: AppColors.text,
                            fontSize: 25,
                          ),
                        ),
                      );
                    }
                    return ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: episodes.length,
                      itemBuilder: (context, index) {
                        final episode = episodes[index];
                        return EpisodeCard(episode: episode);
                      },
                    );
                  }
                  return const Center();
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
