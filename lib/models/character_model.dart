class CharacterModel {
  final int? id;
  final String? name;
  final String? image;
  final String? gender;
  final List<dynamic>? episode;
  final Map<String, dynamic>? origin;
  final Map<String, dynamic>? location;

  CharacterModel({
    this.id,
    this.name,
    this.image,
    this.gender,
    this.episode,
    this.origin,
    this.location,
  });
  

  factory CharacterModel.fromJson(Map<String, dynamic> json) {
    return CharacterModel(
      id: json['id'],
      name: json['name'],
      image: json['image'],
      gender: json['gender'],
      episode: json['episode'] ?? [],
      origin: json['origin'] ?? {},
      location: json['location'] ?? {},
    );
  }
}

