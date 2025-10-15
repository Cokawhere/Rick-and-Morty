class SeasonModel {
  final int? id;
  final int? number;
  final String? startDate;
  final String? endDate;
  final int? episodeOrder;
  final String? image;
  

  SeasonModel({
    this.id,
    this.number,
    this.startDate,
    this.endDate,
    this.episodeOrder,
    this.image,
  });

  factory SeasonModel.fromJson(Map<String, dynamic> json) {
    return SeasonModel(
      id: json['id'],
      number: json['number'],
      startDate: json['premiereDate'],
      endDate: json['endDate'],
      episodeOrder: json['episodeOrder'],
      image: json['image']?['medium'],
    );
  }
}
