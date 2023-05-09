import 'package:tapped_test_project/home/home.dart';

export 'models/models.dart';

part 'book_repository.dart';

abstract class BookRepository {
  Future<BookList> getBooks();
}
