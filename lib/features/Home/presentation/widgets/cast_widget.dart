import 'package:flutter/material.dart';

import '../../../../models/character_model.dart';

Widget buildCharactersList(
  List<CharacterModel> characters,
  BuildContext context,
) {
  return ListView.builder(
    itemCount: characters.length,
    scrollDirection: Axis.horizontal,
    itemBuilder: (context, index) {
      final character = characters[index];
      String name = character.name ?? '...';
      if (name.length > 13) {
        name = '${name.substring(0, 10)}...';
      }
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              width: 100,
              height: 100,
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
              ),
              child: Image.network(
                (character.image != null && character.image!.isNotEmpty)
                    ? character.image!
                    : 'https://i.pinimg.com/736x/f2/83/6c/f2836c465d821c92b5267faa7daaefb2.jpg',
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 4),
            Text(
              name,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      );
    },
  );
}
