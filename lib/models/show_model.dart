class ShowModel {
  final String? name;
  final String? image;
  final String? summary;
  final double? rating;
  final String? language;
  final List<dynamic>? genres;

  ShowModel({
    this.name,
    this.image,
    this.summary,
    this.rating,
    this.language,
    this.genres,
  });

  factory ShowModel.fromJson(Map<String, dynamic> json) {
    String? cleanSummary = json['summary'];
    if (cleanSummary != null) {
      cleanSummary = cleanSummary.replaceAll(RegExp(r'<[^>]*>'), '').trim();
    }
    return ShowModel(
      name: json['name'],
      image: json['image']?['medium'],
      summary: cleanSummary,
      rating: json['rating']?['average']?.toDouble(),
      language: json['language'],
      genres: json['genres'] ?? [],
    );
  }
}
