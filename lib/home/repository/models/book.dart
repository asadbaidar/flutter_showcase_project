part of 'models.dart';

class BookList extends Equatable {
  const BookList({
    this.books = const [],
    this.oldBooks = const [],
    this.newBooks = const [],
  });

  factory BookList.fromEntities(List<BookEntity> entities) {
    final books = $mapToList(entities, Book.fromEntity)?.sorted() ?? [];
    final oldBooks = <Book>[];
    final newBooks = <Book>[];

    for (final book in books) {
      if (book.isNew == true) {
        newBooks.add(book);
      } else {
        oldBooks.add(book);
      }
    }

    return BookList(
      books: books,
      oldBooks: oldBooks,
      newBooks: newBooks,
    );
  }

  final List<Book> books;
  final List<Book> oldBooks;
  final List<Book> newBooks;

  @override
  List<Object?> get props => [
        books,
        oldBooks,
        newBooks,
      ];
}

class Book extends Equatable implements Comparable<Book> {
  const Book({
    this.title,
    this.author,
    this.date,
    this.cover,
    this.isNew,
  });

  factory Book.fromEntity(BookEntity entity) {
    return Book(
      title: entity.title,
      author: entity.author,
      date: entity.date,
      cover: entity.cover,
      isNew: entity.isNew,
    );
  }

  final String? title;
  final String? author;
  final String? date;
  final String? cover;
  final bool? isNew;

  @override
  List<Object?> get props => [
        title,
        author,
        date,
        cover,
        isNew,
      ];

  @override
  int compareTo(Book other) => (title ?? '').compareTo(other.title ?? '');

  String get searchBy => '$title $author'.toLowerCase();
}
