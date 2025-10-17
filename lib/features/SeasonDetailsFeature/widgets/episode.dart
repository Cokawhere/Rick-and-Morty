import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rick_and_morty_app/constents/colors.dart';
import 'package:rick_and_morty_app/models/episode_model.dart';

class EpisodeCard extends StatelessWidget {
  final EpisodeModel episode;
  const EpisodeCard({super.key, required this.episode});

  @override
  Widget build(BuildContext context) {
    String name = episode.name ?? "name";
    if (name.length > 24) {
      name = '${name.substring(0, 20)}...';
    }

    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: Container(
        width: 400,
        height: 100,
        decoration: BoxDecoration(
          color: const Color.fromARGB(56, 44, 43, 43),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(3.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              InkWell(
                onTap: () {
                  context.push('/episodeDetails', extra: episode);
                },
                child: Container(
                  width: 170,
                  height: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: NetworkImage(episode.image ?? ""),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 9),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "${episode.number}. $name",
                      style: TextStyle(
                        color: AppColors.card,
                        fontSize: 16,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    Text(
                      episode.summary ?? '',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: AppColors.card,
                        fontSize: 14,
                        height: 1.1,
                      ),
                    ),
                    SizedBox(height: 3),
                    Text(
                      episode.airdate ?? '',
                      style: TextStyle(
                        color: AppColors.card,
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 5),
                    const Divider(
                      color: AppColors.card,
                      height: 2,
                      thickness: 1,
                      endIndent: 0,
                      indent: 0,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
