part of 'entities.dart';

class BookEntity {
  const BookEntity({
    this.title,
    this.author,
    this.date,
    this.cover,
    this.isNew,
  });

  factory BookEntity.fromJson(Map<String, dynamic> json) {
    return BookEntity(
      title: $cast(json['title']),
      author: $cast(json['author']),
      date: $cast(json['date']),
      cover: $cast(json['cover']),
      isNew: $cast(json['isNew']),
    );
  }

  final String? title;
  final String? author;
  final String? date;
  final String? cover;
  final bool? isNew;
}

