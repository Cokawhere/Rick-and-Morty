import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../models/season_model.dart';

Widget buildSeasonsList(List<SeasonModel> seasons, BuildContext context) {
  return ListView.builder(
    itemCount: seasons.length,
    scrollDirection: Axis.horizontal,
    itemBuilder: (context, index) {
      final season = seasons[index];
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4),
        child: Container(
          height: 320,
          width: 120,
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
          child: Stack(
            children: [
              InkWell(
                onTap: () {
                  context.push("/seasonDetails", extra: season);
                },
                child: Image.network(
                  (season.image != null && season.image!.isNotEmpty)
                      ? season.image!
                      : 'https://i.pinimg.com/736x/f2/83/6c/f2836c465d821c92b5267faa7daaefb2.jpg',
                  width: double.infinity,
                  height: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: 70,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Colors.transparent, Colors.black87],
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(6),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          'Season ${season.number}',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          season.startDate ?? '',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
