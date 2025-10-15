class EpisodeModel {
  final int? id;
  final String? name;
  final String? summary;
  final String? image;
  final int? season;
  final int? number;
  final int? runtime;
  final String? airdate;

  EpisodeModel({
    this.id,
    this.name,
    this.summary,
    this.image,
    this.season,
    this.number,
    this.runtime,
    this.airdate,
  });

  factory EpisodeModel.fromJson(Map<String, dynamic> json) {
    return EpisodeModel(
      id: json['id'],
      name: json['name'],
      summary: json['summary'],
      image: json['image']?['medium'],
      season: json['season'],
      number: json['number'],
      runtime: json['runtime'],
      airdate:json['airdate'],
    );
  }
}