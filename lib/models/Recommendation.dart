class Recommendation {
  String zan;
  String name;
  String description;
  String imageUrl;
  String tou;

  Recommendation({required this.zan, required this.tou, required this.name, required this.description, required this.imageUrl});

  factory Recommendation.fromJson(Map<String, dynamic> json) {
    return Recommendation(
      zan: json['zan'],
      tou: json['tou'],
      name: json['name'],
      description: json['description'],
      imageUrl: json['imageUrl'],
    );
  }

  Map<String, dynamic> toJson() => {
    'zan': zan,
    'tou': tou,
    'name': name,
    'description': description,
    'imageUrl': imageUrl,
  };
}