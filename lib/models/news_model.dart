class NewsModel {
  final int id;
  final String title;
  final String description;
  final String image;
  final String category;
  final bool isBreaking;

  NewsModel({
    required this.id,
    required this.title,
    required this.description,
    required this.image,
    required this.category,
    required this.isBreaking,
  });

  factory NewsModel.fromJson(Map<String, dynamic> json) {
    return NewsModel(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      image: json['image'],
      category: json['category'],
      isBreaking: json['is_breaking'],
    );
  }
}
